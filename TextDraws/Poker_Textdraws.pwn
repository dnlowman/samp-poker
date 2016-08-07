Pkr_ShowPlayerTextDraws(const playerId, const gameId)
{
    Pkr_ShowPlayerBackgroundTextDraws(playerId);
    Pkr_ShowPlayerReadyTextDraw(playerId, gameId);
    Pkr_ShowPlayerMenuTextDraws(playerId, gameId);
    Pkr_ShowPlayerStatusTextDraw(playerId, gameId);
    Pkr_ShowPlayerChipsTextDraw(playerId, gameId);
    Pkr_ShowPlayerPotTextDraw(playerId, gameId);
    Pkr_ShowPlayerBlindTextDraw(playerId, gameId);
    Pkr_ShowPlayerCardTextDraws(playerId, gameId);
    Pkr_ShowTableCardTextDraws(playerId, gameId);
    return;
}

Pkr_HidePlayerTextDraws(const playerId, const gameId)
{
    Pkr_HidePlayerBackgroundTextDraws(playerId);
    Pkr_HidePlayerReadyTextDraw(playerId, gameId);
    Pkr_HidePlayerMenuTextDraws(playerId, gameId);
    Pkr_HidePlayerStatusTextDraw(playerId, gameId);
    Pkr_HidePlayerChipsTextDraw(playerId, gameId);
    Pkr_HidePlayerPotTextDraw(playerId, gameId);
    Pkr_HidePlayerBlindTextDraw(playerId, gameId);
    Pkr_HidePlayerCardTextDraws(playerId, gameId);
    Pkr_HideTableCardTextDraws(playerId, gameId);
    return;
}

Pkr_CreateGameTextDraws(const gameId)
{
    if(g_rgPokerBackground[0] == Text: INVALID_TEXT_DRAW)
        Pkr_CreateBackgroundTextDraws();

    Pkr_CreateMenuTextDraws(gameId);
    Pkr_CreateReadyTextDraws(gameId);
    Pkr_CreatePlayerStatusTDs(gameId);
    Pkr_CreatePlayerChipsTDs(gameId);
    Pkr_CreatePotTextDraw(gameId);
    Pkr_CreateBlindTextDraw(gameId);
    Pkr_CreatePlayerCardTDs(gameId);
    Pkr_CreateTableCardTextDraws(gameId);
    return;
}

Pkr_DestroyGameTextDraws(const gameId)
{
    if(Pkr_GetGameCount() == 0)
        Pkr_DestroyBackgroundTextDraws();

    Pkr_DestroyReadyTextDraws(gameId);
    Pkr_DestroyPotTextDraw(gameId);
    Pkr_DestroyPlayerStatusTDs(gameId);
    Pkr_DestroyPlayerChipsTDs(gameId);
    Pkr_DestroyMenuTextDraws(gameId);
    Pkr_DestroyBlindTextDraw(gameId);
    Pkr_DestroyPlayerCardTDs(gameId);
    Pkr_DestroyTableCardTextDraws(gameId);
    return;
}
