Pkr_PlayerConfirmBet(const gameId, const player, const amount)
{
    Pkr_AddToPot(gameId, amount);
    Pkr_MinusPlayerChips(gameId, player, amount);
    Pkr_SetLastAggressivePlayer(gameId, player);
    Pkr_AddToPlayerBetContribution(gameId, player, amount);
    Pkr_AddToPlayerPotContribution(gameId, player, amount);
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
    Pkr_AddToPot(gameId, meetAmount);
    Pkr_MinusPlayerChips(gameId, player, meetAmount + amount);
    Pkr_AddToPlayerBetContribution(gameId, player, meetAmount + amount);
    Pkr_AddToPlayerPotContribution(gameId, player, meetAmount + amount);
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
