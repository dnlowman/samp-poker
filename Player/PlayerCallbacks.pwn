Pkr_PlayerDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    #pragma unused playerid, dialogid, response, listitem, inputtext

    new _pokerDialogId = Pkr_GetPokerDialog(playerid);

    switch(_pokerDialogId)
    {
        case (POKER_DIALOGS: SIT):
        {
            new _gameId = GetPVarInt(playerid, "Pkr_SitGameId");

            if(!response) {
                if(Pkr_GetAmountOfPlayersOnGame(_gameId) == 0 && Pkr_GetAmountOfJoiningPlayers(_gameId) == 1) {
                    SendClientMessage(playerid, COLOR_RED, "Looks like no one else is on that table! Destroying that game.");
                    Pkr_DestroyGame(_gameId);
                }

				DeletePVar(playerid, "Pkr_SitGameId");
                return;
            }

            if(!Pkr_IsNumeric(inputtext))
            {
                Pkr_PlayerShowDialog(playerid, _gameId, SIT_DIALOG_ERROR: NAN);
                return;
            }

            new _iSitCash = strval(inputtext);
            new _iPlayerMoney = GetPlayerRealMoney(playerid);

            if(_iPlayerMoney < _iSitCash)
            {
                Pkr_PlayerShowDialog(playerid, _gameId, SIT_DIALOG_ERROR: NO_MONEY);
                return;
            }

            if(_iSitCash < Pkr_GetBigBlind(_gameId))
            {
                Pkr_PlayerShowDialog(playerid, _gameId, SIT_DIALOG_ERROR: BLINDS);
                return;
            }

            SetPVarInt(playerid, "Pkr_SitCash", _iSitCash);
            Pkr_PlayerShowConfirmDialog(playerid);
            return;
        }

        case (POKER_DIALOGS: SIT_CONFIRM):
        {
            new _gameId = GetPVarInt(playerid, "Pkr_SitGameId");

            if(!response)
            {
                Pkr_PlayerShowDialog(playerid, _gameId);
                return;
            }

            new _iSitCash = GetPVarInt(playerid, "Pkr_SitCash");
            Pkr_AssignPlayerToGame(playerid, _gameId, _iSitCash);
			DeletePVar(playerid, "Pkr_SitGameId");
            return;
        }
    }

    return;
}
