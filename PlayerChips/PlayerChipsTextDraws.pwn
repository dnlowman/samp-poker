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

#define Pkr_ShowPlayerChipsTextDraw(%0,%1) \
            for(new i; i < MAX_POKER_PLAYERS; ++i) TextDrawShowForPlayer(%0, g_rgPokerGames[%1][PLAYER_CHIPS_TEXTDRAWS][i])

#define Pkr_HidePlayerChipsTextDraw(%0,%1) \
            for(new i; i < MAX_POKER_PLAYERS; ++i) TextDrawHideForPlayer(%0, g_rgPokerGames[%1][PLAYER_CHIPS_TEXTDRAWS][i])

#define Pkr_SetPlayerChipsTextDraw(%0,%1,%2) \
            TextDrawSetString(g_rgPokerGames[%0][PLAYER_CHIPS_TEXTDRAWS][%1], %2)

Pkr_CreatePlayerChipsTDs(const gameId)
{
    g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][0] = TextDrawCreate(233.000000, 254.000000, "");
    TextDrawAlignment(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][0], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][0], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][0], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][0], 0.170000, 1.000000);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][0], -6749953);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][0], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][0], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][0], 0);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][0], 0);

    g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][1] = TextDrawCreate(182.000000, 191.000000, "");
    TextDrawAlignment(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][1], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][1], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][1], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][1], 0.170000, 1.000000);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][1], -6749953);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][1], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][1], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][1], 0);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][1], 0);

    g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][2] = TextDrawCreate(233.000000, 128.000000, "");
    TextDrawAlignment(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][2], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][2], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][2], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][2], 0.170000, 1.000000);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][2], -6749953);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][2], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][2], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][2], 0);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][2], 0);

    g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][3] = TextDrawCreate(407.000000, 128.000000, "");
    TextDrawAlignment(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][3], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][3], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][3], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][3], 0.170000, 1.000000);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][3], -6749953);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][3], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][3], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][3], 0);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][3], 0);

    g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][4] = TextDrawCreate(464.000000, 191.000000, "");
    TextDrawAlignment(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][4], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][4], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][4], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][4], 0.170000, 1.000000);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][4], -6749953);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][4], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][4], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][4], 0);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][4], 0);

    g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][5] = TextDrawCreate(407.000000, 254.000000, "");
    TextDrawAlignment(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][5], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][5], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][5], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][5], 0.170000, 1.000000);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][5], -6749953);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][5], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][5], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][5], 0);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][5], 0);

    return;
}

Pkr_DestroyPlayerChipsTDs(const gameId)
{
    for(new _i = 0; _i < MAX_POKER_PLAYERS; ++_i)
    {
        TextDrawDestroy(g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][_i]);
        g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][_i] = Text: INVALID_TEXT_DRAW;
    }

    return;
}
