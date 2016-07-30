#define Pkr_GetPlayerReady(%0) \
            GetPVarInt(%0, POKER_PLAYER_READY_VAR)

#define Pkr_SetAllPlayersNotReady(%0) \
    for(new _i = 0; _i < MAX_POKER_PLAYERS; ++_i) if(Pkr_GetPlayerId(%0, _i) != INVALID_PLAYER_ID) Pkr_SetPlayerNotReady(%0, _i)

Pkr_SetPlayerReady(const gameId, const player) {
    SetPVarInt(g_rgPokerGames[gameId][PLAYERS][player], POKER_PLAYER_READY_VAR, 1);
    Pkr_SetReadyTextDrawReady(gameId, player);

    return;
}

Pkr_SetPlayerNotReady(const gameId, const player) {
    DeletePVar(g_rgPokerGames[gameId][PLAYERS][player], POKER_PLAYER_READY_VAR);
    Pkr_SetReadyTextDrawNotReady(gameId, player);

    return;
}

Pkr_GetPlayerReadyCount(const gameId)
{
    new _count = 0;
    for(new _i = 0, _playerId = 0; _i < MAX_POKER_PLAYERS; ++_i)
    {
        _playerId = Pkr_GetPlayerId(gameId, _i);
        if(g_rgPokerGames[gameId][PLAYERS][_i] != INVALID_PLAYER_ID && Pkr_GetPlayerReady(_playerId) == 1)
            _count++;
    }

    return _count;
}
