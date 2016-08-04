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
