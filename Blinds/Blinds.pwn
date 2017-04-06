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

#include "Blinds_TextDraws.pwn"
#include "BlindsState.pwn"
#include "Blinds_Commands.pwn"

Pkr_SetBlindValue(const gameId, const amount) {
	Pkr_SetBlind(gameId, amount);
	new tdText[128];
	format(tdText, sizeof(tdText), "BLINDS: ~y~$%d ~w~/ ~y~$%d", amount, amount << 1);
	TextDrawSetString(Pkr_GetBlindsTextDrawId(gameId), tdText);
	return;
}
