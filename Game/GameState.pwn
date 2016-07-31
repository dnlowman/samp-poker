#define Pkr_HasEveryoneFolded(%0) \
            Pkr_CountPlayerStatus(%0, POKER_PLAYER_STATUS: FOLDED)

#define Pkr_HasEveryoneChecked(%0) \
            Pkr_CountPlayerStatus(%0, POKER_PLAYER_STATUS: CHECKED)

stock Pkr_SetNextPlayerPlaying(const gameId)
{
    new _hasEveryoneFolded = Pkr_HasEveryoneFolded(gameId);
    new _playersOn = Pkr_GetAmountOfPlayersOnGame(gameId);

    if(_hasEveryoneFolded == _playersOn - 1)
    {
        new _winner = Pkr_GetFirstPlayerWithoutStatus(gameId, FOLDED);

        if(_winner != -1)
        {
            new _message[128];
            format(_message, sizeof(_message), "{CC6600}%s {FF9900}wins the pot due to everyone folding.", Pkr_GetClientName(g_rgPokerGames[gameId][PLAYERS][_winner]), Pkr_FormatNumber(Pkr_GetPotAmount(gameId)));
            Pkr_SendGameMessage(gameId, COLOR_ORANGE, _message);

            Pkr_SetPlayerChips(gameId, _winner, Pkr_GetPotAmount(gameId) + Pkr_GetPlayerChips(gameId, _winner));
            Pkr_SetPotAmount(gameId, 0);
        }

        Pkr_SetGameToLobby(gameId);
        return;
    }

    new _hasEveryoneChecked = Pkr_HasEveryoneChecked(gameId);
    new _foldedPlayersCount = Pkr_CountPlayerStatus(gameId, POKER_PLAYER_STATUS: FOLDED);

    if(_hasEveryoneChecked == _playersOn - _foldedPlayersCount)
    {
        Pkr_DealNextRound(gameId);
        return;
    }

    if(Pkr_HasEveryonePlayed(gameId) == true)
    {
        Pkr_DealNextRound(gameId);
        return;
    }

    new _nextPlayer = Pkr_FindNextPlayer(gameId, Pkr_GetCurrentPlayerPosition(gameId));
    Pkr_SetPlayerPlaying(gameId, _nextPlayer);
    return;
}

stock Pkr_SetPlayerPlaying(const gameId, const playerSlot)
{
    Pkr_SetCurrentPlayerPosition(gameId, playerSlot);

    if(Pkr_GetCurrentBet(gameId) > 0)
        Pkr_SetMenuItemOneStateRaise(gameId);

    if(Pkr_GetCurrentBet(gameId) > Pkr_GetPlayerBet(gameId, playerSlot))
        Pkr_SetMenuItemTwoStateCall(gameId);
    else
        Pkr_SetMenuItemTwoStateCheck(gameId);

    Pkr_SetPlayerStatusPlaying(gameId, playerSlot);
    return;
}

stock Pkr_StartGame(const gameId)
{
    for(new _j, _playerId = INVALID_PLAYER_ID; _j < MAX_POKER_PLAYERS; ++_j)
    {
        _playerId = Pkr_GetPlayerId(gameId, _j);
        if(_playerId == INVALID_PLAYER_ID)
            continue;

        Pkr_HidePlayerReadyTextDraw(_playerId, gameId);
        Pkr_ClearPlayerCards(gameId, _j);
        Pkr_DealPlayerCard(gameId, _j);
        Pkr_DealPlayerCard(gameId, _j);
        Pkr_SetPlayerStatusWaiting(gameId, _j);
    }

    new _dealer = PkrSys_GetNextDealer(gameId);
    if(_dealer != -1)
    {
        Pkr_SetDealerPosition(gameId, _dealer);
        Pkr_SetPlayerStatusDealer(gameId, _dealer);
    }

    PkrSys_AssignBlinds(gameId);
    Pkr_StartBettingRound(gameId);
    Pkr_SetGameStatus(gameId, INITIAL_BETTING);

    return;
}

stock Pkr_StartBettingRound(const gameId)
{
    new _startingPlayer = Pkr_FindNextPlayer(gameId, Pkr_GetBigBlindPosition(gameId));
    Pkr_SetPlayerPlaying(gameId, _startingPlayer);

    return;
}

