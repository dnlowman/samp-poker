#define Pkr_GetSmallBlind(%0) \
            g_rgPokerGames[%0][BLIND]

#define Pkr_GetBigBlind(%0) \
            (g_rgPokerGames[%0][BLIND] << 1)

#define Pkr_SetBlind(%0,%1) \
            g_rgPokerGames[%0][BLIND] = %1
