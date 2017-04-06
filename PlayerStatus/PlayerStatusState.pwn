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

#define Pkr_GetPlayerStatus(%0,%1) \
            g_rgPokerGames[%0][PLAYER_STATUS][%1]

#define Pkr_SetPlayerStatus(%0,%1,%2) \
            g_rgPokerGames[%0][PLAYER_STATUS][%1] = %2

stock Pkr_SetPlayerStatusInLobby(const gameId, const playerSlot) {
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: LOBBY);
    Pkr_SetPlayerStatusTextDraw(gameId, playerSlot, "LOBBY");
    return;
}

stock Pkr_SetPlayerStatusWaiting(const gameId, const playerSlot) {
    new POKER_PLAYER_STATUS: playerStatus = Pkr_GetPlayerStatus(gameId, playerSlot);

    if(playerStatus == POKER_PLAYER_STATUS: FOLDED || playerStatus == POKER_PLAYER_STATUS: ALL_IN)
        return;

    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: WAITING);
    Pkr_SetPlayerStatusTextDraw(gameId, playerSlot, "WAITING");
    return;
}

stock Pkr_SetPlayerStatusPlaying(const gameId, const playerSlot) {
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: PLAYING);
    Pkr_SetPlayerStatusTextDraw(gameId, playerSlot, "PLAYING");
    return;
}

stock Pkr_SetPlayerStatusChecked(const gameId, const playerSlot) {
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: CHECKED);
    Pkr_SetPlayerStatusTextDraw(gameId, playerSlot, "CHECKED");
    return;
}

stock Pkr_SetPlayerStatusAllIn(const gameId, const playerSlot) {
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: ALL_IN);
    Pkr_SetPlayerStatusTextDraw(gameId, playerSlot, "ALL IN");
    return;
}

stock Pkr_SetPlayerStatusCalled(const gameId, const playerSlot, const amount) {
    new text[128];
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: CALLED);
    format(text, sizeof(text), "CALLED: ~r~$%d", amount);
    Pkr_SetPlayerStatusTextDraw(gameId, playerSlot, text);
    return;
}

stock Pkr_SetPlayerStatusBet(const gameId, const playerSlot, const amount)
{
    new text[128];
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: BET);
    format(text, sizeof(text), "BET: ~r~$%d", amount);
    Pkr_SetPlayerStatusTextDraw(gameId, playerSlot, text);
    return;
}

stock Pkr_SetPlayerStatusRaised(const gameId, const playerSlot, const amount)
{
    new text[128];
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: RAISED);
    format(text, sizeof(text), "RAISED: ~r~$%d", amount);
    Pkr_SetPlayerStatusTextDraw(gameId, playerSlot, text);
    return;
}

stock Pkr_SetPlayerStatusFolded(const gameId, const playerSlot) {
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: FOLDED);
    Pkr_SetPlayerStatusTextDraw(gameId, playerSlot, "FOLDED");
    return;
}

stock Pkr_SetPlayerStatusSmallBlind(const gameId, const playerSlot)
{
    new text[128];
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: SMALL_BLIND);
    format(text, sizeof(text), "SMALL BLIND: ~r~$%d", Pkr_GetSmallBlind(gameId));
    Pkr_SetPlayerStatusTextDraw(gameId, playerSlot, text);
    return;
}

stock Pkr_SetPlayerStatusBigBlind(const gameId, const playerSlot)
{
    new text[128];
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: BIG_BLIND);
    format(text, sizeof(text), "BIG BLIND: ~r~$%d", Pkr_GetBigBlind(gameId));
    Pkr_SetPlayerStatusTextDraw(gameId, playerSlot, text);
    return;
}

