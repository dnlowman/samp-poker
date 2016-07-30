#define Pkr_ShowPlayerStatusTextDraw(%0,%1) \
            for(new i; i < MAX_POKER_PLAYERS; ++i) TextDrawShowForPlayer(%0, g_rgPokerGames[%1][PLAYER_STATUS_TEXTDRAWS][i])

#define Pkr_HidePlayerStatusTextDraw(%0,%1) \
            for(new i; i < MAX_POKER_PLAYERS; ++i) TextDrawHideForPlayer(%0, g_rgPokerGames[%1][PLAYER_STATUS_TEXTDRAWS][i])

Pkr_SetPlayerStatusTextDraw(const gameId, const slot, const text[])
{
    new _status[128];
    format(_status, sizeof(_status), "%s: ~g~%s", Pkr_GetClientName(g_rgPokerGames[gameId][PLAYERS][slot]), text);
    TextDrawSetString(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][slot], _status);

    return;
}

Pkr_CreatePlayerStatusTDs(const gameId)
{
    g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][0] = TextDrawCreate(233.000000, 308.000000, "");
    TextDrawAlignment(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][0], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][0], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][0], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][0], 0.170000, 1.000000);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][0], -6749953);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][0], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][0], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][0], 0);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][0], 0);

    g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][1] = TextDrawCreate(182.000000, 245.000000, "");
    TextDrawAlignment(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][1], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][1], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][1], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][1], 0.170000, 1.000000);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][1], -6749953);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][1], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][1], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][1], 0);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][1], 0);

    g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][2] = TextDrawCreate(233.000000, 182.000000, "");
    TextDrawAlignment(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][2], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][2], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][2], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][2], 0.170000, 1.000000);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][2], -6749953);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][2], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][2], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][2], 0);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][2], 0);

    g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][3] = TextDrawCreate(407.000000, 182.000000, "");
    TextDrawAlignment(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][3], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][3], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][3], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][3], 0.170000, 1.000000);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][3], -6749953);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][3], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][3], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][3], 0);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][3], 0);

    g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][4] = TextDrawCreate(465.000000, 245.000000, "");
    TextDrawAlignment(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][4], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][4], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][4], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][4], 0.170000, 1.000000);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][4], -6749953);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][4], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][4], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][4], 0);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][4], 0);

    g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][5] = TextDrawCreate(408.000000, 308.000000, "");
    TextDrawAlignment(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][5], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][5], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][5], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][5], 0.170000, 1.000000);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][5], -6749953);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][5], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][5], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][5], 0);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][5], 0);

    return;
}

Pkr_DestroyPlayerStatusTDs(const gameId)
{
    for(new _i = 0; _i < MAX_POKER_PLAYERS; ++_i)
    {
        TextDrawDestroy(g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][_i]);
        g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][_i] = Text: INVALID_TEXT_DRAW;
    }

    return;
}
