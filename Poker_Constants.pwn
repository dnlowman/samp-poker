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

native Eval5(hand[5]);
native Eval7(hand[7]);

//#define POKER_DEBUG
#define POKER_LSRP

const MAX_POKER_GAMES = 20;
const MAX_POKER_PLAYERS = 6;
const MAX_POKER_BACKGROUND_TEXTDRAWS = 7;
const MAX_POKER_MENU_ITEMS = 4;
const POKER_DIALOG_ID = 9997;
const MAX_POKER_DECK_CARDS = 52;
const POKER_OBJECT_MODEL = 19474;
const MAX_TABLE_CARDS = 5;
const POKER_DEFAULT_BLIND = 100;
const INVALID_POKER_GAME_ID = -1;
const MAX_POKER_TIMER = 20; // TODO: This can later be configurable...
const Float:POKER_CAMERA_HEIGHT = 4.0;

/* PVar Names */
#define POKER_PLAYER_GAME_VAR "PlayerPokerGame"
#define POKER_PLAYER_READY_VAR "PlayerPokerReady"
#define POKER_PLAYER_RAISE_AMOUNT_VAR "PlayerPokerRaiseAmount"
#define POKER_PLAYER_BET_AMOUNT_VAR "PlayerPokerBetAmount"
#define POKER_SPECTATE_VAR_NAME "POKER_SPECTATE_VAR_NAME"
#define POKER_CAMERA_VAR_NAME "POKER_CAMERA"
#define POKER_SIT_VAR_NAME "POKER_SIT_VAR"
#define POKER_CHIPS_VAR_NAME "POKER_CHIPS"

#if !defined BYTES_PER_CELL
    #define BYTES_PER_CELL (cellbits / 8)
#endif
