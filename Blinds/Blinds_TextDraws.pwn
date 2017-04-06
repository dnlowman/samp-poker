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

#define Pkr_GetBlindsTextDrawId(%0) \
            g_rgPokerGames[%0][POKER_BLINDS_TEXTDRAW]

#define Pkr_SetBlindsTextDrawId(%0,%1) \
            g_rgPokerGames[%0][POKER_BLINDS_TEXTDRAW] = %1

#define Pkr_ShowPlayerBlindTextDraw(%0,%1) \
            TextDrawShowForPlayer(%0, Pkr_GetBlindsTextDrawId(%1))

#define Pkr_HidePlayerBlindTextDraw(%0,%1) \
            TextDrawHideForPlayer(%0, Pkr_GetBlindsTextDrawId(%1))

#define Pkr_SetBlindTextDraw(%0,%1) \
            TextDrawSetString(Pkr_GetBlindsTextDrawId(%1), %1)

Pkr_CreateBlindTextDraw(const gameId)
{
    Pkr_SetBlindsTextDrawId(gameId, TextDrawCreate(317.000000, 244.000000, "BLINDS: ~y~$100 ~w~/ ~y~$200"));
    new Text: textId = Pkr_GetBlindsTextDrawId(gameId);
    TextDrawAlignment(textId, 2);
    TextDrawBackgroundColor(textId, 255);
    TextDrawFont(textId, 2);
    TextDrawLetterSize(textId, 0.210000, 1.300000);
    TextDrawColor(textId, -1);
    TextDrawSetOutline(textId, 1);
    TextDrawSetProportional(textId, 1);
    TextDrawSetShadow(textId, 1);
    TextDrawSetSelectable(textId, 0);
    return;
}

Pkr_DestroyBlindTextDraw(const gameId)
{
    TextDrawDestroy(Pkr_GetBlindsTextDrawId(gameId));
    Pkr_SetBlindsTextDrawId(gameId, Text: INVALID_TEXT_DRAW);
    return;
}
