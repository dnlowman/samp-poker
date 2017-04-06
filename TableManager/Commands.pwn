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

CMD:create_table(playerid, cmdtext[])
{
    new Float: x,
        Float: y,
        Float: z;
    GetPlayerPos(playerid, x, y, z);
    new tableId = TM_CreateTable(x, y, z, 0.0, 0.0, 0.0);
    new objectId = TM_GetTableObjectId(tableId);
    EditDynamicObject(playerid, objectId);
    return 1;
}

CMD:destroy_table(playerid, cmdtext[])
{
    SelectObject(playerid);
    SendClientMessage(playerid, COLOR_RED, "Select a poker table to destroy.");
    return 1;
}
