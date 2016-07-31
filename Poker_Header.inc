enum
{
	STRAIGHT_FLUSH,
	FOUR_OF_A_KIND,
	FULL_HOUSE,
	FLUSH,
	STRAIGHT,
	THREE_OF_A_KIND,
	TWO_PAIR,
	ONE_PAIR,
	HIGH_CARD
};

enum POKER_GAME_POSITION {
    Float: PokerX,
    Float: PokerY,
    Float: PokerZ
};

enum POKER_PLAYER_STATUS {
    EMPTY,
    LOBBY,
    PLAYING, // ACTIVE
    WAITING, // ACTIVE
    CHECKED, // NON-AGGRESSIVE
    RAISED, // AGGRESSIVE
    CALLED, // NON-AGGRESSIVE
    ALL_IN, // IN-ACTIVE
    FOLDED, // IN-ACTIVE
    SMALL_BLIND, // ACTIVE
    BIG_BLIND, // ACTIVE & AGGRESSIVE
    DEALER, // ACTIVE
    EVALUATED,
    BET
};

enum POKER_MENU_STATES
{
    BET,
    RAISE,
    CHECK,
    CALL
};

enum POKER_DIALOGS
{
    SIT,
    SIT_CONFIRM,
    RAISE,
    RAISE_CONFIRM,
    CALL_CONFIRM,
    CHECK_CONFIRM,
    BET,
    BET_CONFIRM
};

enum POKER_GAME_STATUS
{
    LOBBY,
    INITIAL_BETTING,
    FLOP,
    TURN,
    RIVER,
    EVALUATION
};

enum POKER_GAME {
    bool: IS_ASSIGNED,
    PLAYERS[MAX_POKER_PLAYERS],
    POSITION[POKER_GAME_POSITION],
    Text3D: TEXT_LABEL,
    Text: READY_TEXTDRAWS[MAX_POKER_PLAYERS],
    Text: MENU_TEXTDRAWS[MAX_POKER_MENU_ITEMS],
    Text: PLAYER_STATUS_TEXTDRAWS[MAX_POKER_PLAYERS],
    Text: PLAYER_CHIPS_TEXTDRAWS[MAX_POKER_PLAYERS],
    Text: POT_TEXTDRAW,
    Text: PLAYER_GAME_CARD_ONE_TEXTDRAW[MAX_POKER_PLAYERS],
    Text: PLAYER_GAME_CARD_TWO_TEXTDRAW[MAX_POKER_PLAYERS],
    Text: POKER_BLINDS_TEXTDRAW,
    Text: TABLE_CARDS_TEXTDRAWS[MAX_TABLE_CARDS],
    PlayerText: PLAYER_PRIV_CARD_ONE_TEXTDRAW[MAX_POKER_PLAYERS],
    PlayerText: PLAYER_PRIV_CARD_TWO_TEXTDRAW[MAX_POKER_PLAYERS],
    POKER_MENU_STATES: MENU_ITEM_ONE_STATE,
    POKER_MENU_STATES: MENU_ITEM_TWO_STATE,
    TABLE_CARD_VALUES[MAX_TABLE_CARDS],
    PLAYER_CARD_ONE_VALUE[MAX_POKER_PLAYERS],
    PLAYER_CARD_TWO_VALUE[MAX_POKER_PLAYERS],
    POT,
    PLAYER_CHIPS[MAX_POKER_PLAYERS],
    POKER_PLAYER_STATUS: PLAYER_STATUS[MAX_POKER_PLAYERS],
    BLIND,
    DEALER,
    SMALL_BLIND_POSITION,
    BIG_BLIND_POSITION,
    CURRENT_PLAYER_POSITION,
    POKER_GAME_STATUS: GAME_STATUS,
    CURRENT_BET,
    PLAYER_POT_CONTRIBUTIONS[MAX_POKER_PLAYERS],
    PLAYER_BET_CONTRIBUTIONS[MAX_POKER_PLAYERS],
    LAST_AGGRESSIVE_PLAYER
};
new g_rgPokerGames[MAX_POKER_GAMES][POKER_GAME];

#define Pkr_GetLastAggressivePlayer(%0) \
            g_rgPokerGames[%0][LAST_AGGRESSIVE_PLAYER]

#define Pkr_SetLastAggressivePlayer(%0,%1) \
            g_rgPokerGames[%0][LAST_AGGRESSIVE_PLAYER] = %1

