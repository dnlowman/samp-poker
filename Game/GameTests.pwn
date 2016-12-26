static const gameId = 2;

Pkr_InitialiseGameTests()
{
    new tests, fails, func[33];
    Testing_Run(tests, fails, func);
}

Test:GetGameByObjectId_InvalidId()
{
    // Given
    const objectId = INVALID_OBJECT_ID;

    // When
    new result = Pkr_GetGameByObjectId(objectId);

    // Then
    ASSERT(result == -1);
}

Test:GetGameByObjectId_Found()
{
    // Given
    const objectId = 4;
    Pkr_SetObjectId(gameId, objectId);

    // When
    new result = Pkr_GetGameByObjectId(objectId);

    // Then
    ASSERT(result == gameId);
}

TestClose:GetGameByObjectId_Found()
{
    Pkr_SetObjectId(gameId, INVALID_OBJECT_ID);
}

Test:GetGameByObjectId_NotFound()
{
    // Given
    const objectId = 4;

    // When
    new result = Pkr_GetGameByObjectId(objectId);

    // Then
    ASSERT(result == -1);
}
