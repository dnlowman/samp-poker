Pkr_GameDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    #pragma unused playerid, dialogid, response, listitem, inputtext

    new _pokerDialogId = Pkr_GetPokerDialog(playerid);

    switch(_pokerDialogId)
    {
        case (POKER_DIALOGS: BET):
        {
            SendClientMessageToAll(COLOR_RED, "Bet...");
            return;
        }

        case (POKER_DIALOGS: BET_CONFIRM):
        {
            SendClientMessageToAll(COLOR_RED, "Bet Confirm...");
            return;
        }

        case (POKER_DIALOGS: RAISE):
        {
            SendClientMessageToAll(COLOR_RED, "Raise...");
            return;
        }

        case (POKER_DIALOGS: RAISE_CONFIRM):
        {
            SendClientMessageToAll(COLOR_RED, "Raise Confirm...");
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
