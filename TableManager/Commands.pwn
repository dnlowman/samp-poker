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
