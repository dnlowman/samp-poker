stock Pkr_SetAllPlayersStatus(const gameId, const POKER_PLAYER_STATUS: playerState)
{
    for(new _i = 0; _i < MAX_POKER_PLAYERS; ++_i)
    {
        if(Pkr_GetPlayerId(gameId, _i) != INVALID_PLAYER_ID)
        {
            switch(playerState)
            {
                case (POKER_PLAYER_STATUS: LOBBY):
                    Pkr_SetPlayerStatusInLobby(gameId, _i);

                case (POKER_PLAYER_STATUS: WAITING):
                    Pkr_SetPlayerStatusWaiting(gameId, _i);
            }
        }
    }
}

stock Pkr_CountPlayerStatus(const gameId, const POKER_PLAYER_STATUS: playerState)
{
    new _count = 0;
    for(new _i = 0; _i < MAX_POKER_PLAYERS; ++_i)
    {
        if(Pkr_GetPlayerId(gameId, _i) != INVALID_PLAYER_ID && Pkr_GetPlayerStatus(gameId, _i) == playerState)
            _count++;
    }

    return _count;
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
            Pkr_GetPlayerStatus(gameId, _i) == POKER_PLAYER_STATUS: BIG_BLIND))
        {
            ++_betCount;
        }
    }

    Pkr_SendFormattedGameMessage(gameId, COLOR_RED, "Total players who have bet: %d", _betCount);

    return _betCount == 0 && !Pkr_ActivePlayers(gameId);
}

stock Pkr_SetPlayerStatusInLobby(const gameId, const slot) {
    g_rgPokerGames[gameId][PLAYER_STATUS][slot] = POKER_PLAYER_STATUS: LOBBY;
    Pkr_SetPlayerStatusTextDraw(gameId, slot, "LOBBY");

    return;
}

stock Pkr_SetPlayerStatusWaiting(const gameId, const slot) {
    if(Pkr_GetPlayerStatus(gameId, slot) == POKER_PLAYER_STATUS: FOLDED)
        return;

    g_rgPokerGames[gameId][PLAYER_STATUS][slot] = POKER_PLAYER_STATUS: WAITING;
    Pkr_SetPlayerStatusTextDraw(gameId, slot, "WAITING");

    return;
}

stock Pkr_SetPlayerStatusPlaying(const gameId, const slot) {
    g_rgPokerGames[gameId][PLAYER_STATUS][slot] = POKER_PLAYER_STATUS: PLAYING;
    Pkr_SetPlayerStatusTextDraw(gameId, slot, "PLAYING");

    return;
}

stock Pkr_SetPlayerStatusChecked(const gameId, const slot) {
    g_rgPokerGames[gameId][PLAYER_STATUS][slot] = POKER_PLAYER_STATUS: CHECKED;
    Pkr_SetPlayerStatusTextDraw(gameId, slot, "CHECKED");

    return;
}

stock Pkr_SetPlayerStatusAllIn(const gameId, const slot) {
    g_rgPokerGames[gameId][PLAYER_STATUS][slot] = POKER_PLAYER_STATUS: ALL_IN;
    Pkr_SetPlayerStatusTextDraw(gameId, slot, "ALL IN");
    return;
}

stock Pkr_SetPlayerStatusCalled(const gameId, const slot, const amount) {
    g_rgPokerGames[gameId][PLAYER_STATUS][slot] = POKER_PLAYER_STATUS: CALLED;
    new _format[128];
    format(_format, sizeof(_format), "CALLED: ~r~$%d", amount);
    Pkr_SetPlayerStatusTextDraw(gameId, slot, _format);
    return;
}

stock Pkr_SetPlayerStatusBet(const gameId, const slot, const amount)
{
    g_rgPokerGames[gameId][PLAYER_STATUS][slot] = POKER_PLAYER_STATUS: BET;
    new _format[128];
    format(_format, sizeof(_format), "BET: ~r~$%d", amount);
    Pkr_SetPlayerStatusTextDraw(gameId, slot, _format);
    return;
}

stock Pkr_SetPlayerStatusRaised(const gameId, const slot, const amount)
{
    g_rgPokerGames[gameId][PLAYER_STATUS][slot] = POKER_PLAYER_STATUS: RAISED;
    new _format[128];
    format(_format, sizeof(_format), "RAISED: ~r~$%d", amount);
    Pkr_SetPlayerStatusTextDraw(gameId, slot, _format);
    return;
}

stock Pkr_SetPlayerStatusFolded(const gameId, const slot) {
    g_rgPokerGames[gameId][PLAYER_STATUS][slot] = POKER_PLAYER_STATUS: FOLDED;
    Pkr_SetPlayerStatusTextDraw(gameId, slot, "FOLDED");
    return;
}

stock Pkr_SetPlayerStatusSmallBlind(const gameId, const playerSlot)
{
    g_rgPokerGames[gameId][PLAYER_STATUS][playerSlot] = POKER_PLAYER_STATUS: SMALL_BLIND;
    new _format[128];
    format(_format, sizeof(_format), "SMALL BLIND: ~r~$%d", Pkr_GetSmallBlind(gameId));
    Pkr_SetPlayerStatusTextDraw(gameId, playerSlot, _format);

    return;
}

stock Pkr_SetPlayerStatusBigBlind(const gameId, const playerSlot)
{
    g_rgPokerGames[gameId][PLAYER_STATUS][playerSlot] = POKER_PLAYER_STATUS: BIG_BLIND;
    new _format[128];
    format(_format, sizeof(_format), "BIG BLIND: ~r~$%d", Pkr_GetBigBlind(gameId));
    Pkr_SetPlayerStatusTextDraw(gameId, playerSlot, _format);

    return;
}

stock Pkr_SetPlayerStatusDealer(const gameId, const playerSlot)
{
    g_rgPokerGames[gameId][PLAYER_STATUS][playerSlot] = POKER_PLAYER_STATUS: DEALER;
    Pkr_SetPlayerStatusTextDraw(gameId, playerSlot, "DEALER");

    return;
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
