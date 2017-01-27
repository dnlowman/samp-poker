PkrCMD_Join(const playerid) {
    if(Pkr_GetPlayerGame(playerid) != -1) {
        SendClientMessage(playerid, COLOR_RED, "You're already playing poker.");
        return;
    }

	if(GetPVarType(playerid, POKER_SPECTATE_VAR_NAME) != PLAYER_VARTYPE_NONE) {
		SendClientMessage(playerid, COLOR_RED, "You cannot join a game whilst spectating.");
		return;
	}

    new propertyId = GetPlayersCurrentProperty(playerid);

    if(propertyId == -1) {
        SendClientMessage(playerid, COLOR_RED, "You have to be inside a property to play poker.");
        return;
    }

    new objectId = furn_pokerTableCheck(propertyId, playerid);
    //new modelId = Streamer_GetIntData(STREAMER_TYPE_OBJECT , objectId, E_STREAMER_MODEL_ID);

	//|| modelId != POKER_OBJECT_MODEL

    if(objectId == INVALID_OBJECT_ID) {
        SendClientMessage(playerid, COLOR_RED, "You're not near any poker game.");
        return;
    }

    new gameId = Pkr_GetGameByObjectId(objectId);

    if(gameId == -1) {
        gameId = Pkr_CreateGameByObjectId(objectId);
    }

    if(gameId == -1) {
        SendClientMessage(playerid, COLOR_RED, "Oops! Unable to create a game right now, try again later.");
        return;
    }

    if(Pkr_GetGameStatus(gameId) != POKER_GAME_STATUS: LOBBY) {
        SendClientMessage(playerid, COLOR_RED, "This game is already in play - You can use /pkr spec to watch the game.");
        return;
    }

    if(Pkr_GetAmountOfPlayersOnGame(gameId) == 6) {
        SendClientMessage(playerid, COLOR_RED, "This game is full. - You can use /pkr spec to watch the game");
        return;
    }

    Pkr_PlayerShowDialog(playerid, gameId);
    return;
}

PkrCMD_Leave(const playerid)
{
    new _game = Pkr_GetPlayerGame(playerid);
    if(_game == -1) {
        SendClientMessage(playerid, COLOR_RED, "You're not playing poker.");
        return;
    }

    if(Pkr_UnassignPlayerFromGame(playerid, _game)) {
        SendClientMessage(playerid, COLOR_RED, "You have left the game.");
        return;
    }

    SendClientMessage(playerid, COLOR_RED, "Could not remove you from the game.");
    return;
}

PkrCMD_Mouse(const playerid)
{
    new _game = Pkr_GetPlayerGame(playerid);
    if(_game == -1) {
        SendClientMessage(playerid, COLOR_RED, "You're not playing poker.");
        return;
    }

    Pkr_ShowCursorForPlayerId(playerid);
    SendClientMessage(playerid, COLOR_ORANGE, "The mouse has been enabled.");
    return;
}

PkrCMD_Help(const playerid) {
	SendClientMessage(playerid, COLOR_ORANGE, "Poker System:");
	SendClientMessage(playerid, COLOR_ORANGE, "/pkr join - Allows you to join a poker game.");
	SendClientMessage(playerid, COLOR_ORANGE, "/pkr leave - Allows you to leave a poker game.");
	SendClientMessage(playerid, COLOR_ORANGE, "/pkr start - Allows you to start an inactive game.");
	SendClientMessage(playerid, COLOR_ORANGE, "/pkr nexthand - Allows you to reset the game back to the lobby.");
	SendClientMessage(playerid, COLOR_ORANGE, "/pkr mouse - Allows you to use the cursor for the menu.");
	SendClientMessage(playerid, COLOR_ORANGE, "/pkr spec - Allows you to spectate and stop spectating a game.");
	SendClientMessage(playerid, COLOR_ORANGE, "/pkr cam - Allows you to toggle the camera view on the table.");
	SendClientMessage(playerid, COLOR_ORANGE, "/pkr stand - Allows you to stand from a table.");
	SendClientMessage(playerid, COLOR_ORANGE, "/pkr sit - Allows you to sit at a table");
	return;
}

PkrCMD_Spectate(const playerid) {
	if(Pkr_GetPlayerGame(playerid) != -1) {
        SendClientMessage(playerid, COLOR_RED, "You're already playing poker.");
        return;
    }

	new propertyId = GetPlayersCurrentProperty(playerid);

    if(propertyId == -1) {
        SendClientMessage(playerid, COLOR_RED, "You have to be inside a property to spectate a poker game.");
        return;
    }

    new objectId = furn_pokerTableCheck(propertyId, playerid);

    if(objectId == INVALID_OBJECT_ID) {
        SendClientMessage(playerid, COLOR_RED, "You're not near any poker game.");
        return;
    }

    new gameId = Pkr_GetGameByObjectId(objectId);

	if(gameId == -1) {
		SendClientMessage(playerid, COLOR_RED, "You're not near any poker game.");
		return;
	}

	if(GetPVarType(playerid, POKER_SPECTATE_VAR_NAME) == PLAYER_VARTYPE_NONE) {
		SetPVarInt(playerid, POKER_SPECTATE_VAR_NAME, gameId);
		Pkr_ShowPlayerTextDraws(playerid, gameId);
		SendClientMessage(playerid, COLOR_GREEN, "You're now spectating this game.");
		return;
	}

	DeletePVar(playerid, POKER_SPECTATE_VAR_NAME);
	Pkr_HidePlayerTextDraws(playerid, gameId);
	SendClientMessage(playerid, COLOR_GREEN, "You're no longer spectating this game.");
	return;
}

PkrCMD_Sit(const playerid) {
	new gameId = Pkr_GetPlayerGame(playerid);
	if(gameId == -1) {
		SendClientMessage(playerid, COLOR_RED, "You're not playing poker.");
		return;
	}

	new objectId = Pkr_GetObjectId(gameId);

	PkrSys_SetPlayerCamera(playerid, objectId);
	Pkr_ShowPlayerTextDraws(playerid, gameId);
	TogglePlayerControllable(playerid, 1);
	return;
}

PkrCMD_Stand(const playerid) {
	new gameId = Pkr_GetPlayerGame(playerid);
	if(gameId == -1) {
		SendClientMessage(playerid, COLOR_RED, "You're not playing poker.");
		return;
	}

	SetCameraBehindPlayer(playerid);
	Pkr_HidePlayerTextDraws(playerid, gameId);
	TogglePlayerControllable(playerid, 0);
	return;
}
