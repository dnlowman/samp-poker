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

Pkr_ShowPlayerTextDraws(const playerId, const gameId)
{
    Pkr_ShowPlayerBackgroundTextDraws(playerId);
    Pkr_ShowPlayerReadyTextDraw(playerId, gameId);
    Pkr_ShowPlayerMenuTextDraws(playerId, gameId);
    Pkr_ShowPlayerStatusTextDraw(playerId, gameId);
    Pkr_ShowPlayerChipsTextDraw(playerId, gameId);
    Pkr_ShowPlayerPotTextDraw(playerId, gameId);
    Pkr_ShowPlayerBlindTextDraw(playerId, gameId);
    Pkr_ShowPlayerCardTextDraws(playerId, gameId);
    Pkr_ShowTableCardTextDraws(playerId, gameId);
	Pkr_ShowTimerTextDraw(playerId, gameId);
    return;
}

Pkr_HidePlayerTextDraws(const playerId, const gameId)
{
    Pkr_HidePlayerBackgroundTextDraws(playerId);
    Pkr_HidePlayerReadyTextDraw(playerId, gameId);
    Pkr_HidePlayerMenuTextDraws(playerId, gameId);
    Pkr_HidePlayerStatusTextDraw(playerId, gameId);
    Pkr_HidePlayerChipsTextDraw(playerId, gameId);
    Pkr_HidePlayerPotTextDraw(playerId, gameId);
    Pkr_HidePlayerBlindTextDraw(playerId, gameId);
    Pkr_HidePlayerCardTextDraws(playerId, gameId);
    Pkr_HideTableCardTextDraws(playerId, gameId);
	Pkr_HideTimerTextDraw(playerId, gameId);
    return;
}

Pkr_CreateGameTextDraws(const gameId)
{
    if(g_rgPokerBackground[0] == Text: INVALID_TEXT_DRAW)
        Pkr_CreateBackgroundTextDraws();

    Pkr_CreateMenuTextDraws(gameId);
    Pkr_CreateReadyTextDraws(gameId);
    Pkr_CreatePlayerStatusTDs(gameId);
    Pkr_CreatePlayerChipsTDs(gameId);
    Pkr_CreatePotTextDraw(gameId);
    Pkr_CreateBlindTextDraw(gameId);
    Pkr_CreatePlayerCardTDs(gameId);
    Pkr_CreateTableCardTextDraws(gameId);
	Pkr_CreateTimerTextDraw(gameId);
    return;
}

Pkr_DestroyGameTextDraws(const gameId)
{
    if(Pkr_GetGameCount() == 0)
        Pkr_DestroyBackgroundTextDraws();

    Pkr_DestroyReadyTextDraws(gameId);
    Pkr_DestroyPotTextDraw(gameId);
    Pkr_DestroyPlayerStatusTDs(gameId);
    Pkr_DestroyPlayerChipsTDs(gameId);
    Pkr_DestroyMenuTextDraws(gameId);
    Pkr_DestroyBlindTextDraw(gameId);
    Pkr_DestroyPlayerCardTDs(gameId);
    Pkr_DestroyTableCardTextDraws(gameId);
	Pkr_DestroyTimerTextDraw(gameId);
    return;
}
