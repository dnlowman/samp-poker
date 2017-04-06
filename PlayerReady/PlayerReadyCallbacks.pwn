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

bool: Pkr_PlayerReadyTextDrawClick(const playerid, const Text: clickedid)
{
    new _game = Pkr_GetPlayerGame(playerid);

    if(_game == -1)
        return false;

    new _slot = -1;

    #if defined POKER_DEBUG
        for(new _i = 0; _i < MAX_POKER_PLAYERS; ++_i)
        {
            if(g_rgPokerGames[_game][READY_TEXTDRAWS][_i] == clickedid)
            {
                _slot = _i;
                break;
            }
        }

        if(_slot == -1)
            return false;

        if(Pkr_GetPlayerId(_game, _slot) == INVALID_PLAYER_ID)
            return true;
    #else
        _slot = Pkr_GetPlayerSlot(playerid, _game);
    #endif

    if(_slot == -1)
        return false;

    if(clickedid != g_rgPokerGames[_game][READY_TEXTDRAWS][_slot])
        return false;

    if(Pkr_GetPlayerReady(g_rgPokerGames[_game][PLAYERS][_slot]))
        Pkr_SetPlayerNotReady(_game, _slot);
    else
        Pkr_SetPlayerReady(_game, _slot);
    PlayerPlaySound(playerid, 1054, 0.0, 0.0, 0.0);

    return true;
}
