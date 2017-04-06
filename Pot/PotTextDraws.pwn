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

#define Pkr_ShowPlayerPotTextDraw(%0,%1) \
            TextDrawShowForPlayer(%0, g_rgPokerGames[%1][POT_TEXTDRAW])

#define Pkr_HidePlayerPotTextDraw(%0,%1) \
            TextDrawHideForPlayer(%0, g_rgPokerGames[%1][POT_TEXTDRAW])

stock Pkr_SetPotTextDraw(const gameId, const amount)
{
    new _szPotString[128];
    format(_szPotString, sizeof(_szPotString), "~w~ POT: ~g~$%d", amount);
    TextDrawSetString(g_rgPokerGames[gameId][POT_TEXTDRAW], _szPotString);
    return;
}

Pkr_CreatePotTextDraw(const gameId) {
    g_rgPokerGames[gameId][POT_TEXTDRAW] = TextDrawCreate(314.000000, 192.000000, "~w~ POT: ~g~$0");
    TextDrawAlignment(g_rgPokerGames[gameId][POT_TEXTDRAW], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][POT_TEXTDRAW], 255);
    TextDrawFont(g_rgPokerGames[gameId][POT_TEXTDRAW], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][POT_TEXTDRAW], 0.139999, 0.799999);
    TextDrawColor(g_rgPokerGames[gameId][POT_TEXTDRAW], -6749953);
    TextDrawSetOutline(g_rgPokerGames[gameId][POT_TEXTDRAW], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][POT_TEXTDRAW], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][POT_TEXTDRAW], 0);
    TextDrawSetSelectable(g_rgPokerGames[gameId][POT_TEXTDRAW], 0);

    return;
}

Pkr_DestroyPotTextDraw(const gameId) {
    TextDrawDestroy(g_rgPokerGames[gameId][POT_TEXTDRAW]);
    g_rgPokerGames[gameId][POT_TEXTDRAW] = Text: INVALID_TEXT_DRAW;
    return;
}
