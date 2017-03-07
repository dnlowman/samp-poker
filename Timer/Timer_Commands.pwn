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
        return;
    }

	if(amount < 10 || amount > 60) {
		SendClientMessage(playerid, COLOR_RED, "You can only set the timer between 10 - 60 seconds.");
		return;
	}

	Pkr_SetTimerStart(gameId, amount);
	Pkr_SetAllPlayersNotReady(gameId);
	Pkr_SendFormattedGameMessage(gameId, COLOR_RED, "%s has set the timer to: %d.", Pkr_GetClientName(playerid), amount);
	return;
}
