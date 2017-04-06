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
