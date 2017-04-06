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

#define Pkr_ForeachBackground(%0) \
            for(new %0 = 0; %0 < MAX_POKER_BACKGROUND_TEXTDRAWS; ++%0)

#define Pkr_GetBackgroundTextDrawId(%0) \
            g_rgPokerBackground[%0]

#define Pkr_SetBackgroundTextDrawId(%0,%1) \
            g_rgPokerBackground[%0] = %1

#define Pkr_ShowPlayerBackgroundTextDraws(%0) \
            Pkr_ForeachBackground(background) TextDrawShowForPlayer(%0, g_rgPokerBackground[background])

#define Pkr_HidePlayerBackgroundTextDraws(%0) \
            Pkr_ForeachBackground(background) TextDrawHideForPlayer(%0, g_rgPokerBackground[background])

new Text: g_rgPokerBackground[MAX_POKER_BACKGROUND_TEXTDRAWS] = { Text: INVALID_TEXT_DRAW, ... };

Pkr_CreateBackgroundTextDraws()
{
    new Text: textDrawId = Text: INVALID_TEXT_DRAW;
    Pkr_SetBackgroundTextDrawId(0, TextDrawCreate(202.000000, 266.000000, "_"));
    textDrawId = Pkr_GetBackgroundTextDrawId(0);
    TextDrawBackgroundColor(textDrawId, 255);
    TextDrawFont(textDrawId, 0);
    TextDrawLetterSize(textDrawId, 1.500000, 4.400000);
    TextDrawColor(textDrawId, -1);
    TextDrawSetOutline(textDrawId, 0);
    TextDrawSetProportional(textDrawId, 1);
    TextDrawSetShadow(textDrawId, 1);
    TextDrawUseBox(textDrawId, 1);
    TextDrawBoxColor(textDrawId, 255);
    TextDrawTextSize(textDrawId, 264.000000, 50.000000);
    TextDrawSetSelectable(textDrawId, 0);

    Pkr_SetBackgroundTextDrawId(1, TextDrawCreate(150.000000, 203.000000, "_"));
    textDrawId = Pkr_GetBackgroundTextDrawId(1);
    TextDrawBackgroundColor(textDrawId, 255);
    TextDrawFont(textDrawId, 0);
    TextDrawLetterSize(textDrawId, 1.500000, 4.400000);
    TextDrawColor(textDrawId, -1);
    TextDrawSetOutline(textDrawId, 0);
    TextDrawSetProportional(textDrawId, 1);
    TextDrawSetShadow(textDrawId, 1);
    TextDrawUseBox(textDrawId, 1);
    TextDrawBoxColor(textDrawId, 255);
    TextDrawTextSize(textDrawId, 212.000000, 50.000000);
    TextDrawSetSelectable(textDrawId, 0);


    Pkr_SetBackgroundTextDrawId(2, TextDrawCreate(202.000000, 140.000000, "_"));
    textDrawId = Pkr_GetBackgroundTextDrawId(2);
    TextDrawBackgroundColor(textDrawId, 255);
    TextDrawFont(textDrawId, 0);
    TextDrawLetterSize(textDrawId, 1.500000, 4.400000);
    TextDrawColor(textDrawId, -1);
    TextDrawSetOutline(textDrawId, 0);
    TextDrawSetProportional(textDrawId, 1);
    TextDrawSetShadow(textDrawId, 1);
    TextDrawUseBox(textDrawId, 1);
    TextDrawBoxColor(textDrawId, 255);
    TextDrawTextSize(textDrawId, 264.000000, 50.000000);
    TextDrawSetSelectable(textDrawId, 0);

    Pkr_SetBackgroundTextDrawId(3, TextDrawCreate(376.000000, 140.000000, "_"));
    textDrawId = Pkr_GetBackgroundTextDrawId(3);
    TextDrawBackgroundColor(textDrawId, 255);
    TextDrawFont(textDrawId, 0);
    TextDrawLetterSize(textDrawId, 1.500000, 4.400000);
    TextDrawColor(textDrawId, -1);
    TextDrawSetOutline(textDrawId, 0);
    TextDrawSetProportional(textDrawId, 1);
    TextDrawSetShadow(textDrawId, 1);
    TextDrawUseBox(textDrawId, 1);
    TextDrawBoxColor(textDrawId, 255);
    TextDrawTextSize(textDrawId, 438.000000, 60.000000);
    TextDrawSetSelectable(textDrawId, 0);

    Pkr_SetBackgroundTextDrawId(4, TextDrawCreate(433.000000, 203.000000, "_"));
    textDrawId = Pkr_GetBackgroundTextDrawId(4);
    TextDrawBackgroundColor(textDrawId, 255);
    TextDrawFont(textDrawId, 0);
    TextDrawLetterSize(textDrawId, 1.500000, 4.400000);
    TextDrawColor(textDrawId, -1);
    TextDrawSetOutline(textDrawId, 0);
    TextDrawSetProportional(textDrawId, 1);
    TextDrawSetShadow(textDrawId, 1);
    TextDrawUseBox(textDrawId, 1);
    TextDrawBoxColor(textDrawId, 255);
    TextDrawTextSize(textDrawId, 495.000000, 50.000000);
    TextDrawSetSelectable(textDrawId, 0);

    Pkr_SetBackgroundTextDrawId(5, TextDrawCreate(376.000000, 266.000000, "_"));
    textDrawId = Pkr_GetBackgroundTextDrawId(5);
    TextDrawBackgroundColor(textDrawId, 255);
    TextDrawFont(textDrawId, 0);
    TextDrawLetterSize(textDrawId, 1.500000, 4.400000);
    TextDrawColor(textDrawId, -1);
    TextDrawSetOutline(textDrawId, 0);
    TextDrawSetProportional(textDrawId, 1);
    TextDrawSetShadow(textDrawId, 1);
    TextDrawUseBox(textDrawId, 1);
    TextDrawBoxColor(textDrawId, 255);
    TextDrawTextSize(textDrawId, 438.000000, 50.000000);
    TextDrawSetSelectable(textDrawId, 0);

    Pkr_SetBackgroundTextDrawId(6, TextDrawCreate(236.000000, 203.000000, "_"));
    textDrawId = Pkr_GetBackgroundTextDrawId(6);
    TextDrawBackgroundColor(textDrawId, 255);
    TextDrawFont(textDrawId, 0);
    TextDrawLetterSize(textDrawId, 1.500000, 4.400000);
    TextDrawColor(textDrawId, -1);
    TextDrawSetOutline(textDrawId, 0);
    TextDrawSetProportional(textDrawId, 1);
    TextDrawSetShadow(textDrawId, 1);
    TextDrawUseBox(textDrawId, 1);
    TextDrawBoxColor(textDrawId, 255);
    TextDrawTextSize(textDrawId, 394.000000, 50.000000);
    TextDrawSetSelectable(textDrawId, 0);
    return;
}

Pkr_DestroyBackgroundTextDraws()
{
    Pkr_ForeachBackground(background)
    {
        TextDrawDestroy(Pkr_GetBackgroundTextDrawId(background));
        Pkr_SetBackgroundTextDrawId(background, Text: INVALID_TEXT_DRAW);
    }
    return;
}
