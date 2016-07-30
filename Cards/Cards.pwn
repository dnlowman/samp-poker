new g_rgCardDeck[MAX_POKER_DECK_CARDS];
new g_rgPrimeNumbers[] = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41};

#define Pkr_InitDeck() \
            for(new a, b, c, suit = 0x8000; a < 4; a++, suit >>= 1) for(b = 0; b < 13; b++, c++) g_rgCardDeck[c] = g_rgPrimeNumbers[b] | (b << 8) | suit | (1 << (16 + b))
