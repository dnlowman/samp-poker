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

PkrCMD_SetTimer(const playerid, const parameters[]) {
	new gameId = Pkr_GetPlayerGame(playerid);

	if(gameId == -1) {
        SendClientMessage(playerid, COLOR_RED, "You're not playing poker.");
        return;
    }

	new POKER_GAME_STATUS: status = Pkr_GetGameStatus(gameId);
	if(status != POKER_GAME_STATUS: LOBBY) {
		SendClientMessage(playerid, COLOR_RED, "The timer can only be modified in the lobby!");
		return;
	}

    new amount;
    if(sscanf(parameters, "i", amount))
    {
		SendClientMessage(playerid, COLOR_GREY, "USAGE: /pkr timer [amount]");
        SendClientMessage(playerid, COLOR_GREY, "HINT: You can set the timer between 10 - 60 seconds.");
		SendClientMessage(playerid, COLOR_GREY, "Setting the timer to 0 will turn it off.");
        return;
    }

	if(amount != 0 && (amount < 10 || amount > 60)) {
		SendClientMessage(playerid, COLOR_RED, "You can only set the timer between 10 - 60 seconds.");
		return;
	}

	Pkr_SetTimerStart(gameId, amount);
	Pkr_SetAllPlayersNotReady(gameId);

	if(amount == 0)
		Pkr_SendFormattedGameMessage(gameId, COLOR_RED, "%s has disabled the timer.", Pkr_GetClientName(playerid));
	else
		Pkr_SendFormattedGameMessage(gameId, COLOR_RED, "%s has set the timer to: %d.", Pkr_GetClientName(playerid), amount);
	return;
}