#define Pkr_SetPlayerBetContribution(%0,%1,%2) \
            g_rgPokerGames[%0][PLAYER_BET_CONTRIBUTIONS][%1] = %2

#define Pkr_GetPlayerBetContribution(%0,%1) \
            g_rgPokerGames[%0][PLAYER_BET_CONTRIBUTIONS][%1]

#define Pkr_ResetPlayerBetContributions(%0) \
    for(new _i = 0; _i < MAX_POKER_PLAYERS; ++_i) Pkr_SetPlayerBetContribution(%0, _i, 0)

#define Pkr_AddToPlayerBetContribution(%0,%1,%2) \
            Pkr_SetPlayerBetContribution(%0, %1, Pkr_GetPlayerBetContribution(%0, %1) + %2)

#define Pkr_GetPlayerPotContribution(%0,%1) \
            g_rgPokerGames[%0][PLAYER_POT_CONTRIBUTIONS][%1]

#define Pkr_SetPlayerPotContribution(%0,%1,%2) \
            g_rgPokerGames[%0][PLAYER_POT_CONTRIBUTIONS][%1] = %2

#define Pkr_AddToPlayerPotContribution(%0,%1,%2) \
            Pkr_SetPlayerPotContribution(%0, %1, Pkr_GetPlayerPotContribution(%0, %1) + %2)

#define Pkr_SetAllPlayerPotContribution(%0,%1) \
            for(new _j = 0; _j < MAX_POKER_PLAYERS; ++_j) if(Pkr_GetPlayerId(%0, _j) != INVALID_PLAYER_ID) Pkr_SetPlayerPotContribution(%0, _j, %1)

#define Pkr_GetCurrentBet(%0) \
            g_rgPokerGames[%0][CURRENT_BET]

#define Pkr_SetCurrentBet(%0,%1)  \
            g_rgPokerGames[%0][CURRENT_BET] = %1

#define Pkr_AddToCurrentBet(%0,%1)  \
            g_rgPokerGames[%0][CURRENT_BET] = Pkr_GetCurrentBet(%0) + %1

#define Pkr_GetGameStatus(%0) \
            g_rgPokerGames[%0][GAME_STATUS]

#define Pkr_SetGameStatus(%0,%1) \
            g_rgPokerGames[%0][GAME_STATUS] = %1

#define Pkr_GetPlayerStatus(%0,%1) \
            g_rgPokerGames[%0][PLAYER_STATUS][%1]

#define Pkr_GetPlayerId(%0,%1) \
            g_rgPokerGames[%0][PLAYERS][%1]

#define Pkr_GetSmallBlindPosition(%0) \
            g_rgPokerGames[%0][SMALL_BLIND_POSITION]

#define Pkr_GetBigBlindPosition(%0) \
            g_rgPokerGames[%0][BIG_BLIND_POSITION]

#define Pkr_SetSmallBlindPosition(%0,%1) \
            g_rgPokerGames[%0][SMALL_BLIND_POSITION] = %1

#define Pkr_SetBigBlindPosition(%0,%1) \
            g_rgPokerGames[%0][BIG_BLIND_POSITION] = %1

#define Pkr_GetDealerPosition(%0) \
            g_rgPokerGames[%0][DEALER]

#define Pkr_SetDealerPosition(%0,%1) \
            g_rgPokerGames[%0][DEALER] = %1

#define Pkr_GetCurrentPlayerPosition(%0) \
            g_rgPokerGames[%0][CURRENT_PLAYER_POSITION]

#define Pkr_SetCurrentPlayerPosition(%0,%1) \
            g_rgPokerGames[%0][CURRENT_PLAYER_POSITION] = %1

#define Pkr_GetPlayerChips(%0,%1) \
            g_rgPokerGames[%0][PLAYER_CHIPS][%1]

#define Pkr_GetPotAmount(%0) \
            g_rgPokerGames[%0][POT]

#define Pkr_AddToPot(%0,%1) \
            Pkr_SetPotAmount(%0, Pkr_GetPotAmount(%0) + %1)

#define Pkr_SubFromPot(%0,%1) \
            Pkr_SetPotAmount(%0, Pkr_GetPotAmount(%0) - %1)

#define Pkr_SetPokerDialog(%0,%1) \
            SetPVarInt(%0, "PokerDialog", _:%1)

#define Pkr_GetPokerDialog(%0) \
            GetPVarInt(%0, "PokerDialog")

#define Pkr_IsOdd(%0) \
            (%0 % 2)