stock Pkr_DealNextRound(const gameId)
{
    switch(Pkr_GetGameStatus(gameId))
    {
        case (POKER_GAME_STATUS: INITIAL_BETTING):
            Pkr_DealFlop(gameId);

        case (POKER_GAME_STATUS: FLOP):
            Pkr_DealTurn(gameId);

        case (POKER_GAME_STATUS: TURN):
            Pkr_DealRiver(gameId);

        case (POKER_GAME_STATUS: RIVER):
            Pkr_Evaluate(gameId);
    }

    Pkr_SetCurrentBet(gameId, 0);
    Pkr_SetCurrentBetAggregate(gameId, 0);
    Pkr_SetAllPlayerBet(gameId, 0);

    new _dealerPosition = Pkr_GetDealerPosition(gameId);
    Pkr_SetAllPlayersStatus(gameId, POKER_PLAYER_STATUS: WAITING);
    Pkr_SetPlayerStatusDealer(gameId, _dealerPosition);
    new _nextPlayer = Pkr_FindNextPlayer(gameId, _dealerPosition);
    Pkr_SetPlayerPlaying(gameId, _nextPlayer);
    return;
}

stock Pkr_DealFlop(const gameId)
{
    Pkr_SetGameStatus(gameId, POKER_GAME_STATUS: FLOP);
    Pkr_DealTableCard(gameId);
    Pkr_DealTableCard(gameId);
    Pkr_DealTableCard(gameId);

    return;
}

stock Pkr_DealTurn(const gameId)
{
    Pkr_SetGameStatus(gameId, POKER_GAME_STATUS: TURN);
    Pkr_DealTableCard(gameId);

    return;
}

stock Pkr_DealRiver(const gameId)
{
    Pkr_SetGameStatus(gameId, POKER_GAME_STATUS: RIVER);
    Pkr_DealTableCard(gameId);

    return;
}

stock Pkr_Evaluate(const gameId)
{
    Pkr_SetGameStatus(gameId, POKER_GAME_STATUS: EVALUATION);

    new _sz[128];
    new _winners[MAX_POKER_PLAYERS] = {INVALID_PLAYER_ID, ...};
    new _value = Pkr_FindWinner(gameId, _winners);
    new _wincount;
    for(new i; i < MAX_POKER_PLAYERS; ++i)
        if(_winners[i] != INVALID_PLAYER_ID)
            ++_wincount;

    if(_wincount > 1)
    {
        for(new i; i < _wincount; ++i)
        {
            Pkr_SetPlayerChips(gameId, _winners[i], Pkr_GetPlayerChips(gameId, _winners[i]) + g_rgPokerGames[gameId][PLAYER_POT_CONTRIBUTIONS][_winners[i]]);
            Pkr_SubFromPot(gameId, Pkr_GetPlayerPotContribution(gameId, _winners[i]));
            format(_sz, sizeof(_sz), "%s %s", _sz, Pkr_GetClientName(g_rgPokerGames[gameId][PLAYERS][_winners[i]]));
        }

        if(Pkr_GetPotAmount(gameId) > 0)
        {
            new _split = Pkr_GetPotAmount(gameId); // TODO: Why the fuck am I checking if this is odd?

            if((Pkr_IsOdd(_split) && !Pkr_IsOdd(_wincount)) || (!Pkr_IsOdd(_split) && Pkr_IsOdd(_wincount)))
                Pkr_SubFromPot(gameId, 1);

            _split /= _wincount;

            for(new _i = 0; _i < _wincount; ++_i)
                Pkr_SetPlayerChips(gameId, _winners[_i], Pkr_GetPlayerChips(gameId, _winners[_i]) + _split);
        }
        format(_sz, sizeof(_sz), "The pot has been split between {CC6600}%s {FF9900}due to players having a %s with a value of %i.", _sz, Pkr_ReturnHandName(Pkr_HandRank(_value)), _value);
        Pkr_SendGameMessage(gameId, COLOR_ORANGE, _sz);
        Pkr_SetPotAmount(gameId, 0);
    }
    else // One winner
    {
        format(_sz, sizeof(_sz), "{CC6600}%s {FF9900}wins the pot ($%s) with a %s and a value of %i.", Pkr_GetClientName(g_rgPokerGames[gameId][PLAYERS][_winners[0]]), Pkr_FormatNumber(Pkr_GetPotAmount(gameId)), Pkr_ReturnHandName(Pkr_HandRank(_value)), _value);
        Pkr_SendGameMessage(gameId, COLOR_ORANGE, _sz);
        Pkr_SetPlayerChips(gameId, _winners[0], Pkr_GetPlayerChips(gameId, _winners[0]) + Pkr_GetPotAmount(gameId));
        Pkr_SetPotAmount(gameId, 0);
    }

    return;
}