stock Pkr_SetPlayerStatusDealer(const gameId, const playerSlot)
{
    if(Pkr_GetPlayerStatus(gameId, playerSlot) == POKER_PLAYER_STATUS: FOLDED || Pkr_GetPlayerStatus(gameId, playerSlot) == POKER_PLAYER_STATUS: ALL_IN)
        return;

    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: DEALER);
    Pkr_SetPlayerStatusTextDraw(gameId, playerSlot, "DEALER");
    return;
}

stock Pkr_SetPlayerStatusEvaluated(const gameId, const playerSlot)
{
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: EVALUATED);
    return;
}

Pkr_SetAllPlayerStatusInLobby(const gameId)
{
    Pkr_ForeachPlayer(playerSlot)
    {
        if(Pkr_GetPlayerId(gameId, playerSlot) == INVALID_PLAYER_ID)
            continue;

        Pkr_SetPlayerStatusInLobby(gameId, playerSlot);
    }
    return;
}

Pkr_SetAllPlayerStatusWaiting(const gameId)
{
    Pkr_ForeachPlayer(playerSlot)
    {
        if(Pkr_GetPlayerId(gameId, playerSlot) == INVALID_PLAYER_ID)
            continue;

        Pkr_SetPlayerStatusWaiting(gameId, playerSlot);
    }
    return;
}

Pkr_CountPlayerStatus(const gameId, const POKER_PLAYER_STATUS: status)
{
    new count = 0;
    Pkr_ForeachPlayer(playerSlot)
    {
        if(Pkr_GetPlayerId(gameId, playerSlot) != INVALID_PLAYER_ID && Pkr_GetPlayerStatus(gameId, playerSlot) == status)
            count++;
    }
    return count;
}

stock bool: Pkr_ActivePlayers(const gameId)
{
    new count = 0;
    Pkr_ForeachPlayer(playerSlot)
    {
        if(Pkr_GetPlayerId(gameId, playerSlot) != INVALID_PLAYER_ID && (Pkr_GetPlayerStatus(gameId, playerSlot) == POKER_PLAYER_STATUS: WAITING || Pkr_GetPlayerStatus(gameId, playerSlot) == POKER_PLAYER_STATUS: DEALER || Pkr_GetPlayerStatus(gameId, playerSlot) == POKER_PLAYER_STATUS: PLAYING || Pkr_GetPlayerStatus(gameId, playerSlot) == POKER_PLAYER_STATUS: SMALL_BLIND))
            ++count;
    }
    return count > 0;
}

// TODO: Try and simplify this logic and remove calculating the contribution
stock Pkr_HasEveryonePlayed(const gameId)
{
    new count = 0;
    Pkr_ForeachPlayer(playerSlot)
    {
        if(Pkr_GetPlayerId(gameId, playerSlot) != INVALID_PLAYER_ID &&
           (Pkr_GetPlayerStatus(gameId, playerSlot) == POKER_PLAYER_STATUS: RAISED ||
            Pkr_GetPlayerStatus(gameId, playerSlot) == POKER_PLAYER_STATUS: BET ||
            Pkr_GetPlayerStatus(gameId, playerSlot) == POKER_PLAYER_STATUS: BIG_BLIND) ||
            (Pkr_GetPlayerStatus(gameId, playerSlot) == POKER_PLAYER_STATUS: ALL_IN && Pkr_GetPlayerBetContribution(gameId, playerSlot) > 0))
        {
            ++count;
        }
    }

    return count == 0 && !Pkr_ActivePlayers(gameId) && Pkr_GetLastAggressivePlayer(gameId) != INVALID_PLAYER_ID;
}

// TODO: Try and simplify this search it might not be needed
Pkr_GetFirstPlayerWithoutStatus(const gameId, const POKER_PLAYER_STATUS: playerState)
{
    Pkr_ForeachPlayer(playerSlot)
    {
        if(Pkr_GetPlayerId(gameId, playerSlot) != INVALID_PLAYER_ID && Pkr_GetPlayerStatus(gameId, playerSlot) != playerState)
            return playerSlot;
    }
    return -1;
}
