Test:InitialisePokerTableArray()
{
    // Given & When
    TM_InitialisePokerTableArray();

    // Then
    for(new i = 0; i < MAX_TM_POKER_TABLES; ++i)
        ASSERT(g_rgTMPokerTables[i][OBJECT_ID] == INVALID_OBJECT_ID);
}

TestInit:GetFreePokerTableIndex()
{
    TM_InitialisePokerTableArray();
}

Test:GetFreePokerTableIndex()
{
    // Given
    g_rgTMPokerTables[0][OBJECT_ID] = 1;
    g_rgTMPokerTables[1][OBJECT_ID] = 1;
    g_rgTMPokerTables[2][OBJECT_ID] = 1;

    // When
    new result = TM_GetFreePokerTableIndex();

    // Then
    ASSERT(result == 3);
}

TestClose:GetFreePokerTableIndex()
{
    TM_InitialisePokerTableArray();
}

Test:IsTableIdValid_InvalidBelowZero()
{
    // Given
    new tableId = -1;

    // When
    new result = TM_IsTableIdValid(tableId);

    // Then
    ASSERT(result == false);
}

Test:IsTableIdValid_InvalidMax()
{
    // Given
    new tableId = MAX_TM_POKER_TABLES;

    // When
    new result = TM_IsTableIdValid(tableId);

    // Then
    ASSERT(result == false);
}

Test:IsTableIdValid_InvalidAboveMax()
{
    // Given
    new tableId = MAX_TM_POKER_TABLES + 1;

    // When
    new result = TM_IsTableIdValid(tableId);

    // Then
    ASSERT(result == false);
}

Test:IsTableIdValid_Valid()
{
    // Given
    new tableId = 0;

    // When
    new result = TM_IsTableIdValid(tableId);

    // Then
    ASSERT(result == true);
}

TestInit:DoesIndexContainTable_Valid()
{
    TM_InitialisePokerTableArray();
}

Test:DoesIndexContainTable_Valid()
{
    // Given
    new tableId = 0;
    g_rgTMPokerTables[tableId][OBJECT_ID] = 1;

    // When
    new result = TM_DoesIndexContainTable(tableId);

    // Then
    ASSERT(result == true);
}

TestClose:DoesIndexContainTable_Valid()
{
    TM_InitialisePokerTableArray();
}

TestInit:DoesIndexContainTable_InValid()
{
    TM_InitialisePokerTableArray();
}

Test:DoesIndexContainTable_InValid()
{
    // Given
    new tableId = -1;

    // When
    new result = TM_DoesIndexContainTable(tableId);

    // Then
    ASSERT(result == false);
}

TestClose:DoesIndexContainTable_InValid()
{
    TM_InitialisePokerTableArray();
}

TestInit:CreateTable_ReturnsArrayIndex()
{
    TM_InitialisePokerTableArray();
}

Test:CreateTable_ReturnsArrayIndex()
{
    // When
    new result = TM_CreateTable(0.0, 0.0, 0.0, 0.0, 0.0, 0.0);

    // Then
    ASSERT(result == 0);
    ASSERT(g_rgTMPokerTables[0][OBJECT_ID] != INVALID_OBJECT_ID);
}

TestClose:CreateTable_ReturnsArrayIndex()
{
    TM_InitialisePokerTableArray();
}

TestInit:DestroyTable_Valid()
{
    TM_InitialisePokerTableArray();
}

Test:DestroyTable_Valid()
{
    // Given
    new tableId = 0;
    g_rgTMPokerTables[tableId][OBJECT_ID] = 1;

    // When
    new result = TM_DestroyTable(tableId);

    // Then
    ASSERT(result == true);
    ASSERT(g_rgTMPokerTables[tableId][OBJECT_ID] == INVALID_OBJECT_ID);
}

TestClose:DestroyTable_Valid()
{
    TM_InitialisePokerTableArray();
}

TestInit:DestroyTable_InValid()
{
    TM_InitialisePokerTableArray();
}

Test:DestroyTable_InValid()
{
    // Given
    new tableId = 0;
    g_rgTMPokerTables[tableId][OBJECT_ID] = INVALID_OBJECT_ID;

    // When
    new result = TM_DestroyTable(tableId);

    // Then
    ASSERT(result == false);
    ASSERT(g_rgTMPokerTables[tableId][OBJECT_ID] == INVALID_OBJECT_ID);
}

TestClose:DestroyTable_InValid()
{
    TM_InitialisePokerTableArray();
}


TestInit:GetTableObjectId()
{
    TM_InitialisePokerTableArray();
}

Test:GetTableObjectId()
{
    // Given
    new tableId = 0;
    g_rgTMPokerTables[tableId][OBJECT_ID] = 4;

    // When
    new result = TM_GetTableObjectId(tableId);

    // Then
    ASSERT(result == 4);
}

TestClose:GetTableObjectId()
{
    TM_InitialisePokerTableArray();
}

TestInit:GetObjectTableId()
{
    TM_InitialisePokerTableArray();
}

Test:GetObjectTableId()
{
    // Given
    new tableId = 0;
    new objectId = 4;
    g_rgTMPokerTables[tableId][OBJECT_ID] = objectId;

    // When
    new result = TM_GetObjectTableId(objectId);

    // Then
    ASSERT(result == tableId);
}

TestClose:GetObjectTableId()
{
    TM_InitialisePokerTableArray();
}
