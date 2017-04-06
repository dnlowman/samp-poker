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

PkrCMD_Stats(const playerid, const parameters[])
{
    new gameId = INVALID_POKER_GAME_ID;

    if(sscanf(parameters, "i", gameId))
    {
        SendClientMessage(playerid, COLOR_GREY, "DEBUG USAGE: /pkr stats [gameId]");
        return;
    }

    if(!Pkr_IsValidGameId(gameId))
    {
        SendClientMessage(playerid, COLOR_RED, "ERROR: Invalid gameId.");
        return;
    }

    new caption[128];
    format(caption, sizeof(caption), "Poker Stats - Game ID: %d", gameId);

    new info[2048];
    format(info, sizeof(info), "Variable\tValue\n");
    format(info, sizeof(info), "%sIS_ASSIGNED\t%d\n", info, g_rgPokerGames[gameId][IS_ASSIGNED]);
    format(info, sizeof(info), "%sPLAYERS\t[%d,%d,%d,%d,%d]\n", info, g_rgPokerGames[gameId][PLAYERS][0],
                                                                    g_rgPokerGames[gameId][PLAYERS][1],
                                                                    g_rgPokerGames[gameId][PLAYERS][2],
                                                                    g_rgPokerGames[gameId][PLAYERS][3],
                                                                    g_rgPokerGames[gameId][PLAYERS][4],
                                                                    g_rgPokerGames[gameId][PLAYERS][5]);
    format(info, sizeof(info), "%sMENU_ITEM_ONE_STATE\t%d\n", info, _:g_rgPokerGames[gameId][MENU_ITEM_ONE_STATE]);
    format(info, sizeof(info), "%sMENU_ITEM_TWO_STATE\t%d\n", info, _:g_rgPokerGames[gameId][MENU_ITEM_TWO_STATE]);
    format(info, sizeof(info), "%sTABLE_CARD_VALUES\t[%d,%d,%d,%d,%d]\n", info, g_rgPokerGames[gameId][TABLE_CARD_VALUES][0],
                                                                                g_rgPokerGames[gameId][TABLE_CARD_VALUES][1],
                                                                                g_rgPokerGames[gameId][TABLE_CARD_VALUES][2],
                                                                                g_rgPokerGames[gameId][TABLE_CARD_VALUES][3],
                                                                                g_rgPokerGames[gameId][TABLE_CARD_VALUES][4]);
    format(info, sizeof(info), "%sPLAYER_CARD_ONE_VALUE\t[%d,%d,%d,%d,%d,%d]\n", info, g_rgPokerGames[gameId][PLAYER_CARD_ONE_VALUE][0],
                                                                                       g_rgPokerGames[gameId][PLAYER_CARD_ONE_VALUE][1],
                                                                                       g_rgPokerGames[gameId][PLAYER_CARD_ONE_VALUE][2],
                                                                                       g_rgPokerGames[gameId][PLAYER_CARD_ONE_VALUE][3],
                                                                                       g_rgPokerGames[gameId][PLAYER_CARD_ONE_VALUE][4],
                                                                                       g_rgPokerGames[gameId][PLAYER_CARD_ONE_VALUE][5]);
    format(info, sizeof(info), "%sPLAYER_CARD_TWO_VALUE\t[%d,%d,%d,%d,%d,%d]\n", info, g_rgPokerGames[gameId][PLAYER_CARD_TWO_VALUE][0],
                                                                                       g_rgPokerGames[gameId][PLAYER_CARD_TWO_VALUE][1],
                                                                                       g_rgPokerGames[gameId][PLAYER_CARD_TWO_VALUE][2],
                                                                                       g_rgPokerGames[gameId][PLAYER_CARD_TWO_VALUE][3],
                                                                                       g_rgPokerGames[gameId][PLAYER_CARD_TWO_VALUE][4],
                                                                                       g_rgPokerGames[gameId][PLAYER_CARD_TWO_VALUE][5]);
    format(info, sizeof(info), "%sOBJECT_ID\t%d\n", info, g_rgPokerGames[gameId][OBJECT_ID]);
    format(info, sizeof(info), "%sPOT\t%d\n", info, g_rgPokerGames[gameId][POT]);
    format(info, sizeof(info), "%sBLIND\t%d\n", info, g_rgPokerGames[gameId][BLIND]);
    format(info, sizeof(info), "%sDEALER\t%d\n", info, g_rgPokerGames[gameId][DEALER]);
    format(info, sizeof(info), "%sSMALL_BLIND_POSITION\t%d\n", info, g_rgPokerGames[gameId][SMALL_BLIND_POSITION]);
    format(info, sizeof(info), "%sBIG_BLIND_POSITION\t%d\n", info, g_rgPokerGames[gameId][BIG_BLIND_POSITION]);
    format(info, sizeof(info), "%sCURRENT_PLAYER_POSITION\t%d\n", info, g_rgPokerGames[gameId][CURRENT_PLAYER_POSITION]);
    format(info, sizeof(info), "%sGAME_STATUS\t%d\n", info, _:g_rgPokerGames[gameId][GAME_STATUS]);
    format(info, sizeof(info), "%sCURRENT_BET\t%d\n", info, g_rgPokerGames[gameId][CURRENT_BET]);
    format(info, sizeof(info), "%sLAST_AGGRESSIVE_PLAYER\t%d\n", info, g_rgPokerGames[gameId][LAST_AGGRESSIVE_PLAYER]);
    format(info, sizeof(info), "%sLAST_BET\t%d\n", info, g_rgPokerGames[gameId][LAST_BET]);
    Pkr_SetPokerDialog(playerid, POKER_DIALOGS: STATS);
    ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_TABLIST_HEADERS, caption, info, "OK", "");
    return;
}
