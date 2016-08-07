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
