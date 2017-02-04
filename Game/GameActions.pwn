Pkr_PlayerConfirmBet(const gameId, const player, const amount)
{
    Pkr_AddToPot(gameId, amount);
    Pkr_MinusPlayerChips(gameId, player, amount);
    Pkr_SetLastAggressivePlayer(gameId, player);
    Pkr_AddToPlayerBetContribution(gameId, player, amount);
    Pkr_AddToPlayerPotContribution(gameId, player, amount);

	new message[128];
	format(message, sizeof(message), "Adding %d to playerSlots %d contribution", amount, player);
	SendClientMessageToAll(COLOR_RED, message);

    Pkr_SetLastBet(gameId, amount);
    Pkr_AddToCurrentBet(gameId, amount);
    Pkr_SetPlayerStatusBet(gameId, player, amount);
    Pkr_SetAmountOfPlays(gameId, 1);
    Pkr_SetNextPlayerPlaying(gameId);
    return;
}

// meetAmount is the total amount of chips the player has to meet the previous bet
Pkr_PlayerConfirmRaise(const gameId, const player, const amount, const meetAmount)
{
    Pkr_AddToPot(gameId, meetAmount + amount);
    Pkr_MinusPlayerChips(gameId, player, meetAmount + amount);
    Pkr_AddToPlayerBetContribution(gameId, player, meetAmount + amount);
    Pkr_AddToPlayerPotContribution(gameId, player, meetAmount + amount);

	new message[128];
	format(message, sizeof(message), "Adding %d to playerSlots %d contribution", meetAmount + amount, player);
	SendClientMessageToAll(COLOR_RED, message);

    Pkr_SetLastAggressivePlayer(gameId, player);
    Pkr_SetLastBet(gameId, amount);
    Pkr_AddToCurrentBet(gameId, amount);
    Pkr_SetPlayerStatusRaised(gameId, player, amount);
    Pkr_SetAmountOfPlays(gameId, 1);
    Pkr_SetNextPlayerPlaying(gameId);
    return;
}

Pkr_PlayerConfirmCall(const gameId, const player, const amount)
{
    Pkr_AddToPot(gameId, amount);
    Pkr_MinusPlayerChips(gameId, player, amount);
    Pkr_AddToPlayerBetContribution(gameId, player, amount);
    Pkr_AddToPlayerPotContribution(gameId, player, amount);

	new message[128];
	format(message, sizeof(message), "Adding %d to playerSlots %d contribution", amount, player);
	SendClientMessageToAll(COLOR_RED, message);

    Pkr_IncAmountOfPlays(gameId);
    Pkr_SetPlayerStatusCalled(gameId, player, amount);
    Pkr_SetNextPlayerPlaying(gameId);
    return;
}

Pkr_PlayerCheckConfirm(const gameId, const player)
{
    Pkr_IncAmountOfPlays(gameId);
    Pkr_SetPlayerStatusChecked(gameId, player);
    Pkr_SetNextPlayerPlaying(gameId);
    return;
}
