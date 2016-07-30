new Text: g_rgPokerBackground[MAX_POKER_BACKGROUND_TEXTDRAWS] = { Text: INVALID_TEXT_DRAW, ... };

#define Pkr_ShowPlayerBackgroundTextDraws(%0) \
            for(new _i = 0; _i < MAX_POKER_BACKGROUND_TEXTDRAWS; ++_i) TextDrawShowForPlayer(%0, g_rgPokerBackground[_i])

#define Pkr_HidePlayerBackgroundTextDraws(%0) \
            for(new _i = 0; _i < MAX_POKER_BACKGROUND_TEXTDRAWS; ++_i) TextDrawHideForPlayer(%0, g_rgPokerBackground[_i])

Pkr_CreateBackgroundTextDraws()
{
    g_rgPokerBackground[0] = TextDrawCreate(202.000000, 266.000000, "_");
    TextDrawBackgroundColor(g_rgPokerBackground[0], 255);
    TextDrawFont(g_rgPokerBackground[0], 0);
    TextDrawLetterSize(g_rgPokerBackground[0], 1.500000, 4.400000);
    TextDrawColor(g_rgPokerBackground[0], -1);
    TextDrawSetOutline(g_rgPokerBackground[0], 0);
    TextDrawSetProportional(g_rgPokerBackground[0], 1);
    TextDrawSetShadow(g_rgPokerBackground[0], 1);
    TextDrawUseBox(g_rgPokerBackground[0], 1);
    TextDrawBoxColor(g_rgPokerBackground[0], 255);
    TextDrawTextSize(g_rgPokerBackground[0], 264.000000, 50.000000);
    TextDrawSetSelectable(g_rgPokerBackground[0], 0);

    g_rgPokerBackground[1] = TextDrawCreate(150.000000, 203.000000, "_");
    TextDrawBackgroundColor(g_rgPokerBackground[1], 255);
    TextDrawFont(g_rgPokerBackground[1], 0);
    TextDrawLetterSize(g_rgPokerBackground[1], 1.500000, 4.400000);
    TextDrawColor(g_rgPokerBackground[1], -1);
    TextDrawSetOutline(g_rgPokerBackground[1], 0);
    TextDrawSetProportional(g_rgPokerBackground[1], 1);
    TextDrawSetShadow(g_rgPokerBackground[1], 1);
    TextDrawUseBox(g_rgPokerBackground[1], 1);
    TextDrawBoxColor(g_rgPokerBackground[1], 255);
    TextDrawTextSize(g_rgPokerBackground[1], 212.000000, 50.000000);
    TextDrawSetSelectable(g_rgPokerBackground[1], 0);

    g_rgPokerBackground[2] = TextDrawCreate(202.000000, 140.000000, "_");
    TextDrawBackgroundColor(g_rgPokerBackground[2], 255);
    TextDrawFont(g_rgPokerBackground[2], 0);
    TextDrawLetterSize(g_rgPokerBackground[2], 1.500000, 4.400000);
    TextDrawColor(g_rgPokerBackground[2], -1);
    TextDrawSetOutline(g_rgPokerBackground[2], 0);
    TextDrawSetProportional(g_rgPokerBackground[2], 1);
    TextDrawSetShadow(g_rgPokerBackground[2], 1);
    TextDrawUseBox(g_rgPokerBackground[2], 1);
    TextDrawBoxColor(g_rgPokerBackground[2], 255);
    TextDrawTextSize(g_rgPokerBackground[2], 264.000000, 50.000000);
    TextDrawSetSelectable(g_rgPokerBackground[2], 0);

    g_rgPokerBackground[3] = TextDrawCreate(376.000000, 140.000000, "_");
    TextDrawBackgroundColor(g_rgPokerBackground[3], 255);
    TextDrawFont(g_rgPokerBackground[3], 0);
    TextDrawLetterSize(g_rgPokerBackground[3], 1.500000, 4.400000);
    TextDrawColor(g_rgPokerBackground[3], -1);
    TextDrawSetOutline(g_rgPokerBackground[3], 0);
    TextDrawSetProportional(g_rgPokerBackground[3], 1);
    TextDrawSetShadow(g_rgPokerBackground[3], 1);
    TextDrawUseBox(g_rgPokerBackground[3], 1);
    TextDrawBoxColor(g_rgPokerBackground[3], 255);
    TextDrawTextSize(g_rgPokerBackground[3], 438.000000, 60.000000);
    TextDrawSetSelectable(g_rgPokerBackground[3], 0);

    g_rgPokerBackground[4] = TextDrawCreate(433.000000, 203.000000, "_");
    TextDrawBackgroundColor(g_rgPokerBackground[4], 255);
    TextDrawFont(g_rgPokerBackground[4], 0);
    TextDrawLetterSize(g_rgPokerBackground[4], 1.500000, 4.400000);
    TextDrawColor(g_rgPokerBackground[4], -1);
    TextDrawSetOutline(g_rgPokerBackground[4], 0);
    TextDrawSetProportional(g_rgPokerBackground[4], 1);
    TextDrawSetShadow(g_rgPokerBackground[4], 1);
    TextDrawUseBox(g_rgPokerBackground[4], 1);
    TextDrawBoxColor(g_rgPokerBackground[4], 255);
    TextDrawTextSize(g_rgPokerBackground[4], 495.000000, 50.000000);
    TextDrawSetSelectable(g_rgPokerBackground[4], 0);

    g_rgPokerBackground[5] = TextDrawCreate(376.000000, 266.000000, "_");
    TextDrawBackgroundColor(g_rgPokerBackground[5], 255);
    TextDrawFont(g_rgPokerBackground[5], 0);
    TextDrawLetterSize(g_rgPokerBackground[5], 1.500000, 4.400000);
    TextDrawColor(g_rgPokerBackground[5], -1);
    TextDrawSetOutline(g_rgPokerBackground[5], 0);
    TextDrawSetProportional(g_rgPokerBackground[5], 1);
    TextDrawSetShadow(g_rgPokerBackground[5], 1);
    TextDrawUseBox(g_rgPokerBackground[5], 1);
    TextDrawBoxColor(g_rgPokerBackground[5], 255);
    TextDrawTextSize(g_rgPokerBackground[5], 438.000000, 50.000000);
    TextDrawSetSelectable(g_rgPokerBackground[5], 0);

    g_rgPokerBackground[6] = TextDrawCreate(236.000000, 203.000000, "_");
    TextDrawBackgroundColor(g_rgPokerBackground[6], 255);
    TextDrawFont(g_rgPokerBackground[6], 0);
    TextDrawLetterSize(g_rgPokerBackground[6], 1.500000, 4.400000);
    TextDrawColor(g_rgPokerBackground[6], -1);
    TextDrawSetOutline(g_rgPokerBackground[6], 0);
    TextDrawSetProportional(g_rgPokerBackground[6], 1);
    TextDrawSetShadow(g_rgPokerBackground[6], 1);
    TextDrawUseBox(g_rgPokerBackground[6], 1);
    TextDrawBoxColor(g_rgPokerBackground[6], 255);
    TextDrawTextSize(g_rgPokerBackground[6], 394.000000, 50.000000);
    TextDrawSetSelectable(g_rgPokerBackground[6], 0);

    return;
}

Pkr_DestroyBackgroundTextDraws() {
    for(new _i = 0; _i < MAX_POKER_BACKGROUND_TEXTDRAWS; ++_i)
    {
        TextDrawDestroy(g_rgPokerBackground[_i]);
        g_rgPokerBackground[_i] = Text:INVALID_TEXT_DRAW;
    }
}