stock Pkr_SetGameToLobby(const gameId)
{
    PkrClearTableCards(gameId);
    Pkr_ClearAllPlayerCards(gameId);
    Pkr_SetAllPlayersStatus(gameId, POKER_PLAYER_STATUS: LOBBY);
    Pkr_SetAllPlayersNotReady(gameId);
    Pkr_ShowAllPlayersReadyTextDraw(gameId);
    Pkr_SetSmallBlindPosition(gameId, -1);
    Pkr_SetBigBlindPosition(gameId, -1);
    Pkr_SetGameStatus(gameId, POKER_GAME_STATUS: LOBBY);
    Pkr_SetAllPlayerBet(gameId, 0);
    Pkr_SetAllPlayerPotContribution(gameId, 0);
    return;
}

static stock Pkr_FindNextPlayer(const gameId, const currentPlayer)
{
    new _nextPlayer = currentPlayer + 1;
    new bool: _found = false;

    do
    {
        if(_nextPlayer == MAX_POKER_PLAYERS)
            _nextPlayer = 0;

        if(Pkr_GetPlayerId(gameId, _nextPlayer) != INVALID_PLAYER_ID && Pkr_GetPlayerStatus(gameId, _nextPlayer) != POKER_PLAYER_STATUS: FOLDED)
        {
            _found = true;
            break;
        }

        _nextPlayer++;
    }
    while(_found == false);

    return _nextPlayer;
}

static stock PkrSys_GetNextDealer(const gameId)
{
	new
		_found,
		_count,
		_current = (g_rgPokerGames[gameId][DEALER] != INVALID_PLAYER_ID) ? g_rgPokerGames[gameId][DEALER] + 1 : 0;
	do
	{
		if(_count > MAX_POKER_PLAYERS) return -1;
		if(_current >= MAX_POKER_PLAYERS) _current = 0;
		if(g_rgPokerGames[gameId][PLAYERS][_current] != INVALID_PLAYER_ID)
		{
			if(_current != g_rgPokerGames[gameId][DEALER])
			{
				_found = 1;
				g_rgPokerGames[gameId][DEALER] = _current;
			}
			else
			{
				_count++;
				_current++;
			}
		}
		else
		{
			_count++;
			_current++;
		}
	}
	while(!_found);

	return _current;
}

static stock PkrSys_AssignBlinds(const gameId)
{
    new _smallBlindPosition = PkrSys_FindNextPlayerForBlind(gameId);
    Pkr_SetSmallBlindPosition(gameId, _smallBlindPosition);
    new _bigBlindPosition = PkrSys_FindNextPlayerForBlind(gameId);
    Pkr_SetBigBlindPosition(gameId, _bigBlindPosition);

    Pkr_SetPlayerStatusSmallBlind(gameId, _smallBlindPosition);
    Pkr_AddToPlayerPotContribution(gameId, _smallBlindPosition, Pkr_GetSmallBlind(gameId));
    Pkr_AddToPlayerBet(gameId, _smallBlindPosition, Pkr_GetSmallBlind(gameId));
    Pkr_SetPlayerChips(gameId, _smallBlindPosition, Pkr_GetPlayerChips(gameId, _smallBlindPosition) - Pkr_GetSmallBlind(gameId));
    Pkr_AddToPot(gameId, Pkr_GetSmallBlind(gameId));

    Pkr_SendFormattedGameMessage(gameId, COLOR_RED, "%s is the small blind $%d.", Pkr_GetClientName(Pkr_GetPlayerId(gameId, _smallBlindPosition)), Pkr_GetSmallBlind(gameId));

    Pkr_SetPlayerStatusBigBlind(gameId, _bigBlindPosition);
    Pkr_AddToPlayerPotContribution(gameId, _bigBlindPosition, Pkr_GetBigBlind(gameId));
    Pkr_AddToPlayerBet(gameId, _bigBlindPosition, Pkr_GetBigBlind(gameId));
    Pkr_SetPlayerChips(gameId, _bigBlindPosition, Pkr_GetPlayerChips(gameId, _bigBlindPosition) - Pkr_GetBigBlind(gameId));
    Pkr_SetCurrentBet(gameId, Pkr_GetBigBlind(gameId));
    Pkr_AddToPot(gameId, Pkr_GetBigBlind(gameId));

    Pkr_SendFormattedGameMessage(gameId, COLOR_RED, "%s is the big blind $%d.", Pkr_GetClientName(Pkr_GetPlayerId(gameId, _bigBlindPosition)), Pkr_GetBigBlind(gameId));
    Pkr_SendFormattedGameMessage(gameId, COLOR_RED, "The pot is now at: $%d.", Pkr_GetPotAmount(gameId));
    return;
}

