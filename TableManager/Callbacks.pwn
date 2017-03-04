#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
    #if defined TM_OnFilterScriptInit
        TM_OnFilterScriptInit();
    #endif
    TM_InitialisePokerTableArray();

	ConnectNPC("Bot_A", "npcidle");
	ConnectNPC("Bot_B", "npcidle");
	ConnectNPC("Bot_C", "npcidle");
	ConnectNPC("Bot_D", "npcidle");
	ConnectNPC("Bot_E", "npcidle");
}

#else

public OnGameModeInit()
{
    #if defined TM_OnGameModeInit
        TM_OnGameModeInit();
    #endif
    TM_InitialisePokerTableArray();
}

#endif

public OnPlayerSelectDynamicObject(playerid, objectid, modelid, Float:x, Float:y, Float:z)
{
    #if defined TM_OnPlayerSelectDynamicObject
        TM_OnPlayerSelectDynamicObject(playerid, objectid, modelid, x, y, z);
    #endif
    new _tableId = TM_GetObjectTableId(objectid);
    if(_tableId == -1)
        return SendClientMessage(playerid, COLOR_RED, "ERROR: That object is not a poker table.");
    TM_DestroyTable(_tableId);
    CancelEdit(playerid);
    return SendClientMessage(playerid, COLOR_RED, "Deleted!");
}

public OnPlayerEditDynamicObject(playerid, objectid, response, Float: x, Float: y, Float: z, Float: rx, Float: ry, Float: rz)
{
    #if defined TM_OnPlayerEditDynamicObject
        TM_OnPlayerEditDyObj(playerid, objectid, response, x, y, z, rx, ry, rz);
    #endif
    new Float:oldX, Float:oldY, Float:oldZ, Float:oldRotX, Float:oldRotY, Float:oldRotZ;
    GetDynamicObjectPos(objectid, oldX, oldY, oldZ);
    GetDynamicObjectRot(objectid, oldRotX, oldRotY, oldRotZ);

    SetDynamicObjectPos(objectid, x, y, z);
    SetDynamicObjectRot(objectid, rx, ry, rz);
}

#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit TM_OnFilterScriptInit
#if defined TM_OnFilterScriptInit
    forward TM_OnFilterScriptInit();
#endif

#if defined _ALS_OnGameModeInit
    #undef OnGameModeInit
#else
    #define _ALS_OnGameModeInit
#endif
#define OnGameModeInit TM_OnGameModeInit
#if defined TM_OnGameModeInit
    forward TM_OnGameModeInit();
#endif

#if defined _ALS_OnPlayerSelDyObj
    #undef OnPlayerSelectDynamicObject
#else
    #define _ALS_OnPlayerSelDyObj
#endif
#define OnPlayerSelectDynamicObject TM_OnPlayerSelDyObj
#if defined TM_OnPlayerSelDyObj
    forward TM_OnPlayerSelDyObj(playerid, objectid, modelid, Float:x, Float:y, Float:z);
#endif

#if defined _ALS_OnPlayerEditDyObj
    #undef OnPlayerEditDynamicObject
#else
    #define _ALS_OnPlayerEditDyObj
#endif
#define OnPlayerEditDynamicObject TM_OnPlayerEditDyObj
#if defined TM_OnPlayerEditDyObj
    forward TM_OnPlayerEditDyObj(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz);
#endif
