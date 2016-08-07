static const gameId = 0;

Pkr_Initialise3DTextLabelsTests()
{
    new tests, fails, func[33];
    Testing_Run(tests, fails, func);
}

Test:Set3DTextLabelId()
{
    // Given
    const Text3D: textId = Text3D: 1234;

    // When
    Pkr_Set3DTextLabelId(gameId, textId);
    new Text3D: result = Pkr_Get3DTextLabelId(gameId);

    // Then
    ASSERT(result == textId);
}

TestClose:Set3DTextLabelId()
{
    Pkr_Set3DTextLabelId(gameId, Text3D: INVALID_3DTEXT_ID);
}

Test:Get3DTextLabelId()
{
    // Given
    const Text3D: textId = Text3D: 1234;
    Pkr_Set3DTextLabelId(gameId, textId);

    // When
    new Text3D: result = Pkr_Get3DTextLabelId(gameId);

    // Then
    ASSERT(result == textId);
}

Test:Create3DTextLabel()
{
    // Given
    Pkr_Set3DTextLabelId(gameId, Text3D: INVALID_3DTEXT_ID);

    // When
    Pkr_Create3DTextLabel(gameId);
    new Text3D: result = Pkr_Get3DTextLabelId(gameId);

    // Then
    ASSERT(result != Text3D: INVALID_3DTEXT_ID);
}

TestClose:Create3DTextLabel()
{
    Pkr_Set3DTextLabelId(gameId, Text3D: INVALID_3DTEXT_ID);
}

Test:Destroy3DTextLabel()
{
    // Given
    new Text3D: textId = Text3D: 1234;
    Pkr_Set3DTextLabelId(gameId, textId);

    // When
    Pkr_Destroy3DTextLabel(gameId);
    new Text3D: result = Pkr_Get3DTextLabelId(gameId);

    // Then
    ASSERT(result == Text3D: INVALID_3DTEXT_ID);
}

TestClose:Destroy3DTextLabel()
{
    Pkr_Set3DTextLabelId(gameId, Text3D: INVALID_3DTEXT_ID);
}

Test:Update3DTextLabel()
{
    // Given
    Pkr_Create3DTextLabel(gameId);
    new Text3D: textId = Pkr_Get3DTextLabelId(gameId);
    new text[128];
    new expectedText[128] = "Texas Hold 'em Poker\nCurrent Players: 2/6\nUse /pkr join to play!";

    g_rgPokerGames[gameId][PLAYERS][0] = 1;
    g_rgPokerGames[gameId][PLAYERS][1] = 2;

    Pkr_SetIsAssigned(gameId, true);

    // When
    Pkr_Update3DTextLabel(gameId);
    GetDynamic3DTextLabelText(textId, text, sizeof(text));

    // Then
    ASSERT(!strcmp(text, expectedText));
}

TestClose:Update3DTextLabel()
{
    Pkr_Destroy3DTextLabel(gameId);
    g_rgPokerGames[gameId][PLAYERS][0] = INVALID_PLAYER_ID;
    g_rgPokerGames[gameId][PLAYERS][1] = INVALID_PLAYER_ID;
    Pkr_SetIsAssigned(gameId, false);
}
