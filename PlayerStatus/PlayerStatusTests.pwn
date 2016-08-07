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

Test:PlayerStatusWaitingFolded()
{
    // Given
    Pkr_SetPlayerStatusFolded(gameId, playerSlot);

    // When
    Pkr_SetPlayerStatusWaiting(gameId, playerSlot);
    new POKER_PLAYER_STATUS: result = Pkr_GetPlayerStatus(gameId, playerSlot);

    // Then
    ASSERT(result == POKER_PLAYER_STATUS: FOLDED);
}

TestClose:PlayerStatusWaitingFolded()
{
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: EMPTY);
}

Test:PlayerStatusWaitingAllIn()
{
    // Given
    Pkr_SetPlayerStatusAllIn(gameId, playerSlot);

    // When
    Pkr_SetPlayerStatusWaiting(gameId, playerSlot);
    new POKER_PLAYER_STATUS: result = Pkr_GetPlayerStatus(gameId, playerSlot);

    // Then
    ASSERT(result == POKER_PLAYER_STATUS: ALL_IN);
}

TestClose:PlayerStatusWaitingAllIn()
{
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: EMPTY);
}

Test:SetPlayerStatusPlaying()
{
    // When
    Pkr_SetPlayerStatusPlaying(gameId, playerSlot);
    new POKER_PLAYER_STATUS: result = Pkr_GetPlayerStatus(gameId, playerSlot);

    // Then
    ASSERT(result == POKER_PLAYER_STATUS: PLAYING);
}

TestClose:SetPlayerStatusPlaying()
{
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: EMPTY);
}

Test:SetPlayerStatusChecked()
{
    // When
    Pkr_SetPlayerStatusChecked(gameId, playerSlot);
    new POKER_PLAYER_STATUS: result = Pkr_GetPlayerStatus(gameId, playerSlot);

    // Then
    ASSERT(result == POKER_PLAYER_STATUS: CHECKED);
}

TestClose:SetPlayerStatusChecked()
{
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: EMPTY);
}

Test:SetPlayerStatusAllIn()
{
    // When
    Pkr_SetPlayerStatusAllIn(gameId, playerSlot);
    new POKER_PLAYER_STATUS: result = Pkr_GetPlayerStatus(gameId, playerSlot);

    // Then
    ASSERT(result == POKER_PLAYER_STATUS: ALL_IN);
}

TestClose:SetPlayerStatusAllIn()
{
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: EMPTY);
}

Test:SetPlayerStatusCalled()
{
    // Given
    new amount = 200;

    // When
    Pkr_SetPlayerStatusCalled(gameId, playerSlot, amount);
    new POKER_PLAYER_STATUS: result = Pkr_GetPlayerStatus(gameId, playerSlot);

    // Then
    ASSERT(result == POKER_PLAYER_STATUS: CALLED);
}

TestClose:SetPlayerStatusCalled()
{
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: EMPTY);
}

Test:SetPlayerStatusBet()
{
    // Given
    new amount = 200;

    // When
    Pkr_SetPlayerStatusBet(gameId, playerSlot, amount);
    new POKER_PLAYER_STATUS: result = Pkr_GetPlayerStatus(gameId, playerSlot);

    // Then
    ASSERT(result == POKER_PLAYER_STATUS: BET);
}

TestClose:SetPlayerStatusBet()
{
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: EMPTY);
}

Test:SetPlayerStatusRaised()
{
    // Given
    new amount = 200;

    // When
    Pkr_SetPlayerStatusRaised(gameId, playerSlot, amount);
    new POKER_PLAYER_STATUS: result = Pkr_GetPlayerStatus(gameId, playerSlot);

    // Then
    ASSERT(result == POKER_PLAYER_STATUS: RAISED);
}

TestClose:SetPlayerStatusRaised()
{
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: EMPTY);
}

Test:SetPlayerStatusFolded()
{
    // When
    Pkr_SetPlayerStatusFolded(gameId, playerSlot);
    new POKER_PLAYER_STATUS: result = Pkr_GetPlayerStatus(gameId, playerSlot);

    // Then
    ASSERT(result == POKER_PLAYER_STATUS: FOLDED);
}

TestClose:SetPlayerStatusFolded()
{
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: EMPTY);
}

Test:SetPlayerStatusSmallBlind()
{
    // When
    Pkr_SetPlayerStatusSmallBlind(gameId, playerSlot);
    new POKER_PLAYER_STATUS: result = Pkr_GetPlayerStatus(gameId, playerSlot);

    // Then
    ASSERT(result == POKER_PLAYER_STATUS: SMALL_BLIND);
}

TestClose:SetPlayerStatusSmallBlind()
{
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: EMPTY);
}

Test:SetPlayerStatusBigBlind()
{
    // When
    Pkr_SetPlayerStatusBigBlind(gameId, playerSlot);
    new POKER_PLAYER_STATUS: result = Pkr_GetPlayerStatus(gameId, playerSlot);

    // Then
    ASSERT(result == POKER_PLAYER_STATUS: BIG_BLIND);
}

TestClose:SetPlayerStatusBigBlind()
{
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: EMPTY);
}

Test:SetPlayerStatusDealer()
{
    // When
    Pkr_SetPlayerStatusDealer(gameId, playerSlot);
    new POKER_PLAYER_STATUS: result = Pkr_GetPlayerStatus(gameId, playerSlot);

    // Then
    ASSERT(result == POKER_PLAYER_STATUS: DEALER);
}

TestClose:SetPlayerStatusDealer()
{
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: EMPTY);
}

