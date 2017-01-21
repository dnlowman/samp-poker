Pkr_PlayerMenuTextDrawClick(const playerid, const Text: clickedid)
{
    new _gameId = Pkr_GetPlayerGame(playerid);

    if(_gameId == -1)
        return;

    /*#if defined POKER_DEBUG
        new _playerSlot = Pkr_GetCurrentPlayerPosition(_gameId);
    #else
        new _playerSlot = Pkr_GetPlayerSlot(playerid, _gameId);
    #endif*/

	new _currentPlayer = Pkr_GetCurrentPlayerPosition(_gameId);
	new _playerSlot = Pkr_GetPlayerSlot(playerid, _gameId);

	#if defined POKER_DEBUG
		new currentPlayersId = Pkr_GetPlayerId(_gameId, _currentPlayer);
		if(_currentPlayer != _playerSlot && !IsPlayerNPC(currentPlayersId)) {
			SendClientMessage(playerid, COLOR_RED, "You can only control the actions of NPC's.");
	        return;
		}
	#elseif !defined POKER_DEBUG
		if(_currentPlayer != _playerSlot) {
			SendClientMessage(playerid, COLOR_RED, "You are not the current player.");
	        return;
		}
	#endif

    if(_playerSlot == -1)
        return;

    if(Pkr_GetGameStatus(_gameId) == POKER_GAME_STATUS: LOBBY || Pkr_GetGameStatus(_gameId) == POKER_GAME_STATUS: EVALUATION)
    {
        SendClientMessage(playerid, COLOR_RED, "The menu cannot be used in the lobby or evaluation phase.");
        return;
    }

    if(clickedid == g_rgPokerGames[_gameId][MENU_TEXTDRAWS][0]) // ALL IN
    {
        PlayerPlaySound(playerid, 1054, 0.0, 0.0, 0.0);
        Pkr_SetPlayerStatusAllIn(_gameId, _currentPlayer);

        new _playerChips = Pkr_GetPlayerChips(_gameId, _currentPlayer);

        if(Pkr_GetCurrentBet(_gameId) < _playerChips - Pkr_GetPlayerBetContribution(_gameId, _currentPlayer))
        {
            Pkr_SetLastAggressivePlayer(_gameId, _currentPlayer);
            Pkr_SetAmountOfPlays(_gameId, 0);
            Pkr_AddToCurrentBet(_gameId, _playerChips);

            for(new i = 0; i < MAX_POKER_PLAYERS; ++i)
                Pkr_ResetPlayerClosedLastPlay(_gameId, i);
        }

        Pkr_AddToPot(_gameId, _playerChips);
        Pkr_AddToPlayerBetContribution(_gameId, _currentPlayer, _playerChips);
        Pkr_AddToPlayerPotContribution(_gameId, _currentPlayer, _playerChips);
        Pkr_MinusPlayerChips(_gameId, _currentPlayer, _playerChips);

        Pkr_SetNextPlayerPlaying(_gameId);
        return;
    }

    if(clickedid == g_rgPokerGames[_gameId][MENU_TEXTDRAWS][1]) // BET OR RAISE
    {
        new _foldedPlayersCount = Pkr_CountPlayerStatus(_gameId, POKER_PLAYER_STATUS: FOLDED);
        new _allInPlayersCount = Pkr_CountPlayerStatus(_gameId, POKER_PLAYER_STATUS: ALL_IN);
        new _playersOn = Pkr_GetAmountOfPlayersOnGame(_gameId);

        if(_allInPlayersCount == _playersOn - _foldedPlayersCount - 1)
        {
            SendClientMessage(playerid, COLOR_RED, "You have to go all in.");
            return;
        }

        if(Pkr_GetCurrentBet(_gameId) >= Pkr_GetPlayerChips(_gameId, _currentPlayer))
        {
            SendClientMessage(playerid, COLOR_RED, "You cannot afford to raise, you have to go all in or fold.");
            return;
        }

        if(Pkr_GetMenuItemOneState(_gameId) == POKER_MENU_STATES: BET)
        {
            Pkr_GameShowBetDialog(playerid);
        }
        else
        {
            Pkr_GameShowRaiseDialog(playerid, _gameId);
        }

        PlayerPlaySound(playerid, 1054, 0.0, 0.0, 0.0);
        return;
    }

    if(clickedid == g_rgPokerGames[_gameId][MENU_TEXTDRAWS][2]) // CHECK OR CALL
    {
        if(Pkr_GetCurrentBet(_gameId) >= Pkr_GetPlayerChips(_gameId, _currentPlayer))
        {
            SendClientMessage(playerid, COLOR_RED, "You cannot afford to call, you have to go all in or fold.");
            return;
        }

        if(Pkr_GetMenuItemTwoState(_gameId) == POKER_MENU_STATES: CHECK)
        {
            Pkr_GameShowCheckConfirmDialog(playerid);
        }
        else
        {
            Pkr_GameShowCallConfirmDialog(playerid, _gameId);
        }

        PlayerPlaySound(playerid, 1054, 0.0, 0.0, 0.0);
        return;
    }

    if(clickedid == g_rgPokerGames[_gameId][MENU_TEXTDRAWS][3])
    {
        Pkr_SetPlayerStatusFolded(_gameId, _currentPlayer);
        Pkr_SetNextPlayerPlaying(_gameId);
        PlayerPlaySound(playerid, 1054, 0.0, 0.0, 0.0);
        return;
    }

    return;
}
