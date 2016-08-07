static const gameId = 0;

Pkr_Initialise3DTextLabelsTests()
{
    new tests, fails, func[33];
    Testing_Run(tests, fails, func);
}

Test:Create3DTextLabel()
{
    // Given
    g_rgPokerGames[gameId][TEXT_LABEL] = INVALID_3DTEXT_ID;

    // When
    Pkr_Create3DTextLabel(gameId);

    // Then
    ASSERT(g_rgPokerGames[gameId][TEXT_LABEL] != INVALID_3DTEXT_ID);
}

TestClose:Example()
{
    g_rgPokerGames[gameId][TEXT_LABEL] = INVALID_3DTEXT_ID;
}
