PkrCMD_Join(const playerid) {
    if(Pkr_GetPlayerGame(playerid) != -1) {
        SendClientMessage(playerid, COLOR_RED, "You're already playing poker.");
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
        SendClientMessage(playerid, COLOR_RED, "This game is already in play.");
        return;
    }

    if(Pkr_GetAmountOfPlayersOnGame(gameId) == 6) {
        SendClientMessage(playerid, COLOR_RED, "This game is full.");
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
	return;
}
