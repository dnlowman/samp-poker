PkrCMD_Join(const playerid) {
    new propertyId = GetPlayersCurrentProperty(playerid);

    if(propertyId == -1) {
        SendClientMessage(playerid, COLOR_RED, "You have to be inside a property to play poker.");
        return;
    }

    new objectId = furn_pokerTableCheck(propertyId, playerid);

    if(objectId == INVALID_OBJECT_ID) {
        SendClientMessage(playerid, COLOR_RED, "You're not near any poker game.");
        return;
    }

    // Get the game assigned to it
    new gameId = Pkr_GetGameByObjectId(objectId);

    // TODO: Create the game...
    if(gameId == -1)
    {
        SendClientMessage(playerid, COLOR_RED, "We need to create a game...");
        return;
    }

    if(Pkr_GetPlayerGame(playerid) != -1) {
        SendClientMessage(playerid, COLOR_RED, "You're already playing poker.");
        return;
    }

    if(Pkr_GetGameStatus(gameId) != POKER_GAME_STATUS: LOBBY)
    {
        SendClientMessage(playerid, COLOR_RED, "This game is already in play.");
        return;
    }

    if(Pkr_GetAmountOfPlayersOnGame(gameId) == 6)
    {
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

    SelectTextDraw(playerid, COLOR_ORANGE);
    SendClientMessage(playerid, COLOR_ORANGE, "The mouse has been enabled.");
    return;
}
