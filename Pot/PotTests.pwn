static const gameId = 0;

Pkr_InitialisePotTests()
{
    new tests, fails, func[33];
    Testing_Run(tests, fails, func);
}

Test:SetPotAmount()
{
    // Given
    new amount = 100;

    // When
    Pkr_SetPotAmount(gameId, amount);

    // Then
    ASSERT(g_rgPokerGames[0][POT] == 100);
}

TestClose:SetPotAmount()
{
    Pkr_SetPotAmount(gameId, 0);
}

Test:GetPotAmount()
{
    // Given
    new amount = 100;
    Pkr_SetPotAmount(gameId, amount);

    // When
    new result = Pkr_GetPotAmount(gameId);

    // Then
    ASSERT(result == 100);
}

TestClose:GetPotAmount()
{
    Pkr_SetPotAmount(gameId, 0);
}

Test:AddToPot()
{
    // Given
    new initialAmount = 100;
    new addAmont = 200;
    Pkr_SetPotAmount(gameId, initialAmount);

    // When
    Pkr_AddToPot(gameId, addAmont);
    new result = Pkr_GetPotAmount(gameId);

    // Then
    ASSERT(result == addAmont + initialAmount);
}

TestClose:AddToPot()
{
    Pkr_SetPotAmount(gameId, 0);
}

Test:SubFromPot()
{
    // Given
    new initialAmount = 400;
    new subAmount = 200;
    Pkr_SetPotAmount(gameId, initialAmount);

    // When
    Pkr_SubFromPot(gameId, subAmount);
    new result = Pkr_GetPotAmount(gameId);

    // Then
    ASSERT(result == initialAmount - subAmount);
}

TestClose:SubFromPot()
{
    Pkr_SetPotAmount(gameId, 0);
}
