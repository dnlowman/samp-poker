#include "PrivateCard\PrivateCardTextDraws.pwn"
#include "PlayerCardTextDraws.pwn"

#define Pkr_SetPlayerCardOneValue(%0,%1,%2) \
            g_rgPokerGames[%0][PLAYER_CARD_ONE_VALUE][%1] = %2

#define Pkr_GetPlayerCardOneValue(%0,%1) \
            g_rgPokerGames[%0][PLAYER_CARD_ONE_VALUE][%1]

#define Pkr_SetPlayerCardTwoValue(%0,%1,%2) \
            g_rgPokerGames[%0][PLAYER_CARD_TWO_VALUE][%1] = %2

#define Pkr_GetPlayerCardTwoValue(%0,%1) \
            g_rgPokerGames[%0][PLAYER_CARD_TWO_VALUE][%1]

stock Pkr_DealPlayerCard(const gameId, const playerSlot)
{
    new _card = PkrSys_ReturnRandomUnusedCard(gameId);
    new _cardValue = g_rgCardDeck[_card];
    new _playerId = Pkr_GetPlayerId(gameId, playerSlot);
    #pragma unused _playerId

    if(Pkr_GetPlayerCardOneValue(gameId, playerSlot) == -1)
    {
        Pkr_SetPlayerCardOneValue(gameId, playerSlot, _cardValue);
        Pkr_SetPlayerCardOneTextDraw(gameId, playerSlot, "LD_CARD:cdback");
        Pkr_SetPrivateCardOneTextDraw(_playerId, gameId, playerSlot, Pkr_ReturnCardSpriteName(_cardValue));

        /*Pkr_SetPlayerCardOneTextDraw(gameId, playerSlot, Pkr_ReturnCardSpriteName(_cardValue));*/
    }
    else if(Pkr_GetPlayerCardTwoValue(gameId, playerSlot) == -1)
    {
        Pkr_SetPlayerCardTwoValue(gameId, playerSlot, _cardValue);
        Pkr_SetPlayerCardTwoTextDraw(gameId, playerSlot, "LD_CARD:cdback");
        Pkr_SetPrivateCardTwoTextDraw(_playerId, gameId, playerSlot, Pkr_ReturnCardSpriteName(_cardValue));

        /*Pkr_SetPlayerCardTwoTextDraw(gameId, playerSlot, Pkr_ReturnCardSpriteName(_cardValue));*/
    }

    return;
}

stock Pkr_ClearPlayerCards(const gameId, const playerSlot)
{
    new _playerId = Pkr_GetPlayerId(gameId, playerSlot);

    Pkr_SetPlayerCardOneValue(gameId, playerSlot, -1);
    Pkr_SetPlayerCardOneTextDraw(gameId, playerSlot, "_");
    Pkr_SetPrivateCardOneTextDraw(_playerId, gameId, playerSlot, "_");

    Pkr_SetPlayerCardTwoValue(gameId, playerSlot, -1);
    Pkr_SetPlayerCardTwoTextDraw(gameId, playerSlot, "_");
    Pkr_SetPrivateCardTwoTextDraw(_playerId, gameId, playerSlot, "_");

    return;
}

stock Pkr_ShowPlayerCards(const gameId, const playerSlot)
{
	new playerId = Pkr_GetPlayerId(gameId, playerSlot);
	new cardOne = Pkr_GetPlayerCardOneValue(gameId, playerSlot);
	new cardTwo = Pkr_GetPlayerCardTwoValue(gameId, playerSlot);


    Pkr_SetPlayerCardOneTextDraw(gameId, playerSlot, Pkr_ReturnCardSpriteName(cardOne));
    Pkr_SetPrivateCardOneTextDraw(playerId, gameId, playerSlot, "_");

    Pkr_SetPlayerCardTwoTextDraw(gameId, playerSlot, Pkr_ReturnCardSpriteName(cardTwo));
    Pkr_SetPrivateCardTwoTextDraw(playerId, gameId, playerSlot, "_");
    return;
}

stock Pkr_ShowAllPlayerCards(const gameId) {
	Pkr_ForeachPlayer(player) {
		if(Pkr_GetPlayerId(gameId, player) != INVALID_PLAYER_ID && Pkr_GetPlayerStatus(gameId, player) != POKER_PLAYER_STATUS: FOLDED)
			Pkr_ShowPlayerCards(gameId, player);
	}
	return;
}

stock Pkr_ClearAllPlayerCards(const gameId)
{
    for(new _i = 0; _i < MAX_POKER_PLAYERS; ++_i)
    {
        if(g_rgPokerGames[gameId][PLAYERS][_i] != INVALID_PLAYER_ID)
        {
            Pkr_ClearPlayerCards(gameId, _i);
        }
    }

    return;
}
