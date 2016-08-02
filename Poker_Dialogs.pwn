enum POKER_DIALOG {
    SIT,
    SIT_INVALID_NUMBER,
    SIT_INVALID_CASH,
    SIT_CONFIRM,
    SIT_BLINDS,
    RAISE,
    RAISE_INVALID_NUMBER,
    RAISE_INVALID_CASH,
    RAISE_LAST_BET,
    RAISE_CONFIRM,
    CALL_CONFIRM
};

Pkr_ShowPlayerDialog(playerid, POKER_DIALOG: dialog, game) {
	new _format[2048];
	new _slot = Pkr_GetPlayerSlot(playerid, game);

	switch(dialog)
	{
		case SIT:
		{
			format(_format, 2048, "Welcome {FF9900}%s{A9C4E4},\n\nIn order to sit at this table you're required to\nsit with some chips. Please ensure you sit with\na comfortable amount as this will aid your game\nexperience.\n\n", Pkr_GetClientName(playerid));
			format(_format, 2048, "%sYour cash: {00AD43}$%s{A9C4E4}.\nAverage Player Chips: {00AD43}$%.1f{A9C4E4}.\nBig Blind Amount: {00AD43}$%s{A9C4E4}.\nSmall Blind Amount: {00AD43}$%s{A9C4E4}.\nNumber of players: %i/6.", _format, Pkr_FormatNumber(GetPlayerRealMoney(playerid)), Pkr_ReturnAverageChips(game), Pkr_FormatNumber((g_rgPokerGames[game][E_POKER_GAME_BLIND_AMOUNT] << 1)), Pkr_FormatNumber(g_rgPokerGames[game][E_POKER_GAME_BLIND_AMOUNT]), Pkr_ReturnPlayersOnGame(game));
			format(_format, 2048, "%s\n\nEnter the amount of chips you wish to sit with\nbelow then click on '{FF9900}Sit{A9C4E4}' to proceed. If you\nwish to leave the table click on '{FF9900}Leave{A9C4E4}'.", _format);
			ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_INPUT, "Texas Hold 'em Poker - Sit", _format, "Sit", "Leave");
			SetPVarInt(playerid, "PokerDialog", _: SIT);
		}

		case SIT_INVALID_NUMBER:
		{
			format(_format, 2048, "Welcome {FF9900}%s{A9C4E4},\n\nIn order to sit at this table you're required to\nsit with some chips. Please ensure you sit with\na comfortable amount as this will aid your game\nexperience.\n\n", Pkr_GetClientName(playerid));
			format(_format, 2048, "%s{D10047}You have entered an invalid number, please enter\na valid amount of chips you wish to sit with.{A9C4E4}\n\n", _format);
			format(_format, 2048, "%sYour cash: {00AD43}$%s{A9C4E4}.\nAverage Player Chips: {00AD43}$%.1f{A9C4E4}.\nBig Blind Amount: {00AD43}$%s{A9C4E4}.\nSmall Blind Amount: {00AD43}$%s{A9C4E4}.\nNumber of players: %i/6.", _format, Pkr_FormatNumber(GetPlayerRealMoney(playerid)), Pkr_ReturnAverageChips(game), Pkr_FormatNumber((g_rgPokerGames[game][E_POKER_GAME_BLIND_AMOUNT] << 1)), Pkr_FormatNumber(g_rgPokerGames[game][E_POKER_GAME_BLIND_AMOUNT]), Pkr_ReturnPlayersOnGame(game));
			format(_format, 2048, "%s\n\nEnter the amount of chips you wish to sit with\nbelow then click on '{FF9900}Sit{A9C4E4}' to proceed. If you\nwish to leave the table click on '{FF9900}Leave{A9C4E4}'.", _format);
			ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_INPUT, "Texas Hold 'em Poker - Sit", _format, "Sit", "Leave");
			SetPVarInt(playerid, "PokerDialog", _: SIT);
		}

		case SIT_INVALID_CASH:
		{
			format(_format, 2048, "Welcome {FF9900}%s{A9C4E4},\n\nIn order to sit at this table you're required to\nsit with some chips. Please ensure you sit with\na comfortable amount as this will aid your game\nexperience.\n\n", Pkr_GetClientName(playerid));
			format(_format, 2048, "%s{D10047}You cannot afford that many chips, please enter\na valid amount of chips you wish to sit with.{A9C4E4}\n\n", _format);
			format(_format, 2048, "%sYour cash: {00AD43}$%s{A9C4E4}.\nAverage Player Chips: {00AD43}$%.1f{A9C4E4}.\nBig Blind Amount: {00AD43}$%s{A9C4E4}.\nSmall Blind Amount: {00AD43}$%s{A9C4E4}.\nNumber of players: %i/6.", _format, Pkr_FormatNumber(GetPlayerRealMoney(playerid)), Pkr_ReturnAverageChips(game), Pkr_FormatNumber((g_rgPokerGames[game][E_POKER_GAME_BLIND_AMOUNT] << 1)), Pkr_FormatNumber(g_rgPokerGames[game][E_POKER_GAME_BLIND_AMOUNT]), Pkr_ReturnPlayersOnGame(game));
			format(_format, 2048, "%s\n\nEnter the amount of chips you wish to sit with\nbelow then click on '{FF9900}Sit{A9C4E4}' to proceed. If you\nwish to leave the table click on '{FF9900}Leave{A9C4E4}'.", _format);
			ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_INPUT, "Texas Hold 'em Poker - Sit", _format, "Sit", "Leave");
			SetPVarInt(playerid, "PokerDialog", _: SIT);
		}

		case SIT_CONFIRM:
		{
			new _sitcash = GetPVarInt(playerid, "Pkr_SitCash");
			format(_format, sizeof(_format), "Thank you {FF9900}%s{A9C4E4},\n\nBefore you sit we would like to confirm the\namount of chips you wish to sit with.\n\n", Pkr_GetClientName(playerid));
			format(_format, sizeof(_format), "%sYour chosen chips: {00AD43}$%s{A9C4E4}.\nCash before this confirmation: {00AD43}$%s{A9C4E4}.\nCash after this confirmation: {00AD43}$%s{A9C4E4}.\n\nTo go ahead and confirm this click on '{FF9900}Sit{A9C4E4}'\nor if you wish to go back click on '{FF9900}Back{A9C4E4}'.", _format, Pkr_FormatNumber(_sitcash), Pkr_FormatNumber(GetPlayerRealMoney(playerid)), Pkr_FormatNumber(GetPlayerRealMoney(playerid) - _sitcash));
			ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_MSGBOX, "Texas Hold 'em Poker", _format, "Sit", "Back");
			SetPVarInt(playerid, "PokerDialog", _: SIT_CONFIRM);
		}

		case SIT_BLINDS:
		{
			format(_format, 2048, "Welcome {FF9900}%s{A9C4E4},\n\nIn order to sit at this table you're required to\nsit with some chips. Please ensure you sit with\na comfortable amount as this will aid your game\nexperience.\n\n", Pkr_GetClientName(playerid));
			format(_format, 2048, "%s{D10047}You cannot meet the blinds with that amount,\nplease enter a valid amount of chips you wish\nto sit with.{A9C4E4}\n\n", _format);
			format(_format, 2048, "%sYour cash: {00AD43}$%s{A9C4E4}.\nAverage Player Chips: {00AD43}$%.1f{A9C4E4}.\nBig Blind Amount: {00AD43}$%s{A9C4E4}.\nSmall Blind Amount: {00AD43}$%s{A9C4E4}.\nNumber of players: %i/6.", _format, Pkr_FormatNumber(GetPlayerRealMoney(playerid)), Pkr_ReturnAverageChips(game), Pkr_FormatNumber((g_rgPokerGames[game][E_POKER_GAME_BLIND_AMOUNT] << 1)), Pkr_FormatNumber(g_rgPokerGames[game][E_POKER_GAME_BLIND_AMOUNT]), Pkr_ReturnPlayersOnGame(game));
			format(_format, 2048, "%s\n\nEnter the amount of chips you wish to sit with\nbelow then click on '{FF9900}Sit{A9C4E4}' to proceed. If you\nwish to leave the table click on '{FF9900}Leave{A9C4E4}'.", _format);
			ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_INPUT, "Texas Hold 'em Poker - Sit", _format, "Sit", "Leave");
			SetPVarInt(playerid, "PokerDialog", _: SIT);
		}

		case RAISE:
		{
			format(_format, 2048, "Hi {FF9900}%s{A9C4E4},\n\nBy raising you're increasing the existing\nbet to an amount you're willing to pay.\n\n", Pkr_GetClientName(playerid));
			format(_format, 2048, "%sYour Chips: {00AD43}$%s{A9C4E4}.\nCurrent Bet: {00AD43}$%s{A9C4E4}.\n", _format, Pkr_FormatNumber(g_rgPokerGames[game][PLAYER_CHIPS][_slot]), Pkr_FormatNumber(g_rgPokerGames[game][E_POKER_GAME_LAST_RAISE]));
			format(_format, 2048, "%sEnter the amount of chips you wish to\nraise below and click on '{FF9900}Raise{A9C4E4}' to \nproceed, if you have changed your mind\nclick on '{FF9900}Cancel{A9C4E4}'.", _format);
			ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_INPUT, "Texas Hold 'em Poker - Raise", _format, "Raise", "Cancel");
			SetPVarInt(playerid, "PokerDialog", _: RAISE);
		}

		case RAISE_INVALID_NUMBER:
		{
			format(_format, 2048, "Hi {FF9900}%s{A9C4E4},\n\nBy raising you're increasing the existing\nbet to an amount you're willing to pay.\n\n", Pkr_GetClientName(playerid));
			format(_format, 2048, "%s{D10047}You have entered an invalid number, please enter\na valid amount of chips you wish to raise.{A9C4E4}\n\n", _format);
			format(_format, 2048, "%sYour Chips: {00AD43}$%s{A9C4E4}.\nCurrent Bet: {00AD43}$%s{A9C4E4}.\n", _format, Pkr_FormatNumber(g_rgPokerGames[game][PLAYER_CHIPS][_slot]), Pkr_FormatNumber(g_rgPokerGames[game][E_POKER_GAME_LAST_RAISE]));
			format(_format, 2048, "%sEnter the amount of chips you wish to\nraise below and click on '{FF9900}Raise{A9C4E4}' to \nproceed, if you have changed your mind\nclick on '{FF9900}Cancel{A9C4E4}'.", _format);
			ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_INPUT, "Texas Hold 'em Poker - Raise", _format, "Raise", "Cancel");
			SetPVarInt(playerid, "PokerDialog", _: RAISE);
		}

		case RIASE:
		{
			format(_format, 2048, "Hi {FF9900}%s{A9C4E4},\n\nBy raising you're increasing the existing\nbet to an amount you're willing to pay.\n\n", Pkr_GetClientName(playerid));
			format(_format, 2048, "%s{D10047}You cannot afford to raise that much, please enter\na valid amount of chips you wish to raise.{A9C4E4}\n\n", _format);
			format(_format, 2048, "%sYour Chips: {00AD43}$%s{A9C4E4}.\nCurrent Bet: {00AD43}$%s{A9C4E4}.\n", _format, Pkr_FormatNumber(g_rgPokerGames[game][PLAYER_CHIPS][_slot]), Pkr_FormatNumber(g_rgPokerGames[game][E_POKER_GAME_LAST_RAISE]));
			format(_format, 2048, "%sEnter the amount of chips you wish to\nraise below and click on '{FF9900}Raise{A9C4E4}' to \nproceed, if you have changed your mind\nclick on '{FF9900}Cancel{A9C4E4}'.", _format);
			ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_INPUT, "Texas Hold 'em Poker - Raise", _format, "Raise", "Cancel");
			SetPVarInt(playerid, "PokerDialog", _: RAISE);
		}

		case E_POKER_DIALOG_RAISE_LASTB:
		{
			format(_format, 2048, "Hi {FF9900}%s{A9C4E4},\n\nBy raising you're increasing the existing\nbet to an amount you're willing to pay.\n\n", Pkr_GetClientName(playerid));
			format(_format, 2048, "%s{D10047}Your raise must meet the last bet, please enter\na valid amount of chips you wish to raise.{A9C4E4}\n\n", _format);
			format(_format, 2048, "%sYour Chips: {00AD43}$%s{A9C4E4}.\nCurrent Bet: {00AD43}$%s{A9C4E4}.\n", _format, Pkr_FormatNumber(g_rgPokerGames[game][PLAYER_CHIPS][_slot]), Pkr_FormatNumber(g_rgPokerGames[game][E_POKER_GAME_LAST_RAISE]));
			format(_format, 2048, "%sEnter the amount of chips you wish to\nraise below and click on '{FF9900}Raise{A9C4E4}' to \nproceed, if you have changed your mind\nclick on '{FF9900}Cancel{A9C4E4}'.", _format);
			ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_INPUT, "Texas Hold 'em Poker - Raise", _format, "Raise", "Cancel");
			SetPVarInt(playerid, "PokerDialog", _: RAISE);
		}

		case E_POKER_DIALOG_RAISE_CONFIRM:
		{
			new _sitcash = GetPVarInt(playerid, "Pkr_SitCash");
			format(_format, sizeof(_format), "Thank you {FF9900}%s{A9C4E4},\n\nBefore you raise we would like to confirm the\namount of chips you wish to raise with.\n\n", Pkr_GetClientName(playerid));
			format(_format, sizeof(_format), "%sYour chosen chips: {00AD43}$%s{A9C4E4}.\nCash before this confirmation: {00AD43}$%s{A9C4E4}.\nCash after this confirmation: {00AD43}$%s{A9C4E4}.\n\nTo go ahead and confirm this click on '{FF9900}Confirm{A9C4E4}'\nor if you wish to go back click on '{FF9900}Back{A9C4E4}'.", _format, Pkr_FormatNumber(_sitcash), Pkr_FormatNumber(GetPlayerRealMoney(playerid)), Pkr_FormatNumber(GetPlayerRealMoney(playerid) - _sitcash));
			ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_MSGBOX, "Texas Hold 'em Poker - Raise", _format, "Raise", "Back");
			SetPVarInt(playerid, "PokerDialog", _: RAISE_CONFIRM);
		}

		case E_POKER_DIALOG_CALL_CONFIRM:
		{
            new _activePlayer = g_rgPokerGames[game][E_POKER_GAME_CURRENT_PLAYER];
            new _playerid = g_rgPokerGames[game][E_POKER_GAME_PLAYERS_ON][_activePlayer];

            new _amount = g_rgPokerGames[game][E_POKER_GAME_LAST_RAISE] - GetPVarInt(_playerid, "PokerRaiseContribution");
			format(_format, sizeof(_format), "Thank you {FF9900}%s{A9C4E4},\n\nBefore you call we would like to confirm the\namount of chips you wish to call.\n\n", Pkr_GetClientName(playerid));
			if(_amount >= g_rgPokerGames[game][PLAYER_CHIPS][_slot])
				format(_format, sizeof(_format), "Due to the previous bet being greater than or equal to\nthe amount of chips you have, you're required to go all in.");
			else
				format(_format, sizeof(_format), "%sCash before this confirmation: {00AD43}$%s{A9C4E4}.\nCash after this confirmation: {00AD43}$%s{A9C4E4}.\nTotal to call: {00AD43}$%s{A9C4E4}.\n\n", _format, Pkr_FormatNumber(g_rgPokerGames[game][PLAYER_CHIPS][_activePlayer]), Pkr_FormatNumber(g_rgPokerGames[game][PLAYER_CHIPS][_activePlayer] - _amount), Pkr_FormatNumber(_amount));
			format(_format, sizeof(_format), "%sTo go ahead and confirm this click on '{FF9900}Call{A9C4E4}'\nor if you wish to go back click on '{FF9900}Back{A9C4E4}'.", _format);
			ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_MSGBOX, "Texas Hold 'em Poker - Call", _format, "Call", "Back");
			SetPVarInt(playerid, "PokerDialog", _: CALL_CONFIRM);
		}
	}
	return 1;
}
