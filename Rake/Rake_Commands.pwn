PkrCMD_SetRake(const playerid, const parameters[]) {
	new Float: amount;
    if(sscanf(parameters, "f", amount)) {
        SendClientMessage(playerid, COLOR_RED, "USAGE: /pkr rake [amount]");
		SendClientMessage(playerid, COLOR_GREY, "HINT: The rake can be from 0.0 to 10.0 percent.");
        return;
    }

	new businessId = GetPlayersCurrentBusiness(playerid);

	if(businessId == -1) {
		SendClientMessage(playerid, COLOR_RED, "You need to be inside a business to use this command.");
        return;
	}

	new hasAccess = DoesPlayerAccessBusiness(playerid, businessId);

	if(!hasAccess) {
		SendClientMessage(playerid, COLOR_RED, "You need to own or be employed by the business to use this command.");
        return;
	}

	if(amount < 0.0 || amount > 10.0) {
		SendClientMessage(playerid, COLOR_RED, "The rake has to be a value in the range of 0.0 to 10.0 percent.");
        return;
	}

	Pkr_SetRake(businessId, amount);
	new message[128];
	format(message, sizeof(message), "You have updated the business poker rake to %.1f percent.", amount);
	SendClientMessage(playerid, COLOR_RED, message);
	return;
}
