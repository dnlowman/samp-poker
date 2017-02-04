#define Pkr_GetPlayerReady(%0) \
            GetPVarInt(%0, POKER_PLAYER_READY_VAR)

Pkr_SetPlayerReady(const gameId, const playerSlot)
{
    SetPVarInt(Pkr_GetPlayerId(gameId, playerSlot), POKER_PLAYER_READY_VAR, 1);
    Pkr_SetReadyTextDrawReady(gameId, playerSlot);
    return;
}

Pkr_SetPlayerNotReady(const gameId, const playerSlot)
{
    DeletePVar(Pkr_GetPlayerId(gameId, playerSlot), POKER_PLAYER_READY_VAR);
    Pkr_SetReadyTextDrawNotReady(gameId, playerSlot);
    return;
}

Pkr_GetPlayerReadyCount(const gameId)
{
    new count = 0;
    new playerId = INVALID_PLAYER_ID;
    Pkr_ForeachPlayer(playerSlot)
    {
        playerId = Pkr_GetPlayerId(gameId, playerSlot);
        if(playerId != INVALID_PLAYER_ID && Pkr_GetPlayerReady(playerId) == 1)
            count++;
    }
    return count;
}
