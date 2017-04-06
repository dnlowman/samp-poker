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

new textDrawDestroyCalls = 0;
stock Pkr_TextDrawDestroy(Text:text)
{
    // Call the old version, no need to check if it exists.
    TextDrawDestroy(text);
    ++textDrawDestroyCalls;
    return 1;
}
// Has this been hooked already?
#if defined _ALS_TextDrawDestroy
    #undef TextDrawDestroy
#else
    #define _ALS_TextDrawDestroy
#endif
// Reroute future calls to our function.
#define TextDrawDestroy Pkr_TextDrawDestroy

/* -------------------------------------------------------------------------- */

new textDrawShowForPlayerCalls = 0;
stock Pkr_TextDrawShowForPlayer(playerid, Text: text)
{
    TextDrawShowForPlayer(playerid, text);
    ++textDrawShowForPlayerCalls;
    return 1;
}

#if defined _ALS_TextDrawShowForPlayer
    #undef TextDrawShowForPlayer
#else
    #define _ALS_TextDrawShowForPlayer
#endif
#define TextDrawShowForPlayer Pkr_TextDrawShowForPlayer

/* -------------------------------------------------------------------------- */

new textDrawHideForPlayerCalls = 0;
stock Pkr_TextDrawHideForPlayer(playerid, Text: text)
{
    TextDrawHideForPlayer(playerid, text);
    ++textDrawHideForPlayerCalls;
    return 1;
}

#if defined _ALS_TextDrawHideForPlayer
    #undef TextDrawHideForPlayer
#else
    #define _ALS_TextDrawHideForPlayer
#endif
#define TextDrawHideForPlayer Pkr_TextDrawHideForPlayer


/* -------------------------------------------------------------------------- */

new sendClientMessageCalledWith[128];
Pkr_SendClientMessage(const playerid, const color, const msg[])
{
    format(sendClientMessageCalledWith, sizeof(sendClientMessageCalledWith), "%s", msg);
    // Call the old version, no need to check if it exists.
    SendClientMessage(playerid, color, msg);
    return 1;
}
// Has this been hooked already?
#if defined _ALS_SendClientMessage
    #undef SendClientMessage
#else
    #define _ALS_SendClientMessage
#endif
// Reroute future calls to our function.
#define SendClientMessage Pkr_SendClientMessage

/* -------------------------------------------------------------------------- */

new pokerTableCheckReturns = INVALID_OBJECT_ID;

stock stub_furn_pokerTableCheck(playerid, amount)
{
    #pragma unused playerid, amount
    return pokerTableCheckReturns;
}

#if defined _ALS_furn_pokerTableCheck
    #undef furn_pokerTableCheck
#else
    #define _ALS_furn_pokerTableCheck
#endif

#define furn_pokerTableCheck stub_furn_pokerTableCheck

/* -------------------------------------------------------------------------- */

new getPlayersCurrentPropReturns = -1;

stock stub_GetPlayersCurrentProp(playerid)
{
    #pragma unused playerid
    return getPlayersCurrentPropReturns;
}

#if defined _ALS_GetPlayersCurrentProperty
    #undef GetPlayersCurrentProperty
#else
    #define _ALS_GetPlayersCurrentProperty
#endif

#define GetPlayersCurrentProperty stub_GetPlayersCurrentProp
