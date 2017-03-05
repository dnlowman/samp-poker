static const gameId = 0;

Pkr_InitialiseGameStateTests()
{
    new tests, fails, func[33];
    Testing_Run(tests, fails, func);
}

// Has every single player folded
TestInit:HaveAllPlayersFolded1()
{
    Pkr_SetIsAssigned(gameId, true);
    Pkr_SetPlayerId(gameId, 0, 1);
    Pkr_SetPlayerId(gameId, 1, 2);
    Pkr_SetPlayerId(gameId, 2, 3);
    Pkr_SetPlayerId(gameId, 3, 4);
    Pkr_SetPlayerId(gameId, 4, 5);
    Pkr_SetPlayerId(gameId, 5, 6);
    Pkr_SetPlayerStatusFolded(gameId, 0);
    Pkr_SetPlayerStatusFolded(gameId, 1);
    Pkr_SetPlayerStatusFolded(gameId, 2);
    Pkr_SetPlayerStatusFolded(gameId, 3);
    Pkr_SetPlayerStatusFolded(gameId, 4);
    Pkr_SetPlayerStatusFolded(gameId, 5);
}

Test:HaveAllPlayersFolded1()
{
    // When
    new bool: result = HaveAllPlayersFolded(gameId);

    // Then
    ASSERT(result == true);
}

TestClose:HaveAllPlayersFolded1()
{
    Pkr_SetIsAssigned(gameId, false);
    Pkr_SetPlayerId(gameId, 0, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 1, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 2, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 3, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 4, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 5, INVALID_PLAYER_ID);
}

// Has every player folded minus 1
TestInit:HaveAllPlayersFolded2()
{
    Pkr_SetIsAssigned(gameId, true);
    Pkr_SetPlayerId(gameId, 0, 1);
    Pkr_SetPlayerId(gameId, 1, 2);
    Pkr_SetPlayerId(gameId, 2, 3);
    Pkr_SetPlayerId(gameId, 3, 4);
    Pkr_SetPlayerId(gameId, 4, 5);
    Pkr_SetPlayerId(gameId, 5, 6);
    Pkr_SetPlayerStatusFolded(gameId, 0);
    Pkr_SetPlayerStatusFolded(gameId, 1);
    Pkr_SetPlayerStatusFolded(gameId, 2);
    Pkr_SetPlayerStatusFolded(gameId, 3);
    Pkr_SetPlayerStatusFolded(gameId, 4);
    Pkr_SetPlayerStatusPlaying(gameId, 5);
}

Test:HaveAllPlayersFolded2()
{
    // When
    new bool: result = HaveAllPlayersFolded(gameId);

    // Then
    ASSERT(result == true);
}

TestClose:HaveAllPlayersFolded2()
{
    Pkr_SetIsAssigned(gameId, false);
    Pkr_SetPlayerId(gameId, 0, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 1, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 2, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 3, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 4, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 5, INVALID_PLAYER_ID);
}

// Has every player folded minus 1 with one player ALL_IN
TestInit:HaveAllPlayersFolded3()
{
    Pkr_SetIsAssigned(gameId, true);
    Pkr_SetPlayerId(gameId, 0, 1);
    Pkr_SetPlayerId(gameId, 1, 2);
    Pkr_SetPlayerId(gameId, 2, 3);
    Pkr_SetPlayerId(gameId, 3, 4);
    Pkr_SetPlayerId(gameId, 4, 5);
    Pkr_SetPlayerId(gameId, 5, 6);
    Pkr_SetPlayerStatusFolded(gameId, 0);
    Pkr_SetPlayerStatusFolded(gameId, 1);
    Pkr_SetPlayerStatusFolded(gameId, 2);
    Pkr_SetPlayerStatusFolded(gameId, 3);
    Pkr_SetPlayerStatusAllIn(gameId, 4);
    Pkr_SetPlayerStatusPlaying(gameId, 5);
}

Test:HaveAllPlayersFolded3()
{
    // When
    new bool: result = HaveAllPlayersFolded(gameId);

    // Then
    ASSERT(result == true);
}

TestClose:HaveAllPlayersFolded3()
{
    Pkr_SetIsAssigned(gameId, false);
    Pkr_SetPlayerId(gameId, 0, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 1, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 2, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 3, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 4, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 5, INVALID_PLAYER_ID);
}

