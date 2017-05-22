/*
                    	© Los Santos Role Play 2017
                       		Texas Hold 'em Poker

							Release Candidate 1
--------------------------------------------------------------------------------

Description:
    A complete Texas Hold 'em Poker mini-game
    for San Andreas Multiplayer.

--------------------------------------------------------------------------------

Author(s):
    Noble -
        Game scripting.
        San Andreas Multiplayer plugin port.

    Cactus Kev -
        Hand Evaluator
        (http://www.suffecool.net/poker/evaluator.html)

    Paul Senzee -
        Hash optimizations.

--------------------------------------------------------------------------------

Special Thanks:
    Los Santos Role Play development team.
    San Andreas Mutliplayer development team.
    Los Santos Role Play tester team.

--------------------------------------------------------------------------------

License:
	Please see the enclosed LICENSE file in the repository.

*/

#define Pkr_IsPlayerOnAnyGame(%0) \
            (Pkr_GetPlayerGame(%0) != -1)

Pkr_GetPlayerGame(const playerid) {
    for(new _i = 0; _i < MAX_POKER_GAMES; ++_i) {
        new _slot = Pkr_GetPlayerSlot(playerid, _i);
        if(_slot != -1)
            return _i;
    }
    return -1;
}

Pkr_GetPlayerSlot(const playerid, const gameId) {
    for(new _i = 0; _i < MAX_POKER_PLAYERS; ++_i) {
        if(g_rgPokerGames[gameId][PLAYERS][_i] == playerid) {
            return _i;
        }
    }
    return -1;
}

bool: Pkr_AssignPlayerToGame(const playerid, const gameId, const chips) {
    if(Pkr_GetIsAssigned(gameId) == true) {
        new _slot = Pkr_GetAvailablePlayerSlot(gameId);
        if(_slot == -1) {
            return false;
        }
        g_rgPokerGames[gameId][PLAYERS][_slot] = playerid;
        Pkr_ShowPlayerTextDraws(playerid, gameId);
        Pkr_SetPlayerNotReady(gameId, _slot);
        Pkr_SetPlayerChips(gameId, _slot, chips);
        Pkr_SetPlayerStatusInLobby(gameId, _slot);
        Pkr_CreatePlayerPrivateCardTDs(gameId, _slot);
        Pkr_ShowCursorForPlayerId(playerid);

		new objectId = furn_pokerTableCheck(GetPlayerVirtualWorld(playerid), playerid);
		if(objectId >= 0) {
			PkrSys_SetPlayerCamera(playerid, objectId);
			SetPVarInt(playerid, POKER_CAMERA_VAR_NAME, 1);
		}

		TogglePlayerControllable(playerid, 0);
		SetupPlayerMoney(playerid, -chips);
		SetPVarInt(playerid, POKER_SIT_VAR_NAME, 1);
        Pkr_SendFormattedGameMessage(gameId, COLOR_RED, "%s has joined the game. (Game ID: %d)", Pkr_GetClientName(playerid), gameId);
        Pkr_Log("%s has joined GameId: %d with: $%d chips.", Pkr_GetClientName(playerid), gameId, chips);
        return true;
    }
    return false;
}

Pkr_UnassignPlayerFromGame(const playerid, const gameId) {
    new _slot = Pkr_GetPlayerSlot(playerid, gameId);
    if(_slot == -1)
        return false;

	new currentPlayer = Pkr_GetCurrentPlayerPosition(gameId);
	new POKER_GAME_STATUS: gameStatus = Pkr_GetGameStatus(gameId);
	if(currentPlayer == _slot && gameStatus != POKER_GAME_STATUS: LOBBY && gameStatus != POKER_GAME_STATUS: EVALUATION)
		Pkr_SetNextPlayerPlaying(gameId);

	new chips = Pkr_GetPlayerChips(gameId, _slot);
	SetupPlayerMoney(playerid, chips);

    Pkr_UnassignPlayerSlotFromGame(gameId, _slot);

    Pkr_SendFormattedGameMessage(gameId, COLOR_RED, "%s has left the game. (Game ID: %d)", Pkr_GetClientName(playerid), gameId);
    Pkr_Log("%s has left GameId: %d with: $%d chips.", Pkr_GetClientName(playerid), gameId, chips);

	new amountOfPlayersOnGame = Pkr_GetAmountOfPlayersOnGame(gameId);
	new POKER_GAME_STATUS: status = Pkr_GetGameStatus(gameId);

	if(amountOfPlayersOnGame == 1 && status != POKER_GAME_STATUS: LOBBY) {
		new nonFoldedPlayer = Pkr_GetCurrentPlayerPosition(gameId);
		new nonFoldedPlayerId = Pkr_GetPlayerId(gameId, nonFoldedPlayer);

		new pot = Pkr_GetPotAmount(gameId);
		new rakeAmount = Pkr_TakeRake(gameId, pot);
		if(rakeAmount > 0)
			pot -= rakeAmount;

		Pkr_SendFormattedGameMessage(gameId, COLOR_RED, "%s wins the game due to all players leaving.", Pkr_GetClientName(nonFoldedPlayerId));
        Pkr_Log("%s wins GameId: %d due to all players leaving.", Pkr_GetClientName(nonFoldedPlayerId), gameId);
		Pkr_AddPlayerChips(gameId, nonFoldedPlayer, pot);
		Pkr_SetPotAmount(gameId, 0);
		Pkr_SetGameToLobby(gameId);
	}
    else if(amountOfPlayersOnGame == 0)
        Pkr_DestroyGame(gameId);

	Pkr_HideCursorForPlayerId(playerid);
	TogglePlayerControllable(playerid, 1);
    return true;
}

