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

#if defined POKER_DEBUG

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

static Pkr_FindAvailableBot()
{
    Pkr_ForeachPlayerIdInPool(playerId)
    {
        if(!Pkr_IsPlayerOnAnyGame(playerId) && IsPlayerNPC(playerId))
            return playerId;
    }
    return INVALID_PLAYER_ID;
}

#endif
