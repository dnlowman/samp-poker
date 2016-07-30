#include "PotTextDraws.pwn"

stock Pkr_SetPotAmount(const gameId, const amount)
{
    g_rgPokerGames[gameId][POT] = amount;
    Pkr_SetPotTextDraw(gameId, g_rgPokerGames[gameId][POT]);
    return;
}
