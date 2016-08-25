Pkr_InitialiseGameActionsTests()
{
    new tests, fails, func[33];
    Testing_Run(tests, fails, func);
}

// Adds the bet to the pot
Test:PlayerConfirmBet1()
{
    // Given
    const gameId = 1;
    const player = 1;
    const amount = 250;
    const currentPotAmount = 200;
    Pkr_SetPotAmount(gameId, currentPotAmount);

    // When
    Pkr_PlayerConfirmBet(gameId, player, amount);
    new result = Pkr_GetPotAmount(gameId);

    // Then
    ASSERT(result == 450);
}

// Minuses the bet from the players chips
Test:PlayerConfirmBet2()
{
    // Given
    const gameId = 1;
    const player = 1;
    const amount = 250;
    const playerChips = 4000;
    Pkr_SetPlayerChips(gameId, player, playerChips);

    // When
    Pkr_PlayerConfirmBet(gameId, player, amount);
    new result = Pkr_GetPlayerChips(gameId, player);

    // Then
    ASSERT(result == 3750);
}
