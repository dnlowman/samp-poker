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

#define Pkr_SetPlayerCardOneTextDraw(%0,%1,%2) \
            TextDrawSetString(g_rgPokerGames[%0][PLAYER_GAME_CARD_ONE_TEXTDRAW][%1], %2)

#define Pkr_SetPlayerCardTwoTextDraw(%0,%1,%2) \
            TextDrawSetString(g_rgPokerGames[%0][PLAYER_GAME_CARD_TWO_TEXTDRAW][%1], %2)

Pkr_ShowPlayerCardTextDraws(const playerid, const gameId)
{
    for(new _i; _i < MAX_POKER_PLAYERS; ++_i)
    {
        TextDrawShowForPlayer(playerid, g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][_i]);
        TextDrawShowForPlayer(playerid, g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][_i]);
    }

    return;
}

Pkr_HidePlayerCardTextDraws(const playerid, const gameId) {
    for(new _i; _i < MAX_POKER_PLAYERS; ++_i)
    {
        TextDrawHideForPlayer(playerid, g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][_i]);
        TextDrawHideForPlayer(playerid, g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][_i]);
    }

    return;
}

Pkr_CreatePlayerCardTDs(const gameId)
{
    g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][0] = TextDrawCreate(202.000000, 266.000000, "_");
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][0], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][0], 4);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][0], 0.470000, 0.899999);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][0], -1);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][0], 0);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][0], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][0], 1);
    TextDrawUseBox(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][0], 1);
    TextDrawBoxColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][0], 255);
    TextDrawTextSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][0], 30.000000, 40.000000);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][0], 0);

    g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][1] = TextDrawCreate(150.000000, 203.000000, "_");
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][1], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][1], 4);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][1], 0.470000, 0.899999);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][1], -1);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][1], 0);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][1], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][1], 1);
    TextDrawUseBox(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][1], 1);
    TextDrawBoxColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][1], 255);
    TextDrawTextSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][1], 30.000000, 40.000000);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][1], 0);

    g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][2] = TextDrawCreate(202.000000, 140.000000, "_");
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][2], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][2], 4);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][2], 0.470000, 0.899999);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][2], -1);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][2], 0);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][2], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][2], 1);
    TextDrawUseBox(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][2], 1);
    TextDrawBoxColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][2], 255);
    TextDrawTextSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][2], 30.000000, 40.000000);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][2], 0);

    g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][3] = TextDrawCreate(376.000000, 140.000000, "_");
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][3], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][3], 4);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][3], 0.470000, 0.899999);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][3], -1);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][3], 0);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][3], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][3], 1);
    TextDrawUseBox(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][3], 1);
    TextDrawBoxColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][3], 255);
    TextDrawTextSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][3], 30.000000, 40.000000);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][3], 0);

    g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][4] = TextDrawCreate(433.000000, 203.000000, "_");
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][4], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][4], 4);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][4], 0.470000, 0.899999);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][4], -1);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][4], 0);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][4], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][4], 1);
    TextDrawUseBox(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][4], 1);
    TextDrawBoxColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][4], 255);
    TextDrawTextSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][4], 30.000000, 40.000000);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][4], 0);

    g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][5] = TextDrawCreate(376.000000, 266.000000, "_");
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][5], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][5], 4);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][5], 0.470000, 0.899999);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][5], -1);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][5], 0);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][5], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][5], 1);
    TextDrawUseBox(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][5], 1);
    TextDrawBoxColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][5], 255);
    TextDrawTextSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][5], 30.000000, 40.000000);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][5], 0);

    g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][0] = TextDrawCreate(234.000000, 266.000000, "_");
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][0], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][0], 4);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][0], 0.470000, 0.899999);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][0], -1);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][0], 0);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][0], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][0], 1);
    TextDrawUseBox(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][0], 1);
    TextDrawBoxColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][0], 255);
    TextDrawTextSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][0], 30.000000, 40.000000);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][0], 0);

    g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][1] = TextDrawCreate(182.000000, 203.000000, "_");
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][1], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][1], 4);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][1], 0.470000, 0.899999);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][1], -1);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][1], 0);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][1], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][1], 1);
    TextDrawUseBox(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][1], 1);
    TextDrawBoxColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][1], 255);
    TextDrawTextSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][1], 30.000000, 40.000000);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][1], 0);

    g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][2] = TextDrawCreate(234.000000, 140.000000, "_");
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][2], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][2], 4);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][2], 0.470000, 0.899999);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][2], -1);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][2], 0);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][2], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][2], 1);
    TextDrawUseBox(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][2], 1);
    TextDrawBoxColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][2], 255);
    TextDrawTextSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][2], 30.000000, 40.000000);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][2], 0);

    g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][3] = TextDrawCreate(408.000000, 140.000000, "_");
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][3], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][3], 4);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][3], 0.470000, 0.899999);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][3], -1);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][3], 0);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][3], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][3], 1);
    TextDrawUseBox(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][3], 1);
    TextDrawBoxColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][3], 255);
    TextDrawTextSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][3], 30.000000, 40.000000);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][3], 0);

    g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][4] = TextDrawCreate(465.000000, 203.000000, "_");
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][4], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][4], 4);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][4], 0.470000, 0.899999);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][4], -1);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][4], 0);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][4], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][4], 1);
    TextDrawUseBox(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][4], 1);
    TextDrawBoxColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][4], 255);
    TextDrawTextSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][4], 30.000000, 40.000000);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][4], 0);

    g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][5] = TextDrawCreate(408.000000, 266.000000, "_");
    TextDrawBackgroundColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][5], 255);
    TextDrawFont(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][5], 4);
    TextDrawLetterSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][5], 0.470000, 0.899999);
    TextDrawColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][5], -1);
    TextDrawSetOutline(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][5], 0);
    TextDrawSetProportional(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][5], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][5], 1);
    TextDrawUseBox(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][5], 1);
    TextDrawBoxColor(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][5], 255);
    TextDrawTextSize(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][5], 30.000000, 40.000000);
    TextDrawSetSelectable(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][5], 0);

    return;
}

Pkr_DestroyPlayerCardTDs(const gameId)
{
    for(new _i = 0; _i < MAX_POKER_PLAYERS; ++_i)
    {
        TextDrawDestroy(g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][_i]);
        TextDrawDestroy(g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][_i]);
        g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][_i] = Text: INVALID_TEXT_DRAW;
        g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][_i] = Text: INVALID_TEXT_DRAW;
    }

    return;
}
