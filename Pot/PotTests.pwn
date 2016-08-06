Pkr_InitialisePotTests()
{
    new tests, fails, func[33];
    Testing_Run(tests, fails, func);
}

Test:SetPotAmount()
{
    // Given
    new amount = 100;
    new gameId = 0;

    // When
    Pkr_SetPotAmount(gameId, amount);

    // Then
    ASSERT(g_rgPokerGames[0][POT] == 100);
}

Test:GetPotAmount()
{
    // Given
    new amount = 100;
    new gameId = 0;
    Pkr_SetPotAmount(gameId, amount);

    // When
    new result = Pkr_GetPotAmount(gameId);

    // Then
    ASSERT(result == 100);
}

Test:AddToPot()
{
    // Given
    new initialAmount = 100;
    new addAmont = 200;
    new gameId = 0;
    Pkr_SetPotAmount(gameId, initialAmount);

    // When
    Pkr_AddToPot(gameId, addAmont);
    new result = Pkr_GetPotAmount(gameId);

    // Then
    ASSERT(result == addAmont + initialAmount);
}

Test:SubFromPot()
{
    // Given
    new initialAmount = 400;
    new subAmount = 200;
    new gameId = 0;
    Pkr_SetPotAmount(gameId, initialAmount);

    // When
    Pkr_SubFromPot(gameId, subAmount);
    new result = Pkr_GetPotAmount(gameId);

    // Then
    ASSERT(result == initialAmount - subAmount);
}