static stock PkrSys_FindNextPlayerForBlind(const gameId)
{
    new _playerSlot = -1;
    new _currentSlot;
    new _playerCount = Pkr_GetAmountOfPlayersOnGame(gameId);

    if(_playerCount == 2 && Pkr_GetSmallBlindPosition(gameId) == -1)
        return Pkr_GetDealerPosition(gameId);

    if(Pkr_GetSmallBlindPosition(gameId) == -1)
    {
        _currentSlot = Pkr_GetDealerPosition(gameId) + 1;
    }
    else if(Pkr_GetBigBlindPosition(gameId) == -1)
    {
        _currentSlot = Pkr_GetSmallBlindPosition(gameId) + 1;
    }
    else
        return -1;

    while(_playerSlot == -1)
    {
        if(_currentSlot == MAX_POKER_PLAYERS)
            _currentSlot = 0;

        if(Pkr_GetPlayerId(gameId, _currentSlot) != INVALID_PLAYER_ID)
        {
            _playerSlot = _currentSlot;
            break;
        }

        _currentSlot++;
    }

    return _currentSlot;
}

stock Pkr_FindWinner(const gameId, winners[MAX_POKER_PLAYERS])
{
	new _value = -1;
	for(new _i = 0; _i < MAX_POKER_PLAYERS; ++_i) winners[_i] = INVALID_PLAYER_ID;
	for(new _i, _b = 0, _newValue, _oldValue = 999999, _handArray[7]; _i < MAX_POKER_PLAYERS; ++_i)
	{
		if(g_rgPokerGames[gameId][PLAYERS][_i] != INVALID_PLAYER_ID)
		{
			if(Pkr_GetPlayerStatus(gameId, _i) != POKER_PLAYER_STATUS: FOLDED && Pkr_GetPlayerStatus(gameId, _i) != POKER_PLAYER_STATUS: EVALUATED)
			{
				_handArray[0] = g_rgPokerGames[gameId][PLAYER_CARD_ONE_VALUE][_i];
				_handArray[1] = g_rgPokerGames[gameId][PLAYER_CARD_TWO_VALUE][_i];
				_handArray[2] = g_rgPokerGames[gameId][TABLE_CARD_VALUES][0];
				_handArray[3] = g_rgPokerGames[gameId][TABLE_CARD_VALUES][1];
				_handArray[4] = g_rgPokerGames[gameId][TABLE_CARD_VALUES][2];
				_handArray[5] = g_rgPokerGames[gameId][TABLE_CARD_VALUES][3];
				_handArray[6] = g_rgPokerGames[gameId][TABLE_CARD_VALUES][4];
				_newValue = Eval7(_handArray);
				if(_newValue < _oldValue)
				{
					_oldValue = _newValue;
					_value = _newValue;
					winners[0] = _i;
					for(_b = 1; _b < MAX_POKER_PLAYERS; ++_b) winners[_b] = INVALID_PLAYER_ID;
				}
				else if(_newValue == _oldValue)
				{
					for(new _c = 0; _c < MAX_POKER_PLAYERS; ++_c)
					{
						if(winners[_c] == INVALID_PLAYER_ID)
						{
							winners[_c] = _i;
							break;
						}
					}
				}
			}
		}
	}

	return _value;
}
