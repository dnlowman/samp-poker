PkrCMD_Join(const playerid)
{
    new _game = Pkr_GetGameNearPlayer(playerid);

    if(_game == -1)
    {
        SendClientMessage(playerid, COLOR_RED, "You're not near any poker game.");
        return;
    }

    if(Pkr_GetPlayerGame(playerid) != -1) {
        SendClientMessage(playerid, COLOR_RED, "You're already playing poker.");
        return;
    }

    if(Pkr_GetGameStatus(_game) != POKER_GAME_STATUS: LOBBY)
    {
        SendClientMessage(playerid, COLOR_RED, "This game is already in play.");
        return;
    }

    if(Pkr_GetAmountOfPlayersOnGame(_game) == 6)
    {
        SendClientMessage(playerid, COLOR_RED, "This game is full.");
        return;
    }

    Pkr_PlayerShowDialog(playerid, _game);

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
