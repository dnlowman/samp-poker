PkrCMD_SetRake(const playerid, const parameters[]) {
	new Float: amount;
    if(sscanf(parameters, "f", amount)) {
        SendClientMessage(playerid, COLOR_RED, "USAGE: /pkr rake [amount]");
		SendClientMessage(playerid, COLOR_GREY, "HINT: The rake can be from 0.0 to 10.0 percent.");
        return;
    }

	new objectId = furn_pokerTableCheck(GetPlayerVirtualWorld(playerid), playerid);

    if(objectId <= 0 || objectId == INVALID_OBJECT_ID) {
        SendClientMessage(playerid, COLOR_RED, "You're not near any poker game. TODO: Biz owners can use this command...");
        return;
    }

    new gameId = Pkr_GetGameByObjectId(objectId);

    if(gameId == -1) {
        SendClientMessage(playerid, COLOR_RED, "You're not near any poker game.");
		return;
    }

	if(Pkr_GetGameStatus(gameId) != POKER_GAME_STATUS: LOBBY) {
		SendClientMessage(playerid, COLOR_RED, "The game has to be in the lobby to modify the rake.");
		return;
	}

	Pkr_SetRake(gameId, amount);
	new message[128];
	format(message, sizeof(message), "%s has updated the rake to %f percent.", Pkr_GetClientName(playerid), amount);
	Pkr_SendGameMessage(gameId, COLOR_ORANGE, message);
	Pkr_SetAllPlayersNotReady(gameId);
	return;
}
