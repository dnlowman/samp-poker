Pkr_Create3DTextLabel(gameId) {
    new Float: _pos[3];
    Pkr_GetPosition(gameId, _pos[0], _pos[1], _pos[2]);
    new _message[128];
    Pkr_Generate3DLabelText(gameId, _message, sizeof(_message));
    g_rgPokerGames[gameId][TEXT_LABEL] = CreateDynamic3DTextLabel(_message, COLOR_WHITE, _pos[0], _pos[1], _pos[2], 2.0);
    return;
}

Pkr_Destroy3DTextLabel(gameId) {
    DestroyDynamic3DTextLabel(g_rgPokerGames[gameId][TEXT_LABEL]);
    g_rgPokerGames[gameId][TEXT_LABEL] = Text3D: INVALID_3DTEXT_ID;
    return;
}

Pkr_Update3DTextLabel(gameId) {
    new _message[128];
    Pkr_Generate3DLabelText(gameId, _message, sizeof(_message));
    UpdateDynamic3DTextLabelText(g_rgPokerGames[gameId][TEXT_LABEL], COLOR_WHITE, _message);
    return;
}

Pkr_Generate3DLabelText(gameId, message[], size) {
    new _players = Pkr_GetAmountOfPlayersOnGame(gameId);
    format(message, size, "Texas Hold 'em Poker\nCurrent Players: %d/6\nUse /pkr join to play!", _players);
    return;
}