Test:PlayerStatusDealerFolded()
{
    // Given
    Pkr_SetPlayerStatusFolded(gameId, playerSlot);

    // When
    Pkr_SetPlayerStatusDealer(gameId, playerSlot);
    new POKER_PLAYER_STATUS: result = Pkr_GetPlayerStatus(gameId, playerSlot);

    // Then
    ASSERT(result == POKER_PLAYER_STATUS: FOLDED);
}

TestClose:PlayerStatusDealerFolded()
{
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: EMPTY);
}

Test:PlayerStatusDealerAllIn()
{
    // Given
    Pkr_SetPlayerStatusAllIn(gameId, playerSlot);

    // When
    Pkr_SetPlayerStatusDealer(gameId, playerSlot);
    new POKER_PLAYER_STATUS: result = Pkr_GetPlayerStatus(gameId, playerSlot);

    // Then
    ASSERT(result == POKER_PLAYER_STATUS: ALL_IN);
}

TestClose:PlayerStatusDealerAllIn()
{
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: EMPTY);
}

Test:SetPlayerStatusEvaluated()
{
    // When
    Pkr_SetPlayerStatusEvaluated(gameId, playerSlot);
    new POKER_PLAYER_STATUS: result = Pkr_GetPlayerStatus(gameId, playerSlot);

    // Then
    ASSERT(result == POKER_PLAYER_STATUS: EVALUATED);
}

TestClose:SetPlayerStatusEvaluated()
{
    Pkr_SetPlayerStatus(gameId, playerSlot, POKER_PLAYER_STATUS: EMPTY);
}

Test:SetAllPlayerStatusLobby()
{
    // Given
    new playerSlotOne = 2;
    new playerSlotTwo = 4;
    Pkr_SetPlayerId(gameId, playerSlotOne, 12);
    Pkr_SetPlayerId(gameId, playerSlotTwo, 21);

    // When
    Pkr_SetAllPlayerStatusInLobby(gameId);
    new POKER_PLAYER_STATUS: playerSlotOneStatus = Pkr_GetPlayerStatus(gameId, playerSlotOne);
    new POKER_PLAYER_STATUS: playerSlotTwoStatus = Pkr_GetPlayerStatus(gameId, playerSlotTwo);

    // Then
    ASSERT(playerSlotOneStatus == POKER_PLAYER_STATUS: LOBBY);
    ASSERT(playerSlotTwoStatus == POKER_PLAYER_STATUS: LOBBY);
}

TestClose:SetAllPlayerStatusLobby()
{
    new playerSlotOne = 2;
    new playerSlotTwo = 4;
    Pkr_SetPlayerStatus(gameId, playerSlotOne, POKER_PLAYER_STATUS: EMPTY);
    Pkr_SetPlayerStatus(gameId, playerSlotTwo, POKER_PLAYER_STATUS: EMPTY);
    Pkr_SetPlayerId(gameId, playerSlotOne, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, playerSlotTwo, INVALID_PLAYER_ID);
}

Test:SetAllPlayerStatusWaiting()
{
    // Given
    new playerSlotOne = 2;
    new playerSlotTwo = 4;
    Pkr_SetPlayerId(gameId, playerSlotOne, 12);
    Pkr_SetPlayerId(gameId, playerSlotTwo, 21);

    // When
    Pkr_SetAllPlayerStatusWaiting(gameId);
    new POKER_PLAYER_STATUS: playerSlotOneStatus = Pkr_GetPlayerStatus(gameId, playerSlotOne);
    new POKER_PLAYER_STATUS: playerSlotTwoStatus = Pkr_GetPlayerStatus(gameId, playerSlotTwo);

    // Then
    ASSERT(playerSlotOneStatus == POKER_PLAYER_STATUS: WAITING);
    ASSERT(playerSlotTwoStatus == POKER_PLAYER_STATUS: WAITING);
}

TestClose:SetAllPlayerStatusWaiting()
{
    new playerSlotOne = 2;
    new playerSlotTwo = 4;
    Pkr_SetPlayerStatus(gameId, playerSlotOne, POKER_PLAYER_STATUS: EMPTY);
    Pkr_SetPlayerStatus(gameId, playerSlotTwo, POKER_PLAYER_STATUS: EMPTY);
    Pkr_SetPlayerId(gameId, playerSlotOne, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, playerSlotTwo, INVALID_PLAYER_ID);
}

Test:CountPlayerStatus()
{
    // Given
    new playerSlotOne = 2;
    new playerSlotTwo = 4;
    new POKER_PLAYER_STATUS: status = FOLDED;
    Pkr_SetPlayerStatus(gameId, playerSlotOne, status);
    Pkr_SetPlayerStatus(gameId, playerSlotTwo, status);
    Pkr_SetPlayerId(gameId, playerSlotOne, 112);
    Pkr_SetPlayerId(gameId, playerSlotTwo, 321);

    // When
    new result = Pkr_CountPlayerStatus(gameId, status);

    // Then
    ASSERT(result == 2);
}

TestClose:CountPlayerStatus()
{
    new playerSlotOne = 2;
    new playerSlotTwo = 4;
    Pkr_SetPlayerStatus(gameId, playerSlotOne, POKER_PLAYER_STATUS: EMPTY);
    Pkr_SetPlayerStatus(gameId, playerSlotTwo, POKER_PLAYER_STATUS: EMPTY);
    Pkr_SetPlayerId(gameId, playerSlotOne, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, playerSlotTwo, INVALID_PLAYER_ID);
}
