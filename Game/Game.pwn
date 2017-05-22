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

#define Pkr_IsValidGameId(%0) \
            (0 <= %0 < MAX_POKER_GAMES)



Pkr_InitialisePoker() {
    for(new _i = 0; _i < MAX_POKER_GAMES; ++_i)
        Pkr_InitialiseGame(_i);

    Pkr_InitDeck();
}

Pkr_GetGameCount() {
    new _count = 0;
    for(new _i = 0; _i < MAX_POKER_GAMES; ++_i)
        if(g_rgPokerGames[_i][IS_ASSIGNED])
            ++_count;
    return _count;
}

#define Pkr_GetIsAssigned(%0) \
            g_rgPokerGames[%0][IS_ASSIGNED]

#define Pkr_SetIsAssigned(%0,%1) \
        g_rgPokerGames[%0][IS_ASSIGNED] = %1

stock bool: Pkr_GetPosition(const gameId, &Float: x, &Float: y, &Float: z) {
    if(Pkr_IsValidGameId(gameId)) {
        x = g_rgPokerGames[gameId][POSITION][PokerX];
        y = g_rgPokerGames[gameId][POSITION][PokerY];
        z = g_rgPokerGames[gameId][POSITION][PokerZ];
        return true;
    }
    return false;
}

bool: Pkr_SetPosition(const gameId, const Float: x, const Float: y, const Float: z) {
    if(Pkr_IsValidGameId(gameId)) {
        g_rgPokerGames[gameId][POSITION][PokerX] = x;
        g_rgPokerGames[gameId][POSITION][PokerY] = y;
        g_rgPokerGames[gameId][POSITION][PokerZ] = z;
        return true;
    }
    return false;
}

Pkr_InitialiseGame(const gameId) {
    g_rgPokerGames[gameId][IS_ASSIGNED] = false;
    g_rgPokerGames[gameId][POT_TEXTDRAW] = Text: INVALID_TEXT_DRAW;
    g_rgPokerGames[gameId][POT] = 0;
    g_rgPokerGames[gameId][BLIND] = 0;
    g_rgPokerGames[gameId][MENU_ITEM_ONE_STATE] = POKER_MENU_STATES: BET;
    g_rgPokerGames[gameId][MENU_ITEM_TWO_STATE] = POKER_MENU_STATES: CALL;
    g_rgPokerGames[gameId][DEALER] = INVALID_PLAYER_ID;
    g_rgPokerGames[gameId][SMALL_BLIND_POSITION] = -1;
    g_rgPokerGames[gameId][BIG_BLIND_POSITION] = -1;
    g_rgPokerGames[gameId][GAME_STATUS] = POKER_GAME_STATUS: LOBBY;
    Pkr_SetCurrentBet(gameId, 0);
    Pkr_SetCurrentPlayerPosition(gameId, -1);
    Pkr_SetLastAggressivePlayer(gameId, INVALID_PLAYER_ID);
    Pkr_SetLastBet(gameId, 0);
    Pkr_SetObjectId(gameId, INVALID_OBJECT_ID);
	Pkr_SetTimerStart(gameId, MAX_POKER_TIMER);
	Pkr_SetTimer(gameId, MAX_POKER_TIMER);
	Pkr_SetBusiness(gameId, -1);

    for(new _j = 0; _j < MAX_POKER_PLAYERS; ++_j) {
        g_rgPokerGames[gameId][PLAYERS][_j] = INVALID_PLAYER_ID;
        g_rgPokerGames[gameId][READY_TEXTDRAWS][_j] = Text: INVALID_TEXT_DRAW;
        g_rgPokerGames[gameId][PLAYER_STATUS_TEXTDRAWS][_j] = Text: INVALID_TEXT_DRAW;
        g_rgPokerGames[gameId][PLAYER_CHIPS_TEXTDRAWS][_j] = Text: INVALID_TEXT_DRAW;
        g_rgPokerGames[gameId][PLAYER_GAME_CARD_ONE_TEXTDRAW][_j] = Text: INVALID_TEXT_DRAW;
        g_rgPokerGames[gameId][PLAYER_GAME_CARD_TWO_TEXTDRAW][_j] = Text: INVALID_TEXT_DRAW;
        g_rgPokerGames[gameId][PLAYER_CHIPS][_j] = 0;
        g_rgPokerGames[gameId][PLAYER_STATUS][_j] = POKER_PLAYER_STATUS: EMPTY;
        g_rgPokerGames[gameId][PLAYER_CARD_ONE_VALUE][_j] = -1;
        g_rgPokerGames[gameId][PLAYER_CARD_TWO_VALUE][_j] = -1;
        g_rgPokerGames[gameId][PLAYER_POT_CONTRIBUTIONS][_j] = 0;
        Pkr_SetPlayerBetContribution(gameId, _j, 0);
    }

    for(new _i = 0; _i < MAX_TABLE_CARDS; ++_i)
    {
        g_rgPokerGames[gameId][TABLE_CARDS_TEXTDRAWS][_i] = Text: INVALID_TEXT_DRAW;
        g_rgPokerGames[gameId][TABLE_CARD_VALUES][_i] = -1;
    }
    return;
}

Pkr_GetUnassignedGame() {
    for(new i = 0; i < MAX_POKER_GAMES; ++i) {
        if(g_rgPokerGames[i][IS_ASSIGNED] == false) {
            return i;
        }
    }
    return -1;
}

Pkr_CreateGame(const Float: x, const Float: y, const Float: z) {
    new _gameId = Pkr_GetUnassignedGame();
    if(_gameId != -1) {
        Pkr_SetIsAssigned(_gameId, true);
        Pkr_SetPosition(_gameId, x, y, z);
        Pkr_CreateGameTextDraws(_gameId);
        Pkr_SetBlind(_gameId, POKER_DEFAULT_BLIND);
        return _gameId;
    }
    return -1;
}

Pkr_CreateGameByObjectId(const objectId, const businessId = -1) {
    new Float: x, Float: y, Float: z;
    if(GetDynamicObjectPos(objectId, x, y, z) == 0)
        return -1;
    new gameId = Pkr_CreateGame(x, y, z);
    Pkr_SetObjectId(gameId, objectId);
	if(businessId != -1)
		Pkr_SetBusiness(gameId, businessId);
    return gameId;
}

Pkr_DestroyGame(const gameId) {
	Pkr_ForeachPlayer(playerSlot) {
		Pkr_UnassignPlayerSlotFromGame(gameId, playerSlot);
	}
	Pkr_UnassignAllSpectators(gameId);
    Pkr_DestroyGameTextDraws(gameId);
    Pkr_InitialiseGame(gameId);
    return;
}

Pkr_GetGameByObjectId(const objectId) {
    if(objectId == INVALID_OBJECT_ID) {
        return -1;
    }

    Pkr_ForeachGame(gameId) {
        if(Pkr_GetObjectId(gameId) == objectId)
            return gameId;
    }

    return -1;
}
