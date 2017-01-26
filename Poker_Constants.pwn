native Eval5(hand[5]);
native Eval7(hand[7]);

#define POKER_DEBUG

const MAX_POKER_GAMES = 20;
const MAX_POKER_PLAYERS = 6;
const MAX_POKER_BACKGROUND_TEXTDRAWS = 7;
const MAX_POKER_MENU_ITEMS = 4;
const POKER_DIALOG_ID = 9997;
const MAX_POKER_DECK_CARDS = 52;
const POKER_OBJECT_MODEL = 19474;
const MAX_TABLE_CARDS = 5;
const POKER_DEFAULT_BLIND = 100;
const INVALID_POKER_GAME_ID = MAX_POKER_GAMES + 1;
const MAX_POKER_TIMER = 10; // TODO: This can later be configurable...

/* PVar Names */
#define POKER_PLAYER_GAME_VAR "PlayerPokerGame"
#define POKER_PLAYER_READY_VAR "PlayerPokerReady"
#define POKER_PLAYER_RAISE_AMOUNT_VAR "PlayerPokerRaiseAmount"
#define POKER_PLAYER_BET_AMOUNT_VAR "PlayerPokerBetAmount"
#define POKER_SPECTATE_VAR_NAME "POKER_SPECTATE_VAR_NAME"
