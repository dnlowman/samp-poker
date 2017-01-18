bool: HaveAllPlayersFolded(const gameId)
{
    new amountOfPlayersOnGame = Pkr_GetAmountOfPlayersOnGame(gameId);
    new amountOfPlayerAllIn = Pkr_CountPlayerStatus(gameId, POKER_PLAYER_STATUS: ALL_IN);
    new amountOfFoldedPlayers = Pkr_CountPlayerStatus(gameId, POKER_PLAYER_STATUS: FOLDED);
    return (amountOfFoldedPlayers == amountOfPlayersOnGame - amountOfPlayerAllIn) || (amountOfFoldedPlayers == (amountOfPlayersOnGame - 1 - amountOfPlayerAllIn)) && amountOfFoldedPlayers > 0;
}

bool: HaveAllPlayersChecked(const gameId)
{
    new amountOfPlayersOnGame = Pkr_GetAmountOfPlayersOnGame(gameId);
    new amountOfPlayersFolded = Pkr_CountPlayerStatus(gameId, POKER_PLAYER_STATUS: FOLDED);
    new amountOfPlayersAllIn = Pkr_CountPlayerStatus(gameId, POKER_PLAYER_STATUS: ALL_IN);
    new amountOfCheckedPlayers = Pkr_CountPlayerStatus(gameId, POKER_PLAYER_STATUS: CHECKED);
    return amountOfCheckedPlayers == amountOfPlayersOnGame - amountOfPlayersFolded - amountOfPlayersAllIn && amountOfCheckedPlayers > 1;
}

stock Pkr_SetNextPlayerPlaying(const gameId)
{
    /*
        When the betting round has completed one full circle around the table,
        if no player has taken an aggressive action (that is, if no player has bet),
        then the betting round is over, and the poker hand continues according to the rules of the variant being played.

        If one or more players have taken an aggressive action, then the betting round continues clockwise
        around the table until the most recent aggressive action has been closed. This is achieved either by all
        ctive players other than the most recent aggressor folding, or by all active players other than the most
        recent aggressor calling the aggressor's bet or raise.
    */

    new activePlayer = Pkr_GetCurrentPlayerPosition(gameId);
    new haveAllPlayersFolded = HaveAllPlayersFolded(gameId);
    new haveAllPlayersChecked = HaveAllPlayersChecked(gameId);
    new plays = Pkr_GetAmountOfPlays(gameId);
    new amountOfPlayers = Pkr_GetAmountOfPlayersOnGame(gameId);
    new amountOfFoldedPlayers = Pkr_CountPlayerStatus(gameId, POKER_PLAYER_STATUS: FOLDED);
    new amountOfAllInPlayers = Pkr_CountPlayerStatus(gameId, POKER_PLAYER_STATUS: ALL_IN);
    new activePlayers = amountOfPlayers - amountOfFoldedPlayers - amountOfAllInPlayers;

	if(amountOfFoldedPlayers == amountOfPlayers - 1) {
		new nonFoldedPlayer = Pkr_GetFirstPlayerWithoutStatus(gameId, FOLDED);
		new nonFoldedPlayerId = Pkr_GetPlayerId(gameId, nonFoldedPlayer);

		Pkr_SendFormattedGameMessage(gameId, COLOR_RED, "%s wins the game due to all players folding.", Pkr_GetClientName(nonFoldedPlayerId));
		Pkr_AddPlayerChips(gameId, nonFoldedPlayer, Pkr_GetPotAmount(gameId));
		Pkr_SetPotAmount(gameId, 0);
		Pkr_SetGameToLobby(gameId);
		return;
	}

    if(amountOfPlayers == amountOfAllInPlayers) {
		Pkr_DealRemainingRounds(gameId);
        return;
    }

    if(haveAllPlayersFolded && (activePlayers == 0 || amountOfPlayers == 2))
    {
        if(amountOfAllInPlayers > 1) {
			Pkr_DealRemainingRounds(gameId);
            return;
        }

        new nonFoldedPlayer = Pkr_GetFirstPlayerWithoutStatus(gameId, FOLDED);
        new nonFoldedPlayerId = Pkr_GetPlayerId(gameId, nonFoldedPlayer);

        Pkr_SendFormattedGameMessage(gameId, COLOR_RED, "%s wins the game due to all players folding.", Pkr_GetClientName(nonFoldedPlayerId));
        Pkr_AddPlayerChips(gameId, nonFoldedPlayer, Pkr_GetPotAmount(gameId));
        Pkr_SetPotAmount(gameId, 0);
        Pkr_SetGameToLobby(gameId);
        return;
    }

    if(haveAllPlayersChecked) {
        Pkr_DealNextRound(gameId);
        return;
    }

    if(plays == activePlayers) {
        if(activePlayers == 1) {
			Pkr_DealRemainingRounds(gameId);
            return;
        }

        Pkr_DealNextRound(gameId);
        return;
    }

    new _nextPlayer = Pkr_FindNextPlayer(gameId, activePlayer);
    Pkr_SetPlayerPlaying(gameId, _nextPlayer);
    return;
}

