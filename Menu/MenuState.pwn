#define Pkr_SetMenuItemOneState(%0,%1) \
            g_rgPokerGames[%0][MENU_ITEM_ONE_STATE] = %1

#define Pkr_SetMenuItemTwoState(%0,%1) \
            g_rgPokerGames[%0][MENU_ITEM_TWO_STATE] = %1

#define Pkr_GetMenuItemOneState(%0) \
            g_rgPokerGames[%0][MENU_ITEM_ONE_STATE]

#define Pkr_GetMenuItemTwoState(%0) \
            g_rgPokerGames[%0][MENU_ITEM_TWO_STATE]

stock Pkr_SetMenuItemOneStateBet(const gameId)
{
    Pkr_SetMenuItemOneState(gameId, POKER_MENU_STATES: BET);
    Pkr_SetMenuItemOneBet(gameId);
    return;
}

stock Pkr_SetMenuItemOneStateRaise(const gameId)
{
    Pkr_SetMenuItemOneState(gameId, POKER_MENU_STATES: RAISE);
    Pkr_SetMenuItemOneRaise(gameId);
    return;
}

stock Pkr_SetMenuItemTwoStateCheck(const gameId)
{
    Pkr_SetMenuItemTwoState(gameId, POKER_MENU_STATES: CHECK);
    Pkr_SetMenuItemTwoCheck(gameId);
    return;
}

stock Pkr_SetMenuItemTwoStateCall(const gameId)
{
    Pkr_SetMenuItemTwoState(gameId, POKER_MENU_STATES: CALL);
    Pkr_SetMenuItemTwoCall(gameId);
    return;
}
