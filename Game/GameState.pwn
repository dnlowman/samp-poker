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

		new pot = Pkr_GetPotAmount(gameId);
		new rakeAmount = Pkr_TakeRake(gameId, pot);
		if(rakeAmount > 0.0)
			pot -= rakeAmount;

		Pkr_SendFormattedGameMessage(gameId, COLOR_RED, "%s wins the game due to all players folding.", Pkr_GetClientName(nonFoldedPlayerId));
        Pkr_Log("%s wins GameId: %d with pot: $%d due to all players folding.", Pkr_GetClientName(nonFoldedPlayerId), gameId, pot);
		Pkr_AddPlayerChips(gameId, nonFoldedPlayer, pot);
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

		new pot = Pkr_GetPotAmount(gameId);
		new rakeAmount = Pkr_TakeRake(gameId, pot);
		if(rakeAmount > 0.0)
			pot -= rakeAmount;

        Pkr_SendFormattedGameMessage(gameId, COLOR_RED, "%s wins the game due to all players folding.", Pkr_GetClientName(nonFoldedPlayerId));
        Pkr_Log("%s wins GameId: %d with pot: $%d due to all players folding.", Pkr_GetClientName(nonFoldedPlayerId), gameId, pot);
        Pkr_AddPlayerChips(gameId, nonFoldedPlayer, pot);
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
	Pkr_SetTimerValue(gameId, Pkr_GetTimerStart(gameId));
	Pkr_SetCurrentPlayerPosition(gameId, playerSlot);

    if(Pkr_GetCurrentBet(gameId) > 0)
        Pkr_SetMenuItemOneStateRaise(gameId);
    else
        Pkr_SetMenuItemOneStateBet(gameId);

    if(Pkr_GetCurrentBet(gameId) > Pkr_GetPlayerBetContribution(gameId, playerSlot))
        Pkr_SetMenuItemTwoStateCall(gameId);
    else
        Pkr_SetMenuItemTwoStateCheck(gameId);

	new playerid = Pkr_GetPlayerId(gameId, playerSlot);
	PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
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

