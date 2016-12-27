Pkr_InitialisePlayerCmdsTests()
{
    new tests, fails, func[33];
    Testing_Run(tests, fails, func);
}

Test:Join_InvalidPropertyId()
{
    // Given
    const playerid = 1;
    getPlayersCurrentPropReturns = -1;

    // When
    PkrCMD_Join(playerid);

    // Then
    new expected[] = "You have to be inside a property to play poker.";

    ASSERT(!isnull(sendClientMessageCalledWith));
    ASSERT(strcmp(sendClientMessageCalledWith, expected) == 0);
}

Test:Join_InvalidObjectId()
{
    // Given
    const playerid = 1;
    getPlayersCurrentPropReturns = 1;
    pokerTableCheckReturns = INVALID_OBJECT_ID;

    // When
    PkrCMD_Join(playerid);

    // Then
    new expected[] = "You're not near any poker game.";
    ASSERT(!isnull(sendClientMessageCalledWith));
    ASSERT(strcmp(sendClientMessageCalledWith, expected) == 0);
}
