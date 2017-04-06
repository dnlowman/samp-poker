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

stock Pkr_SetPlayerChips(const gameId, const slot, const amount) {
    g_rgPokerGames[gameId][PLAYER_CHIPS][slot] = amount;
    new _chips[128];
    format(_chips, sizeof(_chips), "CHIPS: ~g~$%s", Pkr_FormatNumber(amount));
    Pkr_SetPlayerChipsTextDraw(gameId, slot, _chips);
}

stock Pkr_AddPlayerChips(const gameId, const slot, const amount)
{
    g_rgPokerGames[gameId][PLAYER_CHIPS][slot] += amount;
    new _chips[128];
    format(_chips, sizeof(_chips), "CHIPS: ~g~$%s", Pkr_FormatNumber(g_rgPokerGames[gameId][PLAYER_CHIPS][slot]));
    Pkr_SetPlayerChipsTextDraw(gameId, slot, _chips);
}

stock Pkr_MinusPlayerChips(const gameId, const slot, const amount)
{
    g_rgPokerGames[gameId][PLAYER_CHIPS][slot] -= amount;
    new _chips[128];
    format(_chips, sizeof(_chips), "CHIPS: ~g~$%s", Pkr_FormatNumber(g_rgPokerGames[gameId][PLAYER_CHIPS][slot]));
    Pkr_SetPlayerChipsTextDraw(gameId, slot, _chips);
}

Float: Pkr_ReturnAverageChips(const gameId) {
    new _total = 0;
    new _playerCount = 0;

	Pkr_ForeachPlayer(playerSlot) {
		if(Pkr_GetPlayerId(gameId, playerSlot) != INVALID_PLAYER_ID) {
			_total += g_rgPokerGames[gameId][PLAYER_CHIPS][playerSlot];
            _playerCount++;
		}
    }

    return _playerCount == 0 ? 0.0 : float(_total) / float(_playerCount);
}
