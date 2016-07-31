#define Pkr_ShowPlayerMenuTextDraws(%0,%1) \
            for(new _i; _i < MAX_POKER_MENU_ITEMS; ++_i) TextDrawShowForPlayer(%0, g_rgPokerGames[%1][MENU_TEXTDRAWS][_i])

#define Pkr_HidePlayerMenuTextDraws(%0,%1) \
            for(new _i; _i < MAX_POKER_MENU_ITEMS; ++_i) TextDrawHideForPlayer(%0, g_rgPokerGames[%1][MENU_TEXTDRAWS][_i])

#define Pkr_SetMenuItemOneBet(%0) \
    TextDrawSetString(g_rgPokerGames[%0][MENU_TEXTDRAWS][1], "BET")

#define Pkr_SetMenuItemOneRaise(%0) \
    TextDrawSetString(g_rgPokerGames[%0][MENU_TEXTDRAWS][1], "RAISE")

#define Pkr_SetMenuItemTwoCheck(%0) \
    TextDrawSetString(g_rgPokerGames[%0][MENU_TEXTDRAWS][2], "CHECK")

#define Pkr_SetMenuItemTwoCall(%0) \
    TextDrawSetString(g_rgPokerGames[%0][MENU_TEXTDRAWS][2], "CALL")

Pkr_CreateMenuTextDraws(const gameId)
{
    g_rgPokerGames[gameId][MENU_TEXTDRAWS][0] = TextDrawCreate(315.000000, 270.000000, "ALL IN");
    TextDrawAlignment(g_rgPokerGames[gameId][MENU_TEXTDRAWS][0], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][MENU_TEXTDRAWS][0], 255);
    TextDrawFont(g_rgPokerGames[gameId][MENU_TEXTDRAWS][0], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][MENU_TEXTDRAWS][0], 0.300000, 1.000000);
    TextDrawColor(g_rgPokerGames[gameId][MENU_TEXTDRAWS][0], -1);
    TextDrawSetOutline(g_rgPokerGames[gameId][MENU_TEXTDRAWS][0], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][MENU_TEXTDRAWS][0], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][MENU_TEXTDRAWS][0], 0);
    TextDrawTextSize(g_rgPokerGames[gameId][MENU_TEXTDRAWS][0], 5, 64);
    TextDrawSetSelectable(g_rgPokerGames[gameId][MENU_TEXTDRAWS][0], 1);

    g_rgPokerGames[gameId][MENU_TEXTDRAWS][1] = TextDrawCreate(315.000000, 281.000000, "BET");
    TextDrawAlignment(g_rgPokerGames[gameId][MENU_TEXTDRAWS][1], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][MENU_TEXTDRAWS][1], 255);
    TextDrawFont(g_rgPokerGames[gameId][MENU_TEXTDRAWS][1], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][MENU_TEXTDRAWS][1], 0.300000, 1.000000);
    TextDrawColor(g_rgPokerGames[gameId][MENU_TEXTDRAWS][1], -1);
    TextDrawSetOutline(g_rgPokerGames[gameId][MENU_TEXTDRAWS][1], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][MENU_TEXTDRAWS][1], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][MENU_TEXTDRAWS][1], 0);
    TextDrawTextSize(g_rgPokerGames[gameId][MENU_TEXTDRAWS][1], 5, 64);
    TextDrawSetSelectable(g_rgPokerGames[gameId][MENU_TEXTDRAWS][1], 1);

    g_rgPokerGames[gameId][MENU_TEXTDRAWS][2] = TextDrawCreate(315.000000, 292.000000, "CALL");
    TextDrawAlignment(g_rgPokerGames[gameId][MENU_TEXTDRAWS][2], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][MENU_TEXTDRAWS][2], 255);
    TextDrawFont(g_rgPokerGames[gameId][MENU_TEXTDRAWS][2], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][MENU_TEXTDRAWS][2], 0.300000, 1.000000);
    TextDrawColor(g_rgPokerGames[gameId][MENU_TEXTDRAWS][2], -1);
    TextDrawSetOutline(g_rgPokerGames[gameId][MENU_TEXTDRAWS][2], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][MENU_TEXTDRAWS][2], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][MENU_TEXTDRAWS][2], 0);
    TextDrawTextSize(g_rgPokerGames[gameId][MENU_TEXTDRAWS][2], 5, 64);
    TextDrawSetSelectable(g_rgPokerGames[gameId][MENU_TEXTDRAWS][2], 1);

    g_rgPokerGames[gameId][MENU_TEXTDRAWS][3] = TextDrawCreate(315.000000, 302.000000, "FOLD");
    TextDrawAlignment(g_rgPokerGames[gameId][MENU_TEXTDRAWS][3], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][MENU_TEXTDRAWS][3], 255);
    TextDrawFont(g_rgPokerGames[gameId][MENU_TEXTDRAWS][3], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][MENU_TEXTDRAWS][3], 0.300000, 1.000000);
    TextDrawColor(g_rgPokerGames[gameId][MENU_TEXTDRAWS][3], -1);
    TextDrawSetOutline(g_rgPokerGames[gameId][MENU_TEXTDRAWS][3], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][MENU_TEXTDRAWS][3], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][MENU_TEXTDRAWS][3], 0);
    TextDrawTextSize(g_rgPokerGames[gameId][MENU_TEXTDRAWS][3], 5, 64);
    TextDrawSetSelectable(g_rgPokerGames[gameId][MENU_TEXTDRAWS][3], 1);

    return;
}

Pkr_DestroyMenuTextDraws(const gameId)
{
    for(new _i = 0; _i < MAX_POKER_MENU_ITEMS; ++_i)
    {
        TextDrawDestroy(g_rgPokerGames[gameId][MENU_TEXTDRAWS][_i]);
        g_rgPokerGames[gameId][MENU_TEXTDRAWS][_i] = Text: INVALID_TEXT_DRAW;
    }

    return;
}
