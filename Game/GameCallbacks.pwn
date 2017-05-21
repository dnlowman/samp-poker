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

Pkr_GameDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    #pragma unused dialogid, listitem, inputtext

    new _pokerDialogId = Pkr_GetPokerDialog(playerid);

	new gameId = Pkr_GetPlayerGame(playerid);

	if(gameId == INVALID_POKER_GAME_ID)
		return;

	#if !defined POKER_DEBUG
		new currentPlayerPosition = Pkr_GetCurrentPlayerPosition(gameId);
		new playerPosition = Pkr_GetPlayerSlot(playerid, gameId);
		if(playerPosition != currentPlayerPosition) {
			SendClientMessage(playerid, COLOR_RED, "You're not the current player!");
			return;
		}
	#endif

    switch(_pokerDialogId)
    {
        case (POKER_DIALOGS: BET):
        {
            if(!response) {
				Pkr_ShowCursorForPlayerId(playerid);
				return;
			}

            new _gameId = Pkr_GetPlayerGame(playerid);
            new _slot = Pkr_GetCurrentPlayerPosition(_gameId);
            new inputAmount = strval(inputtext);

            if(!Pkr_IsNumeric(inputtext) || strlen(inputtext) > 9)
            {
                Pkr_GameShowBetDialog(playerid, BET_DIALOG_ERROR: NAN);
                return;
            }

			if(inputAmount == 0) {
				Pkr_GameShowBetDialog(playerid, BET_DIALOG_ERROR: ZERO);
				return;
			}

            if(Pkr_GetPlayerChips(_gameId, _slot) < inputAmount)
            {
                Pkr_GameShowBetDialog(playerid, BET_DIALOG_ERROR: NO_MONEY);
                return;
            }

            if(Pkr_GetPlayerChips(_gameId, _slot) == inputAmount)
            {
				Pkr_GameShowAllInDialog(playerid);
                return;
            }

            SetPVarInt(playerid, POKER_PLAYER_BET_AMOUNT_VAR, inputAmount);
            Pkr_GameShowBetConfirmDialog(playerid);
            return;
        }

        case (POKER_DIALOGS: BET_CONFIRM):
        {
            new _gameId = Pkr_GetPlayerGame(playerid);
            new _slot = Pkr_GetCurrentPlayerPosition(_gameId);
            new _inputAmount = GetPVarInt(playerid, POKER_PLAYER_BET_AMOUNT_VAR);

            if(!response)
            {
                Pkr_GameShowBetDialog(playerid);
                return;
            }

            Pkr_PlayerConfirmBet(_gameId, _slot, _inputAmount);
			Pkr_ShowCursorForPlayerId(playerid);
            return;
        }

        case (POKER_DIALOGS: RAISE):
        {
            if(!response) {
				Pkr_ShowCursorForPlayerId(playerid);
				return;
			}

            new _gameId = Pkr_GetPlayerGame(playerid);
            new _slot = Pkr_GetCurrentPlayerPosition(_gameId);
            new inputAmount = strval(inputtext);
            new _amountToMeet = Pkr_GetCurrentBet(_gameId) - Pkr_GetPlayerBetContribution(_gameId, _slot);
            new _totalCost = _amountToMeet + inputAmount;
			new playerChips = Pkr_GetPlayerChips(_gameId, _slot);

            if(!Pkr_IsNumeric(inputtext) || strlen(inputtext) > 9)
            {
                Pkr_GameShowRaiseDialog(playerid, _gameId, RAISE_DIALOG_ERROR: NAN);
                return;
            }

            if(inputAmount < Pkr_GetLastBet(_gameId))
            {
                Pkr_GameShowRaiseDialog(playerid, _gameId, RAISE_DIALOG_ERROR: LAST_BET);
                return;
            }

            if(playerChips < _totalCost)
            {
                Pkr_GameShowRaiseDialog(playerid, _gameId, RAISE_DIALOG_ERROR: NO_MONEY);
                return;
            }

			if(_totalCost == playerChips)
			{
				Pkr_GameShowAllInDialog(playerid);
				return;
			}

            SetPVarInt(playerid, POKER_PLAYER_RAISE_AMOUNT_VAR, inputAmount);
            Pkr_GameShowRaiseConfirmDialog(playerid);
            return;
        }

        case (POKER_DIALOGS: RAISE_CONFIRM):
        {
            new _gameId = Pkr_GetPlayerGame(playerid);
            new _slot = Pkr_GetCurrentPlayerPosition(_gameId);
            new _inputAmount = GetPVarInt(playerid, POKER_PLAYER_RAISE_AMOUNT_VAR);
            new _amountToMeet = Pkr_GetCurrentBet(_gameId) - Pkr_GetPlayerBetContribution(_gameId, _slot);

            if(!response)
            {
                Pkr_GameShowRaiseDialog(playerid, _gameId);
                return;
            }

            Pkr_PlayerConfirmRaise(_gameId, _slot, _inputAmount, _amountToMeet);
			Pkr_ShowCursorForPlayerId(playerid);
            return;
        }

        case (POKER_DIALOGS: CALL_CONFIRM):
        {
			Pkr_ShowCursorForPlayerId(playerid);

			if(!response) {
				return;
			}

            new _gameId = Pkr_GetPlayerGame(playerid);
            new _playerSlot = Pkr_GetCurrentPlayerPosition(_gameId);
            new _callAmount = Pkr_GetCurrentBet(_gameId) - Pkr_GetPlayerBetContribution(_gameId, _playerSlot);

            Pkr_PlayerConfirmCall(_gameId, _playerSlot, _callAmount);
            return;
        }

        case (POKER_DIALOGS: CHECK_CONFIRM):
        {
			Pkr_ShowCursorForPlayerId(playerid);

			if(!response) {
				return;
			}

            new _gameId = Pkr_GetPlayerGame(playerid);
            new _playerSlot = Pkr_GetCurrentPlayerPosition(_gameId);

            Pkr_PlayerCheckConfirm(_gameId, _playerSlot);
            return;
        }

		case (POKER_DIALOGS: FOLD_CONFIRM): {
			Pkr_ShowCursorForPlayerId(playerid);

			if(!response) {
				return;
			}

			new playerSlot = Pkr_GetCurrentPlayerPosition(gameId);

			Pkr_SetPlayerStatusFolded(gameId, playerSlot);
			Pkr_SetNextPlayerPlaying(gameId);
			return;
		}

		case (POKER_DIALOGS: ALL_IN_CONFIRM): {
			Pkr_ShowCursorForPlayerId(playerid);

			if(!response) {
				return;
			}

			new playerSlot = Pkr_GetCurrentPlayerPosition(gameId);

			Pkr_SetPlayerStatusAllIn(gameId, playerSlot);

			new playerChips = Pkr_GetPlayerChips(gameId, playerSlot);
			new currentBet = Pkr_GetCurrentBet(gameId);
			new amountToMeet = playerChips - Pkr_GetPlayerBetContribution(gameId, playerSlot);

			if(currentBet < amountToMeet)
			{
				Pkr_SetLastAggressivePlayer(gameId, playerSlot);
				Pkr_SetAmountOfPlays(gameId, 0);
				Pkr_AddToCurrentBet(gameId, playerChips);
				Pkr_SetLastBet(gameId, playerChips);
			}

			Pkr_AddToPot(gameId, playerChips);
			Pkr_AddToPlayerBetContribution(gameId, playerSlot, playerChips);
			Pkr_AddToPlayerPotContribution(gameId, playerSlot, playerChips);
			Pkr_MinusPlayerChips(gameId, playerSlot, playerChips);
            Pkr_Log("%s went all in with $%d for GameId: %d.", Pkr_GetClientName(Pkr_GetPlayerId(gameId, playerSlot)), playerChips, gameId);
			Pkr_SetNextPlayerPlaying(gameId);
			return;
		}
    }

    return;
}
