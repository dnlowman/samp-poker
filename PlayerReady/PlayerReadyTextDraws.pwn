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

#define MAX_POKER_READY_TEXTDRAWS (6)

#define Pkr_GetPlayerReadyTextDrawId(%0,%1) \
            g_rgPokerGames[%0][READY_TEXTDRAWS][%1]

#define Pkr_SetPlayerReadyTextDrawId(%0,%1,%2) \
            Pkr_GetPlayerReadyTextDrawId(%0,%1) = %2

#define Pkr_ForeachReadyTextDraw(%0) \
            for(new %0 = 0; %0 < MAX_POKER_READY_TEXTDRAWS; ++%0)

#define Pkr_ShowPlayerReadyTextDraw(%0,%1) \
            for(new _i; _i < 6; ++_i) TextDrawShowForPlayer(%0, g_rgPokerGames[%1][READY_TEXTDRAWS][_i])

#define Pkr_HidePlayerReadyTextDraw(%0,%1) \
            for(new _i; _i < 6; ++_i) TextDrawHideForPlayer(%0, g_rgPokerGames[%1][READY_TEXTDRAWS][_i])

#define Pkr_SetReadyTextDrawReady(%0,%1) \
            TextDrawSetString(g_rgPokerGames[%0][READY_TEXTDRAWS][%1], "~g~READY")

#define Pkr_SetReadyTextDrawNotReady(%0,%1) \
            TextDrawSetString(g_rgPokerGames[%0][READY_TEXTDRAWS][%1], "~r~NOT READY")

#define Pkr_SetReadyTextDrawEmpty(%0,%1) \
            TextDrawSetString(g_rgPokerGames[%0][READY_TEXTDRAWS][%1], "~w~EMPTY SEAT")

Pkr_ShowAllPlayersReadyTextDraw(const gameId) {
	Pkr_ForeachPlayer(playerSlot) {
		new playerId = Pkr_GetPlayerId(gameId, playerSlot);
		if(playerId != INVALID_PLAYER_ID && GetPVarType(playerId, POKER_SIT_VAR_NAME) != PLAYER_VARTYPE_NONE)
			Pkr_ShowPlayerReadyTextDraw(playerId, gameId);
	}
	return;
}

