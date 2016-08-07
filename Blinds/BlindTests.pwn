static gameId = 0;

Pkr_InitialiseBlindTests()
{
    new tests, fails, func[33];
    Testing_Run(tests, fails, func);
}

Test:SetBlind()
{
    // Given
    const blindAmount = 200;
    const expectedSmallBlind = 200;
    const expectedBigBlind = 400;

    // When
    Pkr_SetBlind(gameId, blindAmount);
    new actualSmallBlind = Pkr_GetSmallBlind(gameId);
    new actualBigBlind = Pkr_GetBigBlind(gameId);

    // Then
    ASSERT(actualSmallBlind == expectedSmallBlind);
    ASSERT(actualBigBlind == expectedBigBlind);
}
