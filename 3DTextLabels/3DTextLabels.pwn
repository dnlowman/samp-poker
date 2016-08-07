const PKR_3DTEXT_LABEL_TEXT_LENGTH = 128;

#define Pkr_Set3DTextLabelId(%0,%1) \
            g_rgPokerGames[%0][TEXT_LABEL] = %1

#define Pkr_Get3DTextLabelId(%0) \
            g_rgPokerGames[%0][TEXT_LABEL]

Pkr_Create3DTextLabel(const gameId)
{
    new Float: position[3];
    new text[PKR_3DTEXT_LABEL_TEXT_LENGTH];
    new Text3D: textId = Text3D: INVALID_3DTEXT_ID;
    Pkr_GetPosition(gameId, position[0], position[1], position[2]);
    Pkr_Generate3DLabelText(gameId, text, sizeof(text));
    textId = CreateDynamic3DTextLabel(text, COLOR_WHITE, position[0], position[1], position[2], 2.0);
    Pkr_Set3DTextLabelId(gameId, textId);
    return;
}

Pkr_Destroy3DTextLabel(const gameId)
{
    new Text3D: textId = Pkr_Get3DTextLabelId(gameId);
    DestroyDynamic3DTextLabel(textId);
    Pkr_Set3DTextLabelId(gameId, Text3D: INVALID_3DTEXT_ID);
    return;
}

Pkr_Update3DTextLabel(const gameId)
{
    new text[128];
    new Text3D: textId = Pkr_Get3DTextLabelId(gameId);
    Pkr_Generate3DLabelText(gameId, text, sizeof(text));
    UpdateDynamic3DTextLabelText(textId, COLOR_WHITE, text);
    return;
}

static Pkr_Generate3DLabelText(const gameId, message[], const size)
{
    new players = Pkr_GetAmountOfPlayersOnGame(gameId);
    format(message, size, "Texas Hold 'em Poker\nCurrent Players: %d/6\nUse /pkr join to play!", players);
    return;
}
