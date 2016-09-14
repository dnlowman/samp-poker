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

            new _gameId = Pkr_GetPlayerGame(playerid);
            new _slot = Pkr_GetCurrentPlayerPosition(_gameId);
            new inputAmount = strval(inputtext);

            if(!Pkr_IsNumeric(inputtext) || strlen(inputtext) > 9)
            {
                Pkr_GameShowBetDialog(playerid, BET_DIALOG_ERROR: NAN);
                return;
            }

            if(Pkr_GetPlayerChips(_gameId, _slot) < inputAmount)
            {
                Pkr_GameShowBetDialog(playerid, BET_DIALOG_ERROR: NO_MONEY);
                return;
            }

            if(Pkr_GetPlayerChips(_gameId, _slot) == inputAmount)
            {
                // all in
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

            if(!response)
            {
                Pkr_GameShowRaiseDialog(playerid, _gameId);
                return;
            }

            Pkr_PlayerConfirmRaise(_gameId, _slot, _inputAmount, _amountToMeet);
            return;
        }

        case (POKER_DIALOGS: CALL_CONFIRM):
        {
            if(!response)
                return;

            new _gameId = Pkr_GetPlayerGame(playerid);
            new _playerSlot = Pkr_GetCurrentPlayerPosition(_gameId);
            new _callAmount = Pkr_GetCurrentBet(_gameId) - Pkr_GetPlayerBetContribution(_gameId, _playerSlot);

            Pkr_PlayerConfirmCall(_gameId, _playerSlot, _callAmount);
            return;
        }

        case (POKER_DIALOGS: CHECK_CONFIRM):
        {
            if(!response)
                return;

            new _gameId = Pkr_GetPlayerGame(playerid);
            new _playerSlot = Pkr_GetCurrentPlayerPosition(_gameId);

            Pkr_PlayerCheckConfirm(_gameId, _playerSlot);
            return;
        }
    }

    return;
}