stock Pkr_SetPlayerPlaying(const gameId, const playerSlot)
{
    Pkr_SetCurrentPlayerPosition(gameId, playerSlot);

    if(Pkr_GetCurrentBet(gameId) > 0)
        Pkr_SetMenuItemOneStateRaise(gameId);
    else
        Pkr_SetMenuItemOneStateBet(gameId);

    if(Pkr_GetCurrentBet(gameId) > Pkr_GetPlayerBetContribution(gameId, playerSlot))
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
    Pkr_SetLastAggressivePlayer(gameId, INVALID_PLAYER_ID);
    Pkr_SetLastBet(gameId, 0);
    Pkr_ResetPlayerBetContributions(gameId);
    Pkr_SetAmountOfPlays(gameId, 0);

    for(new i = 0; i < MAX_POKER_PLAYERS; ++i)
        Pkr_ResetPlayerClosedLastPlay(gameId, i);

    new dealerPosition = Pkr_GetDealerPosition(gameId);
    Pkr_SetAllPlayerStatusWaiting(gameId);

	new dealerPlayerId = Pkr_GetPlayerId(gameId, dealerPosition);
	if(dealerPlayerId != INVALID_PLAYER_ID)
		Pkr_SetPlayerStatusDealer(gameId, dealerPosition);


    new _nextPlayer = Pkr_FindNextPlayer(gameId, dealerPosition);
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

Pkr_DealRemainingRounds(const gameId)
{
    switch(Pkr_GetGameStatus(gameId))
    {
        case (POKER_GAME_STATUS: INITIAL_BETTING):
        {
            Pkr_DealFlop(gameId);
            Pkr_DealTurn(gameId);
            Pkr_DealRiver(gameId);
            Pkr_Evaluate(gameId);
        }


        case (POKER_GAME_STATUS: FLOP):
        {
            Pkr_DealTurn(gameId);
            Pkr_DealRiver(gameId);
            Pkr_Evaluate(gameId);
        }

        case (POKER_GAME_STATUS: TURN):
        {
            Pkr_DealRiver(gameId);
            Pkr_Evaluate(gameId);
        }

        case (POKER_GAME_STATUS: RIVER):
        {
            Pkr_Evaluate(gameId);
        }
    }

    return;
}

stock Pkr_Evaluate(const gameId)
{
    Pkr_SetGameStatus(gameId, POKER_GAME_STATUS: EVALUATION);
	Pkr_ShowAllPlayerCards(gameId);

    new _sz[128];
    new _winners[MAX_POKER_PLAYERS] = {INVALID_PLAYER_ID, ...};
    new _value = Pkr_FindWinner(gameId, _winners);
    new _wincount;
    for(new i; i < MAX_POKER_PLAYERS; ++i)
        if(_winners[i] != INVALID_PLAYER_ID)
            ++_wincount;

    if(Pkr_CountPlayerStatus(gameId, POKER_PLAYER_STATUS: ALL_IN) == 0)
    {
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
                new _split = Pkr_GetPotAmount(gameId);

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
    }
    else
    {
        /*
            ORDER EVERY CONTRIBUTION ASCENDING
            MINUS LOWEST FROM EVERY PLAYER
            CHECK WINNER

            LOWEST CONTRIBUTOR EXCLUDED
            ORDER AGAIN
            MINUS LOWEST
            CHECK WINNER

            REPEAT
        */



        // 2d array of player slots and their contributions
        printf("Pot is %d", Pkr_GetPotAmount(gameId));

        new contributions[MAX_POKER_PLAYERS][2];
        new totalContributions;
        for(new i; i < MAX_POKER_PLAYERS; ++i)
        {
            contributions[i][0] = i;
            contributions[i][1] = Pkr_GetPlayerPotContribution(gameId, i);
            printf("Contribution for player %d is $%d", i, contributions[i][1]);
            totalContributions += contributions[i][1];
        }

        printf("Total is now $%d", totalContributions);
        printf("Ordering...");

        for(new i, _b, tmp; i < MAX_POKER_PLAYERS; ++i)
        {
            for(_b = 0; _b < MAX_POKER_PLAYERS; ++_b)
            {
                if(contributions[i][1] < contributions[_b][1])
                {
                    tmp = contributions[i][0];
                    contributions[i][0] = contributions[_b][0];
                    contributions[_b][0] = tmp;

                    tmp = contributions[i][1];
                    contributions[i][1] = contributions[_b][1];
                    contributions[_b][1] = tmp;
                }
            }
        }

        for(new i; i < MAX_POKER_PLAYERS; ++i)
        {
            printf("Contribution for player %d is $%d", i, contributions[i][1]);
        }



        for(new _b, _pot, count; _b < MAX_POKER_PLAYERS; ++_b)
		{
			_pot = 0;
			if(contributions[_b][1] != 0)
			{
                for(new _i = 0; _i < MAX_POKER_PLAYERS; ++_i)
                    _winners[_i] = INVALID_PLAYER_ID;

                _value = Pkr_FindWinner(gameId, _winners);


				// FIND THE LOWEST
				// SUBTRACT FROM ALL THE REST AND MAKE THE POT

				new _cache = contributions[_b][1];
				_pot = _cache;
				for(new i = _b; i < MAX_POKER_PLAYERS; ++i)
				{
					if(contributions[i][1] != 0)
					{
						if(i != _b)
						{
							_pot += _cache;
							contributions[i][1] -= contributions[_b][1];
						}
					}
				}



                Pkr_SetPlayerStatusEvaluated(gameId, contributions[_b][0]);

				_wincount = 0;
				for(new i; i < MAX_POKER_PLAYERS; ++i)
                    if(_winners[i] != INVALID_PLAYER_ID) ++_wincount;

				if(_wincount > 1) // Multiple winners
				{


                    strdel(_sz, 0, sizeof(_sz));
					Pkr_SubFromPot(gameId, _pot);
					for(new i = 0; i < _wincount; ++i)
					{
                        Pkr_AddPlayerChips(_winners[i], gameId, contributions[_b][1]);
					    _pot -= contributions[_b][1];
						format(_sz, sizeof(_sz), "%s %s", _sz, Pkr_GetClientName(g_rgPokerGames[gameId][PLAYERS][_winners[i]]));
					}

					if(_pot > 0)
					{
						new _split;
						if((Pkr_IsOdd(_split) && !Pkr_IsOdd(_wincount)) || (!Pkr_IsOdd(_split) && Pkr_IsOdd(_wincount)))
						{
							_pot -= 1;
							_split = _pot / _wincount;
						}
						else _split = _pot / _wincount;
						for(new i = 0; i < _wincount; ++i)
                            Pkr_AddPlayerChips(gameId, _winners[i], _split);
					}
					format(_sz, sizeof(_sz), "The pot has been split between {CC6600}%s {FF9900}due to players having a %s with a value of %i.", _sz, Pkr_ReturnHandName(Pkr_HandRank(_value)), _value);
					Pkr_SendGameMessage(gameId, COLOR_ORANGE, _sz);
				}
				else
				{

                    // check winner, repeat...
					format(_sz, sizeof(_sz), "{CC6600}%s {FF9900}is the winner of the %s ($%s) with a %s and a value of %i.", Pkr_GetClientName(g_rgPokerGames[gameId][PLAYERS][_winners[0]]), (count == 0) ? ("main pot") : ("side pot"), Pkr_FormatNumber(_pot), Pkr_ReturnHandName(Pkr_HandRank(_value)), _value);
					Pkr_SendGameMessage(gameId, COLOR_ORANGE, _sz);
                    Pkr_AddPlayerChips(gameId, _winners[0], _pot);
					Pkr_SubFromPot(gameId, _pot);
				}
				contributions[_b][1] = 0;
				++count;
			}
		}
    }

    Pkr_SendFormattedGameMessage(gameId, COLOR_GREY, "Use '/pkr nexthand' to return to the lobby and start a new hand.");
    return;
}

stock Pkr_SetGameToLobby(const gameId)
{
    PkrClearTableCards(gameId);
    Pkr_ClearAllPlayerCards(gameId);
    Pkr_SetAllPlayerStatusInLobby(gameId);
    Pkr_SetAllPlayersNotReady(gameId);
    Pkr_ShowAllPlayersReadyTextDraw(gameId);
    Pkr_SetSmallBlindPosition(gameId, -1);
    Pkr_SetBigBlindPosition(gameId, -1);
    Pkr_SetGameStatus(gameId, POKER_GAME_STATUS: LOBBY);
    Pkr_SetAllPlayerPotContribution(gameId, 0);
    Pkr_ResetPlayerBetContributions(gameId);
    Pkr_SetLastBet(gameId, 0);
    Pkr_SetAmountOfPlays(gameId, 0);
    Pkr_SendFormattedGameMessage(gameId, COLOR_GREY, "Use '/pkr start' to start the game.");

    new playerid = INVALID_PLAYER_ID;
    for(new i; i < MAX_POKER_PLAYERS; ++i)
    {
        playerid = Pkr_GetPlayerId(gameId, i);
        if(playerid != INVALID_PLAYER_ID)
        {
            if(Pkr_GetPlayerChips(gameId, i) < Pkr_GetBigBlind(gameId))
            {
                SendClientMessage(playerid, COLOR_RED, "You cannot meet the big blind, you have been removed from the game.");
                Pkr_UnassignPlayerFromGame(playerid, gameId);
            }
        }
    }
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

        if(Pkr_GetPlayerId(gameId, _nextPlayer) != INVALID_PLAYER_ID && Pkr_GetPlayerStatus(gameId, _nextPlayer) != POKER_PLAYER_STATUS: FOLDED && Pkr_GetPlayerStatus(gameId, _nextPlayer) != POKER_PLAYER_STATUS: ALL_IN)
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
    Pkr_SetPlayerChips(gameId, _smallBlindPosition, Pkr_GetPlayerChips(gameId, _smallBlindPosition) - Pkr_GetSmallBlind(gameId));
    Pkr_AddToPot(gameId, Pkr_GetSmallBlind(gameId));
    Pkr_AddToPlayerBetContribution(gameId, _smallBlindPosition, Pkr_GetSmallBlind(gameId));

    Pkr_SetPlayerStatusBigBlind(gameId, _bigBlindPosition);
    Pkr_AddToPlayerPotContribution(gameId, _bigBlindPosition, Pkr_GetBigBlind(gameId));
    Pkr_SetPlayerChips(gameId, _bigBlindPosition, Pkr_GetPlayerChips(gameId, _bigBlindPosition) - Pkr_GetBigBlind(gameId));
    Pkr_SetCurrentBet(gameId, Pkr_GetBigBlind(gameId));
    Pkr_AddToPot(gameId, Pkr_GetBigBlind(gameId));
    Pkr_AddToPlayerBetContribution(gameId, _bigBlindPosition, Pkr_GetBigBlind(gameId));
    Pkr_SetLastAggressivePlayer(gameId, _bigBlindPosition);
    Pkr_SetLastBet(gameId, Pkr_GetBigBlind(gameId));


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

/*

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
    new _allInPlayersCount = Pkr_CountPlayerStatus(gameId, POKER_PLAYER_STATUS: ALL_IN);

    if(_allInPlayersCount == _playersOn - _foldedPlayersCount)
    {
        switch(Pkr_GetGameStatus(gameId))
        {
            case (POKER_GAME_STATUS: INITIAL_BETTING):
            {
                Pkr_DealFlop(gameId);
                Pkr_DealTurn(gameId);
                Pkr_DealRiver(gameId);
                Pkr_Evaluate(gameId);
            }


            case (POKER_GAME_STATUS: FLOP):
            {
                Pkr_DealTurn(gameId);
                Pkr_DealRiver(gameId);
                Pkr_Evaluate(gameId);
            }

            case (POKER_GAME_STATUS: TURN):
            {
                Pkr_DealRiver(gameId);
                Pkr_Evaluate(gameId);
            }

            case (POKER_GAME_STATUS: RIVER):
            {
                Pkr_Evaluate(gameId);
            }
        }

        return;
    }

    new closedCount = 0;
    for(new i = 0; i < MAX_POKER_PLAYERS; ++i)
    {
        if(Pkr_GetPlayerId(gameId, i) != INVALID_PLAYER_ID && Pkr_GetPlayerStatus(gameId, i) != POKER_PLAYER_STATUS: FOLDED && Pkr_GetPlayerStatus(gameId, i) != POKER_PLAYER_STATUS: ALL_IN && Pkr_GetPlayerClosedLastPlay(gameId, i) == true)
        {
            closedCount++;
        }
    }

    if(_hasEveryoneChecked == _playersOn - _foldedPlayersCount - _allInPlayersCount && (closedCount == _playersOn - _foldedPlayersCount - _allInPlayersCount || Pkr_GetLastAggressivePlayer(gameId) == INVALID_PLAYER_ID))
    {
        Pkr_DealNextRound(gameId);
        return;
    }

    if(Pkr_HasEveryonePlayed(gameId) == true)
    {
        Pkr_DealNextRound(gameId);
        return;
    }

    //

    if(closedCount == _playersOn - _foldedPlayersCount - _allInPlayersCount)
    {

        if(_playersOn - _foldedPlayersCount - _allInPlayersCount == 1)
        {
            switch(Pkr_GetGameStatus(gameId))
            {
                case (POKER_GAME_STATUS: INITIAL_BETTING):
                {
                    Pkr_DealFlop(gameId);
                    Pkr_DealTurn(gameId);
                    Pkr_DealRiver(gameId);
                    Pkr_Evaluate(gameId);
                }


                case (POKER_GAME_STATUS: FLOP):
                {
                    Pkr_DealTurn(gameId);
                    Pkr_DealRiver(gameId);
                    Pkr_Evaluate(gameId);
                }

                case (POKER_GAME_STATUS: TURN):
                {
                    Pkr_DealRiver(gameId);
                    Pkr_Evaluate(gameId);
                }

                case (POKER_GAME_STATUS: RIVER):
                {
                    Pkr_Evaluate(gameId);
                }
            }

            return;
        }

        Pkr_DealNextRound(gameId);
        return;
    }

    //

    new _nextPlayer = Pkr_FindNextPlayer(gameId, Pkr_GetCurrentPlayerPosition(gameId));

    if(Pkr_GetLastAggressivePlayer(gameId) == _nextPlayer && Pkr_GetPlayerStatus(gameId, _nextPlayer) != POKER_PLAYER_STATUS: BIG_BLIND)
    {
        Pkr_DealNextRound(gameId);
        return;
    }

    Pkr_SetPlayerPlaying(gameId, _nextPlayer);
    return;
}

*/