Pkr_UnassignPlayerSlotFromGame(const gameId, const playerSlot)
{
	new playerid = Pkr_GetPlayerId(gameId, playerSlot);

	if(playerid == INVALID_PLAYER_ID)
        return;

	SetCameraBehindPlayer(playerid);
	DeletePVar(playerid, POKER_SIT_VAR_NAME);

	new POKER_GAME_STATUS: gameStatus = Pkr_GetGameStatus(gameId);

	if(gameStatus == POKER_GAME_STATUS: LOBBY)
		Pkr_ClearPlayerCards(gameId, playerSlot);

    Pkr_DestroyPlayerPrivateCardTDs(gameId, playerSlot);
    Pkr_SetReadyTextDrawEmpty(gameId, playerSlot);
    Pkr_SetPlayerChipsTextDraw(gameId, playerSlot, "_");
    Pkr_SetPlayerStatusTextDrawEmpty(gameId, playerSlot);
    Pkr_HidePlayerTextDraws(Pkr_GetPlayerId(gameId, playerSlot), gameId);
    Pkr_RemovePlayerVars(gameId, playerSlot);
}

#define Pkr_UnassignAllPlayers(%0) \
            for(new _i = 0; _i < MAX_POKER_PLAYERS; ++_i) Pkr_UnassignPlayerSlotFromGame(%0, _i)

Pkr_UnassignAllSpectators(const gameId) {
	Pkr_ForeachPlayerIdInPool(playerid) {
		if(GetPVarType(playerid, POKER_SPECTATE_VAR_NAME) != PLAYER_VARTYPE_NONE && GetPVarInt(playerid, POKER_SPECTATE_VAR_NAME) == gameId)
			Pkr_HidePlayerTextDraws(playerid, gameId);
	}
	return;
}

Pkr_GetAmountOfPlayersOnGame(const gameId) {
    if(Pkr_GetIsAssigned(gameId) == true) {
        new _count = 0;
        for(new _i = 0; _i < MAX_POKER_PLAYERS; ++_i) {
            if(g_rgPokerGames[gameId][PLAYERS][_i] != INVALID_PLAYER_ID)
                ++_count;
        }
        return _count;
    }
    return -1;
}

Pkr_GetAmountOfJoiningPlayers(const gameId) {
	new count = 0;
	Pkr_ForeachPlayerIdInPool(playerid) {
		if(GetPVarInt(playerid, "Pkr_SitGameId") == gameId)
			++count;
	}
	return count;
}

Pkr_GetAvailablePlayerSlot(const gameId) {
    if(Pkr_GetIsAssigned(gameId) == false)
        return -1;

    for(new _i = 0; _i < MAX_POKER_PLAYERS; ++_i) {
        if(g_rgPokerGames[gameId][PLAYERS][_i] == INVALID_PLAYER_ID)
            return _i;
    }
    return -1;
}

stock Pkr_GetGameNearPlayer(const playerid) {
    for(new _i = 0, Float: _pos[3], Float: _distance; _i < MAX_POKER_GAMES; ++_i) {
        Pkr_GetPosition(_i, _pos[0], _pos[1], _pos[2]);
        _distance = GetPlayerDistanceFromPoint(playerid, _pos[0], _pos[1], _pos[2]);
        if(_distance < 1.6 && Pkr_GetIsAssigned(_i))
            return _i;
    }
    return -1;
}

stock Pkr_GetTableNearPlayer(const playerid) {
    new Float: positionX = 0.0,
        Float: positionY = 0.0,
        Float: positionZ = 0.0,
        Float: distance = 0.0;

    new objectId = INVALID_OBJECT_ID;

    Pkr_ForeachTable(table) {
        if(!TM_DoesIndexContainTable(table))
            continue;

        objectId = TM_GetTableObjectId(table);
        GetDynamicObjectPos(objectId, positionX, positionY, positionZ);

        distance = GetPlayerDistanceFromPoint(playerid, positionX, positionY, positionZ);
        if(distance < 1.6)
            return objectId;
    }

    return INVALID_OBJECT_ID;
}

Pkr_RemovePlayerVars(const gameId, const player) {
    DeletePVar(g_rgPokerGames[gameId][PLAYERS][player], POKER_PLAYER_READY_VAR);
    g_rgPokerGames[gameId][PLAYERS][player] = INVALID_PLAYER_ID;
    g_rgPokerGames[gameId][PLAYER_CHIPS][player] = 0;
    g_rgPokerGames[gameId][PLAYER_STATUS][player] = POKER_PLAYER_STATUS: EMPTY;
    return;
}
