/* ================================================== *\
                    --------------------
                    Los Santos Role Play
                    Texas Hold 'em Poker
                    --------------------

Description:
    A complete Texas Hold 'em Poker mini-game
    for San Andreas Multiplayer.

Author(s):
    Noble -
        Game scripting.
        San Andreas Multiplayer plugin port.

    Cactus Kev -
        Hand Evaluator
        (http://www.suffecool.net/poker/evaluator.html)

    Paul Senzee -
        Hash optimizations.

Special Thanks:
    Los Santos Role Play development team
    San Andreas Mutliplayer development team
    Los Santos Role Play tester team

\* ================================================== */

#if defined POKER_SYSTEM
    #endinput
#endif

#define POKER_SYSTEM

#define RUN_TESTS

#if defined RUN_TESTS
    #include <YSI\y_testing>
    #include "Poker_Tests.pwn"
#endif

#include "Poker_Constants.pwn"
#include "Poker_Header.inc"

#include "Cards\Cards.pwn"
#include "Blinds\BlindsState.pwn"
#include "PlayerReady\PlayerReadyMain.pwn"
#include "PlayerStatus\PlayerStatusMain.pwn"
#include "PlayerChips\PlayerChipsMain.pwn"
#include "Game\GameMain.pwn"
#include "Poker_Utils.pwn"
#include "Player\PlayerMain.pwn"

#include "Background\Background_TextDraws.pwn"
#include "Menu\MenuMain.pwn"
#include "Pot\PotState.pwn"
#include "PlayerCard\PlayerCardState.pwn"
#include "TableCards\TableCardsMain.pwn"

/* Start of TextDraws */
#include "TextDraws\Poker_TextDraws.pwn"
/* End of TextDraws */

#include "3DTextLabels\3DTextLabels.pwn"
#include "Player\Player.pwn"
#include "Bots\Bots.pwn"
#include "Poker_Commands.pwn"
#include "Poker_Callbacks.pwn"

#include "TableManager\Main.pwn"
