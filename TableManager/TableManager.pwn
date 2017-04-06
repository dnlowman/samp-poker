/*
                    	© Los Santos Role Play 2017
                       		Texas Hold 'em Poker

							Release Candidate 1
--------------------------------------------------------------------------------

Description:
    A complete Texas Hold 'em Poker mini-game
    for San Andreas Multiplayer.

--------------------------------------------------------------------------------

Author(s):
    Noble -
        Game scripting.
        San Andreas Multiplayer plugin port.

    Cactus Kev -
        Hand Evaluator
        (http://www.suffecool.net/poker/evaluator.html)

    Paul Senzee -
        Hash optimizations.

--------------------------------------------------------------------------------

Special Thanks:
    Los Santos Role Play development team.
    San Andreas Mutliplayer development team.
    Los Santos Role Play tester team.

--------------------------------------------------------------------------------

License:
	Please see the enclosed LICENSE file in the repository.

*/

enum TM_POKER_TABLE
{
    OBJECT_ID
};
new g_rgTMPokerTables[MAX_TM_POKER_TABLES][TM_POKER_TABLE];

#define TM_InitialisePokerTableArray() \
            for(new i = 0; i < MAX_TM_POKER_TABLES; ++i) \
                g_rgTMPokerTables[i][OBJECT_ID] = INVALID_OBJECT_ID

#define TM_IsTableIdValid(%0) \
            (0 <= %0 < MAX_TM_POKER_TABLES)

#define TM_DoesIndexContainTable(%0) \
            (TM_IsTableIdValid(%0) && g_rgTMPokerTables[%0][OBJECT_ID] != INVALID_OBJECT_ID)

TM_GetFreePokerTableIndex()
{
    for(new i = 0; i < MAX_TM_POKER_TABLES; ++i)
        if(g_rgTMPokerTables[i][OBJECT_ID] == INVALID_OBJECT_ID)
            return i;
    return -1;
}

TM_CreateTable(Float: x, Float: y, Float: z, Float: rx, Float: ry, Float: rz)
{
    new _index = TM_GetFreePokerTableIndex();
    if(_index == -1)
        return -1;
    g_rgTMPokerTables[_index][OBJECT_ID] = CreateDynamicObject(POKER_OBJECT_MODEL, x, y, z, rx, ry, rz);
    return _index;
}

TM_DestroyTable(tableId)
{
    if(!TM_DoesIndexContainTable(tableId))
        return false;
    DestroyDynamicObject(g_rgTMPokerTables[tableId][OBJECT_ID]);
    g_rgTMPokerTables[tableId][OBJECT_ID] = INVALID_OBJECT_ID;
    return true;
}

TM_GetTableObjectId(tableId)
{
    if(!TM_DoesIndexContainTable(tableId))
        return INVALID_OBJECT_ID;
    return g_rgTMPokerTables[tableId][OBJECT_ID];
}

TM_GetObjectTableId(objectId)
{
    for(new i = 0; i < MAX_TM_POKER_TABLES; ++i)
        if(g_rgTMPokerTables[i][OBJECT_ID] == objectId)
            return i;
    return -1;
}
