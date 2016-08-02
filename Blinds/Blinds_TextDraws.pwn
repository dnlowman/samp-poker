#define Pkr_ShowPlayerBlindTextDraw(%0,%1) \
            TextDrawShowForPlayer(%0, g_rgPokerGames[%1][POKER_BLINDS_TEXTDRAW])

#define Pkr_HidePlayerBlindTextDraw(%0,%1) \
            TextDrawHideForPlayer(%0, g_rgPokerGames[%1][POKER_BLINDS_TEXTDRAW])

#define Pkr_SetBlindTextDraw(%0,%1) \
            TextDrawSetString(g_rgPokerGames[%0][POKER_BLINDS_TEXTDRAW], %1)

Pkr_CreateBlindTextDraw(const gameId) {
    g_rgPokerGames[gameId][POKER_BLINDS_TEXTDRAW] = TextDrawCreate(317.000000, 244.000000, "BLINDS: ~y~$100 ~w~/ ~y~$200");
    TextDrawAlignment(g_rgPokerGames[gameId][POKER_BLINDS_TEXTDRAW], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][POKER_BLINDS_TEXTDRAW], 255);
    TextDrawFont(g_rgPokerGames[gameId][POKER_BLINDS_TEXTDRAW], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][POKER_BLINDS_TEXTDRAW], 0.210000, 1.300000);
    TextDrawColor(g_rgPokerGames[gameId][POKER_BLINDS_TEXTDRAW], -1);
    TextDrawSetOutline(g_rgPokerGames[gameId][POKER_BLINDS_TEXTDRAW], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][POKER_BLINDS_TEXTDRAW], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][POKER_BLINDS_TEXTDRAW], 1);
    TextDrawSetSelectable(g_rgPokerGames[gameId][POKER_BLINDS_TEXTDRAW], 0);

    return;
}

Pkr_DestroyBlindTextDraw(const gameId) {
    TextDrawDestroy(g_rgPokerGames[gameId][POKER_BLINDS_TEXTDRAW]);
    g_rgPokerGames[gameId][POKER_BLINDS_TEXTDRAW] = Text: INVALID_TEXT_DRAW;

    return;
}
