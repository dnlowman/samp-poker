static const gameId = 0;
static const playerSlot = 1;

Pkr_InitialisePlayerStatusTests()
{
    new tests, fails, func[33];
    Testing_Run(tests, fails, func);
}

Test:SetPlayerStatus()
{
    // Given
    new POKER_PLAYER_STATUS: playerStatus = POKER_PLAYER_STATUS: LOBBY;

    // When
    Pkr_SetPlayerStatus(gameId, playerSlot, playerStatus);
    new POKER_PLAYER_STATUS: result = Pkr_GetPlayerStatus(gameId, playerSlot);

    // Then
    ASSERT(result == playerStatus);
}

TestClose:SetPlayerStatus()
{
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: EMPTY);
}

Test:SetPlayerStatusInLobby()
{
    // When
    Pkr_SetPlayerStatusInLobby(gameId, playerSlot);
    new POKER_PLAYER_STATUS: result = Pkr_GetPlayerStatus(gameId, playerSlot);

    // Then
    ASSERT(result == POKER_PLAYER_STATUS: LOBBY);
}

TestClose:SetPlayerStatusInLobby()
{
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: EMPTY);
}

Test:SetPlayerStatusWaiting()
{
    // When
    Pkr_SetPlayerStatusWaiting(gameId, playerSlot);
    new POKER_PLAYER_STATUS: result = Pkr_GetPlayerStatus(gameId, playerSlot);

    // Then
    ASSERT(result == POKER_PLAYER_STATUS: WAITING);
}

TestClose:SetPlayerStatusWaiting()
{
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: EMPTY);
}
