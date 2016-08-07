PkrCMD_AddBot(const playerid, const params[])
{
    new gameId = 0;
    new botId = INVALID_PLAYER_ID;

    if(sscanf(params, "i", gameId))
    {
        SendClientMessage(playerid, COLOR_GREY, "DEBUG USAGE: /pkr addbot [gameId]");
        return;
    }

    botId = Pkr_FindAvailableBot();
    if(botId == INVALID_PLAYER_ID)
    {
        SendClientMessage(playerid, COLOR_RED, "No bots available, either there are no bots connected or they are all assigned to poker games!");
        return;
    }

    static amount = 50000;

    Pkr_AssignPlayerToGame(botId, gameId, amount);

    amount += 10000;

    new message[128];
    format(message, sizeof(message), "You have assigned botId: %d to gameId: %d. You can use '/pkr removebot [botId]' to remove them later.", botId, gameId);
    SendClientMessage(playerid, COLOR_GREEN, message);
    return;
}

PkrCMD_RemoveBot(const playerid, const params[])
{
    new botId = 0;
    if(sscanf(params, "i", botId))
    {
        SendClientMessage(playerid, COLOR_GREY, "USAGE: /pkr removebot [botId]");
        return;
    }

    if(!IsPlayerNPC(botId))
    {
        SendClientMessage(playerid, COLOR_RED, "You can only remove NPC players with this command.");
        return;
    }

    new gameId = Pkr_GetPlayerGame(botId);

    if(gameId == -1)
    {
        SendClientMessage(playerid, COLOR_RED, "That bot is not playing poker.");
        return;
    }

    Pkr_UnassignPlayerFromGame(botId, gameId);

    new message[128];
    format(message, sizeof(message), "You have unassigned botId: %d from gameId: %d.", botId, gameId);
    SendClientMessage(playerid, COLOR_GREEN, message);
    return;
}

#define Pkr_ForeachPlayerIdInPool(%0) \
            for(new %0 = 0, poolSize = GetPlayerPoolSize(); %0 <= poolSize; ++%0)

static Pkr_FindAvailableBot()
{
    Pkr_ForeachPlayerIdInPool(playerId)
    {
        if(!Pkr_IsPlayerOnAnyGame(playerId) && IsPlayerNPC(playerId))
            return playerId;
    }
    return INVALID_PLAYER_ID;
}
