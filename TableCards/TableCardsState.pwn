#define Pkr_SetTableCardValue(%0,%1,%2) \
            g_rgPokerGames[%0][TABLE_CARD_VALUES][%1] = %2

stock Pkr_DealTableCard(const gameId)
{
    new _card = PkrSys_ReturnRandomUnusedCard(gameId);
    new _cardValue = g_rgCardDeck[_card];
    new _tableCardIndex = Pkr_GetNextTableCardIndex(gameId);

    if(_tableCardIndex == -1)
        return;

    Pkr_SetTableCardValue(gameId, _tableCardIndex, _cardValue);
    Pkr_SetTableCardTextDraw(gameId, _tableCardIndex, Pkr_ReturnCardSpriteName(_cardValue));

    return;
}

stock PkrClearTableCards(const gameId)
{
    for(new _i = 0; _i < MAX_TABLE_CARDS; ++_i)
    {
        Pkr_SetTableCardValue(gameId, _i, -1);
        Pkr_SetTableCardTextDraw(gameId, _i, "_");
    }
}

static stock Pkr_GetNextTableCardIndex(const gameId)
{
    new _index = -1;
    for(new _i = 0; _i < MAX_TABLE_CARDS; ++_i)
    {
        if(g_rgPokerGames[gameId][TABLE_CARD_VALUES][_i] == -1)
        {
            _index = _i;
            break;
        }
    }

    return _index;
}