Pkr_TakeRake(const gameId, const pot) {
	new businessId = Pkr_GetBusiness(gameId);

	if(businessId != -1) {
		new Float: rake = Pkr_GetRake(businessId);

		if(rake > 0.0) {
			new rakeAmount = floatround((pot / 100) * rake);

			SetUpBizCashBank(businessId, rakeAmount);

			new rakeMessage[128];
			format(rakeMessage, sizeof(rakeMessage), "The business has taken a %.1f percentage rake off of the pot which amounts to: $%s", rake, Pkr_FormatNumber(rakeAmount));
			Pkr_SendGameMessage(gameId, COLOR_ORANGE, rakeMessage);

			return rakeAmount;
		}
	}

	return 0;
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
			new pot = Pkr_GetPotAmount(gameId);

			new rakeAmount = Pkr_TakeRake(gameId, pot);
            if(rakeAmount > 0) {
				pot -= rakeAmount;
            }

			new _split = floatround(pot / _wincount);

			new message[128];

			for(new i; i < _wincount; ++i) {
                if(_winners[i] == INVALID_PLAYER_ID)
                    continue;
				Pkr_SetPlayerChips(gameId, _winners[i], _split);
				new playerId = Pkr_GetPlayerId(gameId, _winners[i]);
				format(message, sizeof(message), "%s %s", message, Pkr_GetClientName(playerId));
			}
			Pkr_SetPotAmount(gameId, 0);

            format(message, sizeof(message), "The pot has been split between {CC6600}%s {FF9900}due to players having a %s with a value of %i.", message, Pkr_ReturnHandName(Pkr_HandRank(_value)), _value);
            Pkr_SendGameMessage(gameId, COLOR_ORANGE, message);
            Pkr_Log("The pot has been split between %s due to players having a %s with a value of %i for GameId: %d.", message, Pkr_ReturnHandName(Pkr_HandRank(_value)), _value, gameId);
        }
        else // One winner
        {
            new pot = Pkr_GetPotAmount(gameId);
            new rakeAmount = Pkr_TakeRake(gameId, pot);
            if(rakeAmount > 0) {
				pot -= rakeAmount;
            }

			format(_sz, sizeof(_sz), "{CC6600}%s {FF9900}wins the pot ($%s) with a %s and a value of %i.", Pkr_GetClientName(g_rgPokerGames[gameId][PLAYERS][_winners[0]]), Pkr_FormatNumber(Pkr_GetPotAmount(gameId)), Pkr_ReturnHandName(Pkr_HandRank(_value)), _value);
            Pkr_SendGameMessage(gameId, COLOR_ORANGE, _sz);
            Pkr_SetPlayerChips(gameId, _winners[0], Pkr_GetPlayerChips(gameId, _winners[0]) + Pkr_GetPotAmount(gameId));
            Pkr_Log("%s wins the pot ($%s) with a %s and a value of %i for GameId: %d.", Pkr_GetClientName(g_rgPokerGames[gameId][PLAYERS][_winners[0]]), Pkr_FormatNumber(Pkr_GetPotAmount(gameId)), Pkr_ReturnHandName(Pkr_HandRank(_value)), _value, gameId);
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


		// All of the contributions
		/*
			0: Player Slot
			1: Amount
		*/
		new count; // The count of the pots dished out...
        new contributions[MAX_POKER_PLAYERS][2];

		new contributionSum = 0;

        for(new i; i < MAX_POKER_PLAYERS; ++i) {
            contributions[i][0] = i;
            contributions[i][1] = Pkr_GetPlayerPotContribution(gameId, i);
			contributionSum += contributions[i][1];
        }

        Pkr_SendFormattedGameMessage(gameId, COLOR_RED, "The total contributions to the pot are: $%d with the pot standing at: $%d.", contributionSum, Pkr_GetPotAmount(gameId));

		// Ordered contributions bubble sort...
        for(new i; i < MAX_POKER_PLAYERS; ++i)
        {
            for(new j; j < MAX_POKER_PLAYERS; ++j)
            {
                if(contributions[i][1] < contributions[j][1])
                {
					new tmp = contributions[i][0];
                    contributions[i][0] = contributions[j][0];
                    contributions[j][0] = tmp;

                    tmp = contributions[i][1];
                    contributions[i][1] = contributions[j][1];
                    contributions[j][1] = tmp;
                }
            }
        }

		// Foreach contribution
		for(new i; i < MAX_POKER_PLAYERS; ++i) {

			// If there is nothing in this contribution continue...
			if(contributions[i][1] == 0) {
				// Mark the player as evaluated, they contributed nothing...
				Pkr_SetPlayerStatusEvaluated(gameId, contributions[i][0]);
				continue;
			}

			// Reset the last winners...
			for(new j; j < MAX_POKER_PLAYERS; ++j)
				_winners[j] = INVALID_PLAYER_ID;

			// Get the winner...
			_value = Pkr_FindWinner(gameId, _winners);

			// Store the current lowest value...
			new lowest = contributions[i][1];

			new pot;

			// Foreach player
			for(new j; j < MAX_POKER_PLAYERS; ++j) {
				if(Pkr_GetPlayerStatus(gameId, contributions[j][0]) != POKER_PLAYER_STATUS: EVALUATED && contributions[j][1] != 0) {
					pot += lowest;
					contributions[j][1] -= lowest;
				}
			}

			// The lowest contributor has now been excluded...
			Pkr_SetPlayerStatusEvaluated(gameId, contributions[i][0]);

			_wincount = 0;
			for(new j; j < MAX_POKER_PLAYERS; ++j)
				if(_winners[j] != INVALID_PLAYER_ID) ++_wincount;

			if(_wincount > 1) // Multiple winners
			{
                new originalPot = pot;
                new rakeAmount = Pkr_TakeRake(gameId, pot);
                if(rakeAmount > 0) {
    				pot -= rakeAmount;
                }

				Pkr_SubFromPot(gameId, originalPot);

				new message[128];

				for(new j = 0; j < _wincount; ++j) {
					if(_winners[j] == INVALID_PLAYER_ID)
						continue;
					format(message, sizeof(message), "%s %s", message, Pkr_GetClientName(g_rgPokerGames[gameId][PLAYERS][_winners[j]]));
				}

				format(message, sizeof(message), "{CC6600}%s {FF9900}are the winners of the %s ($%s) with a %s and a value of %i.", message, (count == 0) ? ("main pot") : ("side pot"), Pkr_FormatNumber(pot), Pkr_ReturnHandName(Pkr_HandRank(_value)), _value);
                Pkr_Log("%s are the winners of the %s ($%s) with a %s and a value of %i for GameId: %d.", message, (count == 0) ? ("main pot") : ("side pot"), Pkr_FormatNumber(pot), Pkr_ReturnHandName(Pkr_HandRank(_value)), _value, gameId);
                Pkr_SendGameMessage(gameId, COLOR_ORANGE, message);

				new _split = floatround(pot / _wincount);

				// Give the split to each player who won...
				for(new j = 0; j < _wincount; ++j) {
                    if(_winners[j] == INVALID_PLAYER_ID)
                        continue;
					Pkr_AddPlayerChips(gameId, _winners[j], _split);
                    Pkr_Log("%s wins the split with a value of $%d for GameId: %d.", Pkr_GetClientName(g_rgPokerGames[gameId][PLAYERS][_winners[j]]), gameId, _split);
				}
			}
            if(_wincount == 0)
            {
                Pkr_SubFromPot(gameId, pot);
                Pkr_Log("Looks like no one is elligable for these chips due to a disconnect $%d.", pot);
            }
			else
			{
				new originalPot = pot;

                new rakeAmount = Pkr_TakeRake(gameId, pot);
                if(rakeAmount > 0) {
    				pot -= rakeAmount;
                }

				format(_sz, sizeof(_sz), "{CC6600}%s {FF9900}is the winner of the %s ($%s) with a %s and a value of %i.", Pkr_GetClientName(g_rgPokerGames[gameId][PLAYERS][_winners[0]]), (count == 0) ? ("main pot") : ("side pot"), Pkr_FormatNumber(pot), Pkr_ReturnHandName(Pkr_HandRank(_value)), _value);
				Pkr_SendGameMessage(gameId, COLOR_ORANGE, _sz);
                Pkr_Log("%s is the winner of the %s ($%s) with a %s and a value of %i for GameId: %d.", Pkr_GetClientName(g_rgPokerGames[gameId][PLAYERS][_winners[0]]), (count == 0) ? ("main pot") : ("side pot"), Pkr_FormatNumber(pot), Pkr_ReturnHandName(Pkr_HandRank(_value)), _value, gameId);
				Pkr_AddPlayerChips(gameId, _winners[0], pot);
				Pkr_SubFromPot(gameId, originalPot);
			}

			++count;
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
	Pkr_SetTimerTextDrawText(gameId, "_");
    Pkr_SendFormattedGameMessage(gameId, COLOR_GREY, "Use '/pkr start' to start the game.");
    return;
}

Pkr_BlindMeetCheck(const gameId) {
	new playerid = INVALID_PLAYER_ID;
	for(new i; i < MAX_POKER_PLAYERS; ++i)
	{
		playerid = Pkr_GetPlayerId(gameId, i);
		if(playerid != INVALID_PLAYER_ID)
		{
			if(Pkr_GetPlayerChips(gameId, i) < Pkr_GetSmallBlind(gameId))
			{
				SendClientMessage(playerid, COLOR_RED, "You cannot meet the small blind, you have been removed from the game.");
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
    Pkr_Log("%s is the small blind $%d for GameId: %d", Pkr_GetClientName(Pkr_GetPlayerId(gameId, _smallBlindPosition)), Pkr_GetSmallBlind(gameId), gameId);
    Pkr_AddToPot(gameId, Pkr_GetSmallBlind(gameId));
    Pkr_AddToPlayerBetContribution(gameId, _smallBlindPosition, Pkr_GetSmallBlind(gameId));

    Pkr_SetPlayerStatusBigBlind(gameId, _bigBlindPosition);
    Pkr_AddToPlayerPotContribution(gameId, _bigBlindPosition, Pkr_GetBigBlind(gameId));
    Pkr_SetPlayerChips(gameId, _bigBlindPosition, Pkr_GetPlayerChips(gameId, _bigBlindPosition) - Pkr_GetBigBlind(gameId));
    Pkr_Log("%s is the big blind $%d for GameId: %d", Pkr_GetClientName(Pkr_GetPlayerId(gameId, _bigBlindPosition)), Pkr_GetBigBlind(gameId), gameId);
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