Pkr_CreateReadyTextDraws(const gameId)
{
    g_rgPokerGames[gameId][READY_TEXTDRAWS][0] = TextDrawCreate(234.000000, 280.000000, "~w~EMPTY SEAT");
    TextDrawAlignment(g_rgPokerGames[gameId][READY_TEXTDRAWS][0], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][READY_TEXTDRAWS][0], 255);
    TextDrawFont(g_rgPokerGames[gameId][READY_TEXTDRAWS][0], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][READY_TEXTDRAWS][0], 0.200000, 1.000000);
    TextDrawColor(g_rgPokerGames[gameId][READY_TEXTDRAWS][0], 16711935);
    TextDrawSetOutline(g_rgPokerGames[gameId][READY_TEXTDRAWS][0], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][READY_TEXTDRAWS][0], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][READY_TEXTDRAWS][0], 0);
    TextDrawTextSize(g_rgPokerGames[gameId][READY_TEXTDRAWS][0], 15, 84);
    TextDrawSetSelectable(g_rgPokerGames[gameId][READY_TEXTDRAWS][0], 1);

    g_rgPokerGames[gameId][READY_TEXTDRAWS][1] = TextDrawCreate(182.000000, 218.000000, "~w~EMPTY SEAT");
    TextDrawAlignment(g_rgPokerGames[gameId][READY_TEXTDRAWS][1], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][READY_TEXTDRAWS][1], 255);
    TextDrawFont(g_rgPokerGames[gameId][READY_TEXTDRAWS][1], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][READY_TEXTDRAWS][1], 0.200000, 1.000000);
    TextDrawColor(g_rgPokerGames[gameId][READY_TEXTDRAWS][1], 16711935);
    TextDrawSetOutline(g_rgPokerGames[gameId][READY_TEXTDRAWS][1], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][READY_TEXTDRAWS][1], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][READY_TEXTDRAWS][1], 0);
    TextDrawTextSize(g_rgPokerGames[gameId][READY_TEXTDRAWS][1], 15, 84);
    TextDrawSetSelectable(g_rgPokerGames[gameId][READY_TEXTDRAWS][1], 1);

    g_rgPokerGames[gameId][READY_TEXTDRAWS][2] = TextDrawCreate(233.000000, 155.000000, "~w~EMPTY SEAT");
    TextDrawAlignment(g_rgPokerGames[gameId][READY_TEXTDRAWS][2], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][READY_TEXTDRAWS][2], 255);
    TextDrawFont(g_rgPokerGames[gameId][READY_TEXTDRAWS][2], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][READY_TEXTDRAWS][2], 0.200000, 1.000000);
    TextDrawColor(g_rgPokerGames[gameId][READY_TEXTDRAWS][2], 16711935);
    TextDrawSetOutline(g_rgPokerGames[gameId][READY_TEXTDRAWS][2], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][READY_TEXTDRAWS][2], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][READY_TEXTDRAWS][2], 0);
    TextDrawTextSize(g_rgPokerGames[gameId][READY_TEXTDRAWS][2], 15, 84);
    TextDrawSetSelectable(g_rgPokerGames[gameId][READY_TEXTDRAWS][2], 1);

    g_rgPokerGames[gameId][READY_TEXTDRAWS][3] = TextDrawCreate(408.000000, 155.000000, "~w~EMPTY SEAT");
    TextDrawAlignment(g_rgPokerGames[gameId][READY_TEXTDRAWS][3], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][READY_TEXTDRAWS][3], 255);
    TextDrawFont(g_rgPokerGames[gameId][READY_TEXTDRAWS][3], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][READY_TEXTDRAWS][3], 0.200000, 1.000000);
    TextDrawColor(g_rgPokerGames[gameId][READY_TEXTDRAWS][3], 16711935);
    TextDrawSetOutline(g_rgPokerGames[gameId][READY_TEXTDRAWS][3], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][READY_TEXTDRAWS][3], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][READY_TEXTDRAWS][3], 0);
    TextDrawTextSize(g_rgPokerGames[gameId][READY_TEXTDRAWS][3], 15, 84);
    TextDrawSetSelectable(g_rgPokerGames[gameId][READY_TEXTDRAWS][3], 1);

    g_rgPokerGames[gameId][READY_TEXTDRAWS][4] = TextDrawCreate(465.000000, 218.000000, "~w~EMPTY SEAT");
    TextDrawAlignment(g_rgPokerGames[gameId][READY_TEXTDRAWS][4], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][READY_TEXTDRAWS][4], 255);
    TextDrawFont(g_rgPokerGames[gameId][READY_TEXTDRAWS][4], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][READY_TEXTDRAWS][4], 0.200000, 1.000000);
    TextDrawColor(g_rgPokerGames[gameId][READY_TEXTDRAWS][4], 16711935);
    TextDrawSetOutline(g_rgPokerGames[gameId][READY_TEXTDRAWS][4], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][READY_TEXTDRAWS][4], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][READY_TEXTDRAWS][4], 0);
    TextDrawTextSize(g_rgPokerGames[gameId][READY_TEXTDRAWS][4], 15, 84);
    TextDrawSetSelectable(g_rgPokerGames[gameId][READY_TEXTDRAWS][4], 1);

    g_rgPokerGames[gameId][READY_TEXTDRAWS][5] = TextDrawCreate(407.000000, 280.000000, "~w~EMPTY SEAT");
    TextDrawAlignment(g_rgPokerGames[gameId][READY_TEXTDRAWS][5], 2);
    TextDrawBackgroundColor(g_rgPokerGames[gameId][READY_TEXTDRAWS][5], 255);
    TextDrawFont(g_rgPokerGames[gameId][READY_TEXTDRAWS][5], 2);
    TextDrawLetterSize(g_rgPokerGames[gameId][READY_TEXTDRAWS][5], 0.200000, 1.000000);
    TextDrawColor(g_rgPokerGames[gameId][READY_TEXTDRAWS][5], 16711935);
    TextDrawSetOutline(g_rgPokerGames[gameId][READY_TEXTDRAWS][5], 1);
    TextDrawSetProportional(g_rgPokerGames[gameId][READY_TEXTDRAWS][5], 1);
    TextDrawSetShadow(g_rgPokerGames[gameId][READY_TEXTDRAWS][5], 0);
    TextDrawTextSize(g_rgPokerGames[gameId][READY_TEXTDRAWS][5], 15, 84);
    TextDrawSetSelectable(g_rgPokerGames[gameId][READY_TEXTDRAWS][5], 1);
    return;
}

Pkr_DestroyReadyTextDraws(const gameId)
{
    Pkr_ForeachPlayer(playerSlot)
    {
        TextDrawDestroy(g_rgPokerGames[gameId][READY_TEXTDRAWS][playerSlot]);
        g_rgPokerGames[gameId][READY_TEXTDRAWS][playerSlot] = Text: INVALID_TEXT_DRAW;
    }
    return;
}
