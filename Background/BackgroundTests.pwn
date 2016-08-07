static index = 0;

Pkr_InitialiseBackgroundTests()
{
    new tests, fails, func[33];
    Testing_Run(tests, fails, func);
}

Test:Foreach()
{
    // Given
    new count = 0;

    // When
    Pkr_ForeachBackground(background)
        ++count;

    // Then
    ASSERT(count == MAX_POKER_BACKGROUND_TEXTDRAWS);
}

Test:SetBackgroundTextDrawId()
{
    // Given
    new Text: id = Text: 1234;

    // When
    Pkr_SetBackgroundTextDrawId(index, id);
    new Text: result = Pkr_GetBackgroundTextDrawId(index);

    // Then
    ASSERT(result == id);
}

TestClose:SetBackgroundTextDrawId()
{
    Pkr_SetBackgroundTextDrawId(index, Text: INVALID_TEXT_DRAW);
}

TestInit:ShowPlayerBGTextDraws()
{
    textDrawShowForPlayerCalls = 0;
}

Test:ShowPlayerBGTextDraws()
{
    // Given
    new expectedCalls = MAX_POKER_BACKGROUND_TEXTDRAWS;
    new playerId = 0;

    // When
    Pkr_ShowPlayerBackgroundTextDraws(playerId);

    // Then
    ASSERT(textDrawShowForPlayerCalls == expectedCalls);
}

TestClose:ShowPlayerBGTextDraws()
{
    textDrawShowForPlayerCalls = 0;
}

TestInit:HidePlayerBGTextDraws()
{
    textDrawHideForPlayerCalls = 0;
}

Test:HidePlayerBGTextDraws()
{
    // Given
    new expectedCalls = MAX_POKER_BACKGROUND_TEXTDRAWS;
    new playerId = 0;

    // When
    Pkr_HidePlayerBackgroundTextDraws(playerId);

    // Then
    ASSERT(textDrawHideForPlayerCalls == expectedCalls);
}

TestClose:HidePlayerBGTextDraws()
{
    textDrawHideForPlayerCalls = 0;
}

TestInit:DestroyBGTextDraws()
{
    textDrawDestroyCalls = 0;
}

Test:DestroyBGTextDraws()
{
    // Given
    new expectedCalls = MAX_POKER_BACKGROUND_TEXTDRAWS;

    // When
    Pkr_DestroyBackgroundTextDraws();

    // Then
    ASSERT(textDrawDestroyCalls == expectedCalls);
}

TestClose:DestroyBGTextDraws()
{
    textDrawDestroyCalls = 0;
}
