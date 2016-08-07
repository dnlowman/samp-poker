PkrCMD_AddBot(const playerid, const params[])
{
    new _gameId = 0;
    if(sscanf(params, "i", _gameId)) {
        SendClientMessage(playerid, COLOR_RED, "USAGE: /pkr addbot [gameId]");
        return;
    }

    new _bot = Pkr_FindAvailableBot();
    if(_bot == -1) {
        SendClientMessage(playerid, COLOR_RED, "Could not find an available bot.");
        return;
    }

    static amount = 50000;

    Pkr_AssignPlayerToGame(_bot, _gameId, amount);

    amount += 10000;

    new _message[128];
    format(_message, sizeof(_message), "Assigned bot: %d to game: %d.", _bot, _gameId);
    SendClientMessage(playerid, COLOR_GREEN, _message);
    return;
}

PkrCMD_RemoveBot(const playerid, const params[])
{
    new _botId = 0;
    if(sscanf(params, "i", _botId)) {
        SendClientMessage(playerid, COLOR_RED, "USAGE: /pkr removebot [botId]");
        return;
    }

    if(!IsPlayerNPC(_botId)) {
        SendClientMessage(playerid, COLOR_RED, "ERROR: That player is not a bot!");
        return;
    }

    new _game = Pkr_GetPlayerGame(_botId);

    if(_game == -1) {
        SendClientMessage(playerid, COLOR_RED, "ERROR: That bot is not playing poker.");
        return;
    }

    Pkr_UnassignPlayerFromGame(_botId, _game);

    new _message[128];
    format(_message, sizeof(_message), "Unassigned bot: %d from game: %d.", _botId, _game);
    SendClientMessage(playerid, COLOR_GREEN, _message);
    return;
}

static Pkr_FindAvailableBot() {
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; ++i)
        if(!Pkr_IsPlayerOnAnyGame(i) && IsPlayerNPC(i))
            return i;
    return -1;
}
