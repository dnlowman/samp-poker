#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
    #if defined Pkr_OnFilterScriptInit
        Pkr_OnFilterScriptInit();
    #endif
	Pkr_InitialisePoker();

	SetTimer("Pkr_OnOneSecond", 1000, true);

    #if defined RUN_TESTS
        Pkr_InitialiseTests();
    #endif
    return 1;
}

#if defined _ALS_OnFilterScriptInit
    #undef OnFilterScriptInit
#else
    #define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit Pkr_OnFilterScriptInit
#if defined Pkr_OnFilterScriptInit
    forward Pkr_OnFilterScriptInit();
#endif

public OnFilterScriptExit()
{
    #if defined Pkr_OnFilterScriptExit
        Pkr_OnFilterScriptExit();
    #endif
    for(new _j = 0; _j < MAX_POKER_GAMES; ++_j)
    {
        if(Pkr_GetIsAssigned(_j))
        {
            Pkr_UnassignAllPlayers(_j);
			Pkr_UnassignAllSpectators(_j);
            Pkr_DestroyGame(_j);
        }
    }

    return 1;
}

#if defined _ALS_OnFilterScriptExit
    #undef OnFilterScriptExit
#else
    #define _ALS_OnFilterScriptExit
#endif
#define OnFilterScriptExit Pkr_OnFilterScriptExit
#if defined Pkr_OnFilterScriptExit
    forward Pkr_OnFilterScriptExit();
#endif

#else

public OnGameModeInit()
{
    #if defined Pkr_OnGameModeInit
        Pkr_OnGameModeInit();
    #endif
    Pkr_InitialisePoker();
	SetTimer("Pkr_OnOneSecond", 1000, true);
}

#if defined _ALS_OnGameModeInit
    #undef OnGameModeInit
#else
    #define _ALS_OnGameModeInit
#endif
#define OnGameModeInit Pkr_OnGameModeInit
#if defined Pkr_OnGameModeInit
    forward Pkr_OnGameModeInit();
#endif

#endif

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
    #if defined Pkr_OnPlayerClickTextDraw
        Pkr_OnPlayerClickTextDraw(playerid, clickedid);
    #endif

    new bool: _handled = false;

    _handled = Pkr_PlayerReadyTextDrawClick(playerid, clickedid);

    if(!_handled)
        Pkr_PlayerMenuTextDrawClick(playerid, clickedid);

    return 0;
}

#if defined _ALS_OnPlayerClickTextDraw
    #undef OnPlayerClickTextDraw
#else
    #define _ALS_OnPlayerClickTextDraw
#endif
#define OnPlayerClickTextDraw Pkr_OnPlayerClickTextDraw
#if defined Pkr_OnPlayerClickTextDraw
    forward Pkr_OnPlayerClickTextDraw(playerid, Text:clickedid);
#endif

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    #if defined Pkr_OnDialogResponse
        Pkr_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
    #endif

    if(dialogid != POKER_DIALOG_ID)
        return 0;

    Pkr_PlayerDialogResponse(playerid, dialogid, response, listitem, inputtext);
    Pkr_GameDialogResponse(playerid, dialogid, response, listitem, inputtext);

    return 1;
}

#if defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif
#define OnDialogResponse Pkr_OnDialogResponse
#if defined Pkr_OnDialogResponse
    forward Pkr_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif

public OnPlayerDeath(playerid, killerid, reason)
{
	#if defined Pkr_OnPlayerDeath
        Pkr_OnPlayerDeath(playerid, killerid, reason);
    #endif

	if(!Pkr_IsPlayerOnAnyGame(playerid))
		return;

	new gameId = Pkr_GetPlayerGame(playerid);
	Pkr_UnassignPlayerFromGame(playerid, gameId);
	return;
}

#if defined _ALS_OnPlayerDeath
    #undef OnPlayerDeath
#else
    #define _ALS_OnPlayerDeath
#endif
#define OnPlayerDeath Pkr_OnPlayerDeath
#if defined Pkr_OnPlayerDeath
    forward Pkr_OnPlayerDeath(playerid, killerid, reason);
#endif

public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart)
{
	#if defined Pkr_OnPlayerTakeDamage
        Pkr_OnPlayerTakeDamage(playerid, issuerid, amount, weaponid, bodypart);
    #endif

	new gameId = Pkr_GetPlayerGame(playerid);
	if(gameId == -1)
		return;

	if(issuerid == INVALID_PLAYER_ID)
		return;

	SetCameraBehindPlayer(playerid);
	Pkr_HidePlayerTextDraws(playerid, gameId);
	TogglePlayerControllable(playerid, 0);
	SendClientMessage(playerid, COLOR_GREEN, "You've taken damage, you can sit at the game again by using /pkr sit");
    return;
}

#if defined _ALS_OnPlayerTakeDamage
    #undef OnPlayerTakeDamage
#else
    #define _ALS_OnPlayerTakeDamage
#endif
#define OnPlayerTakeDamage Pkr_OnPlayerTakeDamage
#if defined Pkr_OnPlayerTakeDamage
    forward Pkr_OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart);
#endif
