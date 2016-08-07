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

stock Pkr_CountPlayerStatus(const gameId, const POKER_PLAYER_STATUS: status)
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
    new _count = 0;
    for(new _i = 0; _i < MAX_POKER_PLAYERS; ++_i)
    {
        if(Pkr_GetPlayerId(gameId, _i) != INVALID_PLAYER_ID &&
           (Pkr_GetPlayerStatus(gameId, _i) == POKER_PLAYER_STATUS: WAITING ||
           Pkr_GetPlayerStatus(gameId, _i) == POKER_PLAYER_STATUS: DEALER ||
               Pkr_GetPlayerStatus(gameId, _i) == POKER_PLAYER_STATUS: PLAYING ||
            Pkr_GetPlayerStatus(gameId, _i) == POKER_PLAYER_STATUS: SMALL_BLIND))
        {
            ++_count;
        }
    }

    return _count > 0;
}

stock bool: Pkr_HasEveryonePlayed(const gameId)
{
    new _betCount = 0;
    for(new _i = 0; _i < MAX_POKER_PLAYERS; ++_i)
    {
        if(Pkr_GetPlayerId(gameId, _i) != INVALID_PLAYER_ID &&
           (Pkr_GetPlayerStatus(gameId, _i) == POKER_PLAYER_STATUS: RAISED ||
            Pkr_GetPlayerStatus(gameId, _i) == POKER_PLAYER_STATUS: BET ||
            Pkr_GetPlayerStatus(gameId, _i) == POKER_PLAYER_STATUS: BIG_BLIND) ||
            (Pkr_GetPlayerStatus(gameId, _i) == POKER_PLAYER_STATUS: ALL_IN && Pkr_GetPlayerBetContribution(gameId, _i) > 0))
        {
            ++_betCount;
        }
    }

    return _betCount == 0 && !Pkr_ActivePlayers(gameId) && Pkr_GetLastAggressivePlayer(gameId) != INVALID_PLAYER_ID;
}

stock Pkr_GetFirstPlayerWithStatus(const gameId, const POKER_PLAYER_STATUS: playerState)
{
    for(new _i = 0; _i < MAX_POKER_PLAYERS; ++_i)
        if(Pkr_GetPlayerStatus(gameId, _i) == playerState)
            return _i;

    return -1;
}

stock Pkr_GetFirstPlayerWithoutStatus(const gameId, const POKER_PLAYER_STATUS: playerState)
{
    for(new _i = 0; _i < MAX_POKER_PLAYERS; ++_i)
        if(Pkr_GetPlayerStatus(gameId, _i) != playerState)
            return _i;

    return -1;
}
