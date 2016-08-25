Pkr_PlayerConfirmBet(const gameId, const player, const amount)
{
    Pkr_AddToPot(gameId, amount);
    Pkr_MinusPlayerChips(gameId, player, amount);
}