// Has every player folded with one player ALL_IN
TestInit:HaveAllPlayersFolded4()
{
    Pkr_SetIsAssigned(gameId, true);
    Pkr_SetPlayerId(gameId, 0, 1);
    Pkr_SetPlayerId(gameId, 1, 2);
    Pkr_SetPlayerId(gameId, 2, 3);
    Pkr_SetPlayerId(gameId, 3, 4);
    Pkr_SetPlayerId(gameId, 4, 5);
    Pkr_SetPlayerId(gameId, 5, 6);
    Pkr_SetPlayerStatusFolded(gameId, 0);
    Pkr_SetPlayerStatusFolded(gameId, 1);
    Pkr_SetPlayerStatusFolded(gameId, 2);
    Pkr_SetPlayerStatusFolded(gameId, 3);
    Pkr_SetPlayerStatusFolded(gameId, 4);
    Pkr_SetPlayerStatusAllIn(gameId, 5);
}

Test:HaveAllPlayersFolded4()
{
    // When
    new bool: result = HaveAllPlayersFolded(gameId);

    // Then
    ASSERT(result == true);
}

TestClose:HaveAllPlayersFolded4()
{
    Pkr_SetIsAssigned(gameId, false);
    Pkr_SetPlayerId(gameId, 0, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 1, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 2, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 3, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 4, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 5, INVALID_PLAYER_ID);
}

/* -------------------------------------------------------------------------- */

// Has every single player checked
TestInit:HaveAllPlayersChecked1()
{
    Pkr_SetIsAssigned(gameId, true);
    Pkr_SetPlayerId(gameId, 0, 1);
    Pkr_SetPlayerId(gameId, 1, 2);
    Pkr_SetPlayerId(gameId, 2, 3);
    Pkr_SetPlayerId(gameId, 3, 4);
    Pkr_SetPlayerId(gameId, 4, 5);
    Pkr_SetPlayerId(gameId, 5, 6);
    Pkr_SetPlayerStatusChecked(gameId, 0);
    Pkr_SetPlayerStatusChecked(gameId, 1);
    Pkr_SetPlayerStatusChecked(gameId, 2);
    Pkr_SetPlayerStatusChecked(gameId, 3);
    Pkr_SetPlayerStatusChecked(gameId, 4);
    Pkr_SetPlayerStatusChecked(gameId, 5);
}

Test:HaveAllPlayersChecked1()
{
    // When
    new bool: result = HaveAllPlayersChecked(gameId);

    // Then
    ASSERT(result == true);
}

TestClose:HaveAllPlayersChecked1()
{
    Pkr_SetIsAssigned(gameId, false);
    Pkr_SetPlayerId(gameId, 0, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 1, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 2, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 3, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 4, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 5, INVALID_PLAYER_ID);
}

// Has every single player checked minus 1
TestInit:HaveAllPlayersChecked2()
{
    Pkr_SetIsAssigned(gameId, true);
    Pkr_SetPlayerId(gameId, 0, 1);
    Pkr_SetPlayerId(gameId, 1, 2);
    Pkr_SetPlayerId(gameId, 2, 3);
    Pkr_SetPlayerId(gameId, 3, 4);
    Pkr_SetPlayerId(gameId, 4, 5);
    Pkr_SetPlayerId(gameId, 5, 6);
    Pkr_SetPlayerStatusChecked(gameId, 0);
    Pkr_SetPlayerStatusChecked(gameId, 1);
    Pkr_SetPlayerStatusChecked(gameId, 2);
    Pkr_SetPlayerStatusChecked(gameId, 3);
    Pkr_SetPlayerStatusChecked(gameId, 4);
    Pkr_SetPlayerStatusPlaying(gameId, 5);
}

Test:HaveAllPlayersChecked2()
{
    // When
    new bool: result = HaveAllPlayersChecked(gameId);

    // Then
    ASSERT(result == false);
}

TestClose:HaveAllPlayersChecked2()
{
    Pkr_SetIsAssigned(gameId, false);
    Pkr_SetPlayerId(gameId, 0, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 1, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 2, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 3, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 4, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 5, INVALID_PLAYER_ID);
}

