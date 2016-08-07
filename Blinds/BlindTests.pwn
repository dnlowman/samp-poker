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

Test:SetBlindsTextDrawId()
{
    // Given
    const Text: textId = Text: 1234;

    // When
    Pkr_SetBlindsTextDrawId(gameId, textId);
    new Text: result = Pkr_GetBlindsTextDrawId(gameId);

    // Then
    ASSERT(result == textId);
}

TestClose:SetBlindsTextDrawId()
{
    Pkr_SetBlindsTextDrawId(gameId, Text: INVALID_TEXT_DRAW);
}

TestInit:ShowPlayerBlindTextDraw()
{
    textDrawShowForPlayerCalls = 0;
}

Test:ShowPlayerBlindTextDraw()
{
    // Given
    const playerId = 2;

    // When
    Pkr_ShowPlayerBlindTextDraw(gameId, playerId);

    // Then
    ASSERT(textDrawShowForPlayerCalls == 1);
}

TestClose:ShowPlayerBlindTextDraw()
{
    textDrawShowForPlayerCalls = 0;
}

TestInit:HidePlayerBlindTextDraw()
{
    textDrawHideForPlayerCalls = 0;
}

Test:HidePlayerBlindTextDraw()
{
    // Given
    const playerId = 2;

    // When
    Pkr_HidePlayerBlindTextDraw(gameId, playerId);

    // Then
    ASSERT(textDrawHideForPlayerCalls == 1);
}

TestClose:HidePlayerBlindTextDraw()
{
    textDrawHideForPlayerCalls = 0;
}

TestInit:DestroyBlindTextDraw()
{
    textDrawDestroyCalls = 0;
}

Test:DestroyBlindTextDraw()
{
    // Given
    Pkr_CreateBlindTextDraw(gameId);

    // When
    Pkr_DestroyBlindTextDraw(gameId);

    // Then
    ASSERT(textDrawDestroyCalls == 1);
    ASSERT(Pkr_GetBlindsTextDrawId(gameId) == Text: INVALID_TEXT_DRAW);
}

TestClose:DestroyBlindTextDraw()
{
    textDrawDestroyCalls = 0;
}
