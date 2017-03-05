static gameId = 0;

Pkr_InitialisePlayerReadyTests()
{
    new tests, fails, func[33];
    Testing_Run(tests, fails, func);
}

Test:SetPlayerReadyTextDrawId()
{
    // Given
    const Text: textId = Text: 1234;
    const playerSlot = 1;
    Pkr_SetPlayerReadyTextDrawId(gameId, playerSlot, textId);

    // When
    new Text: result = Pkr_GetPlayerReadyTextDrawId(gameId, playerSlot);

    // Then
    ASSERT(result == textId);
}

TestInit:ShowAllPlayersReadyTD()
{
    textDrawShowForPlayerCalls = 0;
}

Test:ShowAllPlayersReadyTD()
{
    // Given
    const playerSlotOne = 2;
    const playerSlotTwo = 4;
    Pkr_SetPlayerId(gameId, playerSlotOne, 123);
    Pkr_SetPlayerId(gameId, playerSlotTwo, 124);

    // When
    Pkr_ShowAllPlayersReadyTextDraw(gameId);

	printf("Amount of calls: %d", textDrawShowForPlayerCalls);

    // Then
    ASSERT(textDrawShowForPlayerCalls == 12);
}

TestClose:ShowAllPlayersReadyTD()
{
    textDrawShowForPlayerCalls = 0;
    const playerSlotOne = 2;
    const playerSlotTwo = 4;
    Pkr_SetPlayerId(gameId, playerSlotOne, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, playerSlotTwo, INVALID_PLAYER_ID);
}

Test:ForeachReadyTextDraw()
{
    // Given
    new count = 0;

    // When
    Pkr_ForeachReadyTextDraw(textDrawSlot)
    {
        ++count;
    }

    // Then
    ASSERT(count == 6);
}
