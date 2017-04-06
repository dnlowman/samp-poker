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

new g_rgCardDeck[MAX_POKER_DECK_CARDS];
new g_rgPrimeNumbers[] = { 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41 };

#define Pkr_InitDeck() \
            for(new a, b, c, suit = 0x8000; a < 4; a++, suit >>= 1) for(b = 0; b < 13; b++, c++) g_rgCardDeck[c] = g_rgPrimeNumbers[b] | (b << 8) | suit | (1 << (16 + b))