// Has every single player checked minus 1 folded
TestInit:HaveAllPlayersChecked3()
{
    Pkr_SetIsAssigned(gameId, true);
    Pkr_SetPlayerId(gameId, 0, 1);
    Pkr_SetPlayerId(gameId, 1, 2);
    Pkr_SetPlayerId(gameId, 2, 3);
    Pkr_SetPlayerId(gameId, 3, 4);
    Pkr_SetPlayerId(gameId, 4, 5);
    Pkr_SetPlayerId(gameId, 5, 6);
    Pkr_SetPlayerStatusChecked(gameId, 0);
    Pkr_SetPlayerStatusChecked(gameId, 1);
    Pkr_SetPlayerStatusChecked(gameId, 2);
    Pkr_SetPlayerStatusChecked(gameId, 3);
    Pkr_SetPlayerStatusChecked(gameId, 4);
    Pkr_SetPlayerStatusFolded(gameId, 5);
}

Test:HaveAllPlayersChecked3()
{
    // When
    new bool: result = HaveAllPlayersChecked(gameId);

    // Then
    ASSERT(result == true);
}

TestClose:HaveAllPlayersChecked3()
{
    Pkr_SetIsAssigned(gameId, false);
    Pkr_SetPlayerId(gameId, 0, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 1, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 2, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 3, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 4, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 5, INVALID_PLAYER_ID);
}

// Has every single player checked minus 1 all in
TestInit:HaveAllPlayersChecked4()
{
    Pkr_SetIsAssigned(gameId, true);
    Pkr_SetPlayerId(gameId, 0, 1);
    Pkr_SetPlayerId(gameId, 1, 2);
    Pkr_SetPlayerId(gameId, 2, 3);
    Pkr_SetPlayerId(gameId, 3, 4);
    Pkr_SetPlayerId(gameId, 4, 5);
    Pkr_SetPlayerId(gameId, 5, 6);
    Pkr_SetPlayerStatusChecked(gameId, 0);
    Pkr_SetPlayerStatusChecked(gameId, 1);
    Pkr_SetPlayerStatusChecked(gameId, 2);
    Pkr_SetPlayerStatusChecked(gameId, 3);
    Pkr_SetPlayerStatusChecked(gameId, 4);
    Pkr_SetPlayerStatusAllIn(gameId, 5);
}

Test:HaveAllPlayersChecked4()
{
    // When
    new bool: result = HaveAllPlayersChecked(gameId);

    // Then
    ASSERT(result == true);
}

TestClose:HaveAllPlayersChecked4()
{
    Pkr_SetIsAssigned(gameId, false);
    Pkr_SetPlayerId(gameId, 0, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 1, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 2, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 3, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 4, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 5, INVALID_PLAYER_ID);
}

// Has every single player checked minus 1 all in and minus 1 folded
TestInit:HaveAllPlayersChecked5()
{
    Pkr_SetIsAssigned(gameId, true);
    Pkr_SetPlayerId(gameId, 0, 1);
    Pkr_SetPlayerId(gameId, 1, 2);
    Pkr_SetPlayerId(gameId, 2, 3);
    Pkr_SetPlayerId(gameId, 3, 4);
    Pkr_SetPlayerId(gameId, 4, 5);
    Pkr_SetPlayerId(gameId, 5, 6);
    Pkr_SetPlayerStatusChecked(gameId, 0);
    Pkr_SetPlayerStatusChecked(gameId, 1);
    Pkr_SetPlayerStatusChecked(gameId, 2);
    Pkr_SetPlayerStatusChecked(gameId, 3);
    Pkr_SetPlayerStatusFolded(gameId, 4);
    Pkr_SetPlayerStatusAllIn(gameId, 5);
}

Test:HaveAllPlayersChecked5()
{
    // When
    new bool: result = HaveAllPlayersChecked(gameId);

    // Then
    ASSERT(result == true);
}

TestClose:HaveAllPlayersChecked5()
{
    Pkr_SetIsAssigned(gameId, false);
    Pkr_SetPlayerId(gameId, 0, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 1, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 2, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 3, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 4, INVALID_PLAYER_ID);
    Pkr_SetPlayerId(gameId, 5, INVALID_PLAYER_ID);
}
