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

Pkr_PlayerChipsDialogResponse(const playerid, const response, const inputtext[]) {
    new pokerDialogId = Pkr_GetPokerDialog(playerid);
	new gameId = Pkr_GetPlayerGame(playerid);

    switch(pokerDialogId) {
        case (POKER_DIALOGS: CHIPS): {
			if(!response) {
				Pkr_ShowCursorForPlayerId(playerid);
				return;
			}

			new POKER_GAME_STATUS: status = Pkr_GetGameStatus(gameId);
			if(status != POKER_GAME_STATUS: LOBBY) {
				SendClientMessage(playerid, COLOR_RED, "You can only add more chips to your stack in the lobby.");
				return;
			}

			if(!Pkr_IsNumeric(inputtext)) {
				Pkr_ShowChipsDialog(playerid, PLAYER_CHIPS_DIALOG_ERROR: NAN);
				return;
			}

			new amount = strval(inputtext);
			new playerMoney = GetPlayerRealMoney(playerid);

			if(amount <= 0) {
				Pkr_ShowChipsDialog(playerid, PLAYER_CHIPS_DIALOG_ERROR: NAN);
				return;
			}

			if(amount > playerMoney) {
				Pkr_ShowChipsDialog(playerid, PLAYER_CHIPS_DIALOG_ERROR: NO_MONEY);
				return;
			}

			Pkr_ShowChipsConfirmDialog(playerid, amount);
            return;
        }

		case (POKER_DIALOGS: CHIPS_CONFIRM): {
			new amount = GetPVarInt(playerid, POKER_CHIPS_VAR_NAME);
			DeletePVar(playerid, POKER_CHIPS_VAR_NAME);

			if(!response) {
				Pkr_ShowChipsDialog(playerid);
				return;
			}

			new POKER_GAME_STATUS: status = Pkr_GetGameStatus(gameId);
			if(status != POKER_GAME_STATUS: LOBBY) {
				SendClientMessage(playerid, COLOR_RED, "You can only add more chips to your stack in the lobby.");
				return;
			}

			new slot = Pkr_GetPlayerSlot(playerid, gameId);

			Pkr_AddPlayerChips(gameId, slot, amount);
			SetupPlayerMoney(playerid, -amount);
			Pkr_ShowCursorForPlayerId(playerid);
			Pkr_SendFormattedGameMessage(gameId, COLOR_RED, "%s has added $%s chips to their stack.", Pkr_GetClientName(playerid), Pkr_FormatNumber(amount));
			return;
		}
    }
    return;
}
