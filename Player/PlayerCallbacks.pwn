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

Pkr_PlayerDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    #pragma unused playerid, dialogid, response, listitem, inputtext

    new _pokerDialogId = Pkr_GetPokerDialog(playerid);

    switch(_pokerDialogId)
    {
        case (POKER_DIALOGS: SIT):
        {
            new _gameId = GetPVarInt(playerid, "Pkr_SitGameId");

			new POKER_GAME_STATUS: status = Pkr_GetGameStatus(_gameId);
			if(status != POKER_GAME_STATUS: LOBBY) {
				SendClientMessage(playerid, COLOR_RED, "This game is now in play. You can use /pkr spec to spectate.");
				return;
			}

            if(!response) {
                if(Pkr_GetAmountOfPlayersOnGame(_gameId) == 0 && Pkr_GetAmountOfJoiningPlayers(_gameId) == 1) {
                    Pkr_DestroyGame(_gameId);
                }

				DeletePVar(playerid, "Pkr_SitGameId");
				Pkr_ShowCursorForPlayerId(playerid);
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

			new POKER_GAME_STATUS: status = Pkr_GetGameStatus(_gameId);
			if(status != POKER_GAME_STATUS: LOBBY) {
				SendClientMessage(playerid, COLOR_RED, "This game is now in play. You can use /pkr spec to spectate.");
				return;
			}

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
