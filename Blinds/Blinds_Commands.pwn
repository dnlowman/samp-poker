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

PkrCMD_SetBlind(const playerid, const parameters[]) {
	new gameId = Pkr_GetPlayerGame(playerid);

	if(gameId == -1) {
        SendClientMessage(playerid, COLOR_RED, "You're not playing poker.");
        return;
    }

	new POKER_GAME_STATUS: status = Pkr_GetGameStatus(gameId);
	if(status != POKER_GAME_STATUS: LOBBY) {
		SendClientMessage(playerid, COLOR_RED, "The blinds can only be modified in the lobby!");
		return;
	}

    new amount;
    if(sscanf(parameters, "i", amount))
    {
        SendClientMessage(playerid, COLOR_GREY, "USAGE: /pkr blind [amount]");
        return;
    }

	if(amount < 0 || amount > 10000) {
		SendClientMessage(playerid, COLOR_RED, "You can only set the small blind in a range of $0 - $10000.");
		return;
	}

	Pkr_SetBlindValue(gameId, amount);
	Pkr_SetAllPlayersNotReady(gameId);
	Pkr_SendFormattedGameMessage(gameId, COLOR_RED, "%s has set the small blind to: $%d. Make sure you have enough cash to meet the blinds!", Pkr_GetClientName(playerid), amount);
	return;
}
