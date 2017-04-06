/*
                    	© Los Santos Role Play 2017
                       		Texas Hold 'em Poker

							Release Candidate 1
--------------------------------------------------------------------------------

Description:
    A complete Texas Hold 'em Poker mini-game
    for San Andreas Multiplayer.

--------------------------------------------------------------------------------

Author(s):
    Noble -
        Game scripting.
        San Andreas Multiplayer plugin port.

    Cactus Kev -
        Hand Evaluator
        (http://www.suffecool.net/poker/evaluator.html)

    Paul Senzee -
        Hash optimizations.

--------------------------------------------------------------------------------

Special Thanks:
    Los Santos Role Play development team.
    San Andreas Mutliplayer development team.
    Los Santos Role Play tester team.

--------------------------------------------------------------------------------

License:
	Please see the enclosed LICENSE file in the repository.

*/

#define Pkr_SetTableCardTextDraw(%0,%1,%2) \
            TextDrawSetString(g_rgPokerGames[%0][TABLE_CARDS_TEXTDRAWS][%1], %2)

#define Pkr_ShowTableCardTextDraws(%0,%1) \
            for(new _i; _i < MAX_TABLE_CARDS; ++_i) TextDrawShowForPlayer(%0, g_rgPokerGames[%1][TABLE_CARDS_TEXTDRAWS][_i])

#define Pkr_HideTableCardTextDraws(%0,%1) \
            for(new _i; _i < MAX_TABLE_CARDS; ++_i) TextDrawHideForPlayer(%0, g_rgPokerGames[%1][TABLE_CARDS_TEXTDRAWS][_i])

Pkr_CreateTableCardTextDraws(const gameId)
{
    g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][0] = TextDrawCreate(236.000000, 203.000000, "_");
    TextDrawBackgroundColor(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][0], 255);
    TextDrawFont(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][0], 4);
    TextDrawLetterSize(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][0], 0.470000, 0.899999);
    TextDrawColor(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][0], -1);
    TextDrawSetOutline(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][0], 0);
    TextDrawSetProportional(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][0], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][0], 1);
    TextDrawUseBox(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][0], 1);
    TextDrawBoxColor(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][0], 255);
    TextDrawTextSize(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][0], 30.000000, 40.000000);
    TextDrawSetSelectable(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][0], 0);

    g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][1] = TextDrawCreate(268.000000, 203.000000, "_");
    TextDrawBackgroundColor(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][1], 255);
    TextDrawFont(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][1], 4);
    TextDrawLetterSize(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][1], 0.470000, 0.899999);
    TextDrawColor(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][1], -1);
    TextDrawSetOutline(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][1], 0);
    TextDrawSetProportional(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][1], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][1], 1);
    TextDrawUseBox(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][1], 1);
    TextDrawBoxColor(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][1], 255);
    TextDrawTextSize(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][1], 30.000000, 40.000000);
    TextDrawSetSelectable(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][1], 0);

    g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][2] = TextDrawCreate(300.000000, 203.000000, "_");
    TextDrawBackgroundColor(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][2], 255);
    TextDrawFont(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][2], 4);
    TextDrawLetterSize(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][2], 0.470000, 0.899999);
    TextDrawColor(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][2], -1);
    TextDrawSetOutline(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][2], 0);
    TextDrawSetProportional(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][2], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][2], 1);
    TextDrawUseBox(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][2], 1);
    TextDrawBoxColor(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][2], 255);
    TextDrawTextSize(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][2], 30.000000, 40.000000);
    TextDrawSetSelectable(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][2], 0);

    g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][3] = TextDrawCreate(332.000000, 203.000000, "_");
    TextDrawBackgroundColor(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][3], 255);
    TextDrawFont(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][3], 4);
    TextDrawLetterSize(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][3], 0.470000, 0.899999);
    TextDrawColor(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][3], -1);
    TextDrawSetOutline(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][3], 0);
    TextDrawSetProportional(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][3], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][3], 1);
    TextDrawUseBox(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][3], 1);
    TextDrawBoxColor(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][3], 255);
    TextDrawTextSize(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][3], 30.000000, 40.000000);
    TextDrawSetSelectable(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][3], 0);

    g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][4] = TextDrawCreate(364.000000, 203.000000, "_");
    TextDrawBackgroundColor(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][4], 255);
    TextDrawFont(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][4], 4);
    TextDrawLetterSize(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][4], 0.470000, 0.899999);
    TextDrawColor(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][4], -1);
    TextDrawSetOutline(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][4], 0);
    TextDrawSetProportional(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][4], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][4], 1);
    TextDrawUseBox(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][4], 1);
    TextDrawBoxColor(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][4], 255);
    TextDrawTextSize(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][4], 30.000000, 40.000000);
    TextDrawSetSelectable(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][4], 0);

    return;
}

Pkr_DestroyTableCardTextDraws(const gameId) {
    for(new _i = 0; _i < MAX_TABLE_CARDS; ++_i)
    {
        TextDrawDestroy(g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][_i]);
        g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][_i] = Text: INVALID_TEXT_DRAW;
    }

    return;
}
