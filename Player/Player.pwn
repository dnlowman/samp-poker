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

		new propertyId = GetPlayersCurrentProperty(playerid);
		new objectId = furn_pokerTableCheck(propertyId, playerid);
		if(objectId >= 0) {
			PkrSys_SetPlayerCamera(playerid, objectId);
			SetPVarInt(playerid, POKER_CAMERA_VAR_NAME, 1);
		}

		new money = GetPlayerRealMoney(playerid) - chips;
		SetupPlayerMoney(playerid, money);

        Pkr_SendFormattedGameMessage(gameId, COLOR_RED, "%s has joined the game. (Game ID: %d)", Pkr_GetClientName(playerid), gameId);
        return true;
    }
    return false;
}

Pkr_UnassignPlayerFromGame(const playerid, const gameId) {
    new _slot = Pkr_GetPlayerSlot(playerid, gameId);
    if(_slot == -1)
        return false;

	new currentPlayer = Pkr_GetCurrentPlayerPosition(gameId);
	if(currentPlayer == _slot)
		Pkr_SetNextPlayerPlaying(gameId);

	new chips = Pkr_GetPlayerChips(gameId, _slot);
	new money = GetPlayerRealMoney(playerid) + chips;
	SetupPlayerMoney(playerid, money);

    Pkr_UnassignPlayerSlotFromGame(gameId, _slot);

    Pkr_SendFormattedGameMessage(gameId, COLOR_RED, "%s has left the game. (Game ID: %d)", Pkr_GetClientName(playerid), gameId);

	new amountOfPlayersOnGame = Pkr_GetAmountOfPlayersOnGame(gameId);
	new POKER_GAME_STATUS: status = Pkr_GetGameStatus(gameId);

	if(amountOfPlayersOnGame == 1 && status != POKER_GAME_STATUS: LOBBY) {
		new nonFoldedPlayer = Pkr_GetCurrentPlayerPosition(gameId);
		new nonFoldedPlayerId = Pkr_GetPlayerId(gameId, nonFoldedPlayer);

		Pkr_SendFormattedGameMessage(gameId, COLOR_RED, "%s wins the game due to all players leaving.", Pkr_GetClientName(nonFoldedPlayerId));
		Pkr_AddPlayerChips(gameId, nonFoldedPlayer, Pkr_GetPotAmount(gameId));
		Pkr_SetPotAmount(gameId, 0);
		Pkr_SetGameToLobby(gameId);
	}
    else if(amountOfPlayersOnGame == 0)
        Pkr_DestroyGame(gameId);

	Pkr_HideCursorForPlayerId(playerid);
	SetCameraBehindPlayer(playerid);
    return true;
}

Pkr_UnassignPlayerSlotFromGame(const gameId, const playerSlot)
{
    if(g_rgPokerGames[gameId][PLAYERS][playerSlot] == INVALID_PLAYER_ID)
        return;

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

stock Pkr_SumPotContributions(const gameId)
{
    new _total = 0;
    for(new _i = 0; _i < MAX_POKER_PLAYERS; ++_i)
    {
        if(Pkr_GetPlayerId(gameId, _i) != INVALID_PLAYER_ID && Pkr_GetPlayerStatus(gameId, _i) != POKER_PLAYER_STATUS: FOLDED)
            _total += Pkr_GetPlayerPotContribution(gameId, _i);
    }

    return _total;
}
