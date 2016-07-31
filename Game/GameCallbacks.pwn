Pkr_GameDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    #pragma unused dialogid, listitem, inputtext

    new _pokerDialogId = Pkr_GetPokerDialog(playerid);

    switch(_pokerDialogId)
    {
        case (POKER_DIALOGS: BET):
        {
            if(!response)
                return;

            Pkr_GameShowBetConfirmDialog(playerid);

            SendClientMessageToAll(COLOR_RED, "Bet...");
            return;
        }

        case (POKER_DIALOGS: BET_CONFIRM):
        {
            if(!response)
            {
                Pkr_GameShowBetDialog(playerid);
                return;
            }

            SendClientMessageToAll(COLOR_RED, "Bet Confirm...");
            return;
        }

        case (POKER_DIALOGS: RAISE):
        {
            if(!response)
                return;

            new _gameId = Pkr_GetPlayerGame(playerid);
            new _slot = Pkr_GetCurrentPlayerPosition(_gameId);
            new inputAmount = strval(inputtext);
            new _amountToMeet = Pkr_GetCurrentBet(_gameId) - Pkr_GetPlayerBetContribution(_gameId, _slot);
            new _totalCost = _amountToMeet + inputAmount;

            if(!Pkr_IsNumeric(inputtext))
            {
                Pkr_GameShowRaiseDialog(playerid, _gameId, RAISE_DIALOG_ERROR: NAN);
                return;
            }

            if(inputAmount < _amountToMeet)
            {
                Pkr_GameShowRaiseDialog(playerid, _gameId, RAISE_DIALOG_ERROR: LAST_BET);
                return;
            }

            if(Pkr_GetPlayerChips(_gameId, _slot) < _totalCost)
            {
                Pkr_GameShowRaiseDialog(playerid, _gameId, RAISE_DIALOG_ERROR: NO_MONEY);
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
            new _totalCost = _amountToMeet + _inputAmount;

            if(!response)
            {
                Pkr_GameShowRaiseDialog(playerid, _gameId);
                return;
            }

            Pkr_AddToPot(_gameId, _totalCost);
            Pkr_MinusPlayerChips(_gameId, _slot, _totalCost);
            Pkr_AddToPlayerBetContribution(_gameId, _slot, _totalCost);

            Pkr_SendFormattedGameMessage(_gameId, COLOR_RED, "Adding to the current bet: $%d amount: $%d", Pkr_GetCurrentBet(_gameId), _inputAmount);

            Pkr_AddToCurrentBet(_gameId, _inputAmount);

            Pkr_SendFormattedGameMessage(_gameId, COLOR_RED, "The current bet is now: $%d", Pkr_GetCurrentBet(_gameId));

            Pkr_SetPlayerStatusRaised(_gameId, _slot, _inputAmount);
            Pkr_SetNextPlayerPlaying(_gameId);
            return;
        }

        case (POKER_DIALOGS: CALL_CONFIRM):
        {
            if(!response)
                return;

            new _gameId = Pkr_GetPlayerGame(playerid);
            new _playerSlot = Pkr_GetCurrentPlayerPosition(_gameId);
            new _callAmount = Pkr_GetCurrentBet(_gameId);

            if(Pkr_GetSmallBlindPosition(_gameId) == _playerSlot)
                _callAmount = _callAmount >> 1;

            Pkr_SetPlayerStatusCalled(_gameId, _playerSlot, _callAmount);
            Pkr_AddToPot(_gameId, _callAmount);
            Pkr_SetPlayerChips(_gameId, _playerSlot, Pkr_GetPlayerChips(_gameId, _playerSlot) - _callAmount);
            Pkr_SetNextPlayerPlaying(_gameId);
            return;
        }

        case (POKER_DIALOGS: CHECK_CONFIRM):
        {
            if(!response)
                return;

            new _gameId = Pkr_GetPlayerGame(playerid);
            new _playerSlot = Pkr_GetCurrentPlayerPosition(_gameId);

            Pkr_SetPlayerStatusChecked(_gameId, _playerSlot);
            Pkr_SetNextPlayerPlaying(_gameId);
            return;
        }
    }

    return;
}
