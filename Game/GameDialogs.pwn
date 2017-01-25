enum RAISE_DIALOG_ERROR
{
    NAN,
    NO_MONEY,
    LAST_BET,
    NONE
};

enum BET_DIALOG_ERROR
{
    NAN,
    NO_MONEY,
	ZERO,
    NONE
};

stock Pkr_GameShowBetDialog(const playerid, const BET_DIALOG_ERROR: error = BET_DIALOG_ERROR: NONE)
{
    new _format[2048];

    format(_format, 2048, "Hi {FF9900}%s{A9C4E4},\n\nBy betting you're adding chips to the pot\nof an amount you're willing to pay.\n\n", Pkr_GetClientName(playerid));

    switch(error)
    {
        case (BET_DIALOG_ERROR: NAN):
            format(_format, 2048, "%s{D10047}You have entered an invalid number, please enter\na valid amount of chips you wish to bet.{A9C4E4}\n\n", _format);
        case (BET_DIALOG_ERROR: NO_MONEY):
            format(_format, 2048, "%s{D10047}You cannot afford to bet that much, please enter\na valid amount of chips you wish to bet.{A9C4E4}\n\n", _format);
		case (BET_DIALOG_ERROR: ZERO):
			format(_format, 2048, "%s{D10047}You cannot bet with $0, please enter\na valid amount of chips you wish to bet.{A9C4E4}\n\n", _format);
    }

    format(_format, 2048, "%sEnter the amount of chips you wish to\nbet below and click on '{FF9900}Bet{A9C4E4}' to \nproceed, if you have changed your mind\nclick on '{FF9900}Cancel{A9C4E4}'.", _format);
    Pkr_SetPokerDialog(playerid, POKER_DIALOGS: BET);
    ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_INPUT, "Texas Hold 'em Poker - Bet", _format, "Bet", "Cancel");
	Pkr_HideCursorForPlayerId(playerid);
    return;
}

stock Pkr_GameShowBetConfirmDialog(const playerid)
{
    new _format[2048];
    new _gameId = Pkr_GetPlayerGame(playerid);
    new _slot = Pkr_GetCurrentPlayerPosition(_gameId);
    new _betAmount = GetPVarInt(playerid, POKER_PLAYER_BET_AMOUNT_VAR);

    new _playerChips = Pkr_GetPlayerChips(_gameId, _slot) - _betAmount;

    format(_format, sizeof(_format), "Thank you {FF9900}%s{A9C4E4},\n\nBefore you bet we would like to confirm the\namount of chips you wish to bet with.\n\n", Pkr_GetClientName(playerid));
    format(_format, sizeof(_format), "%sYour chosen chips: {00AD43}$%s{A9C4E4}.\nCash before this confirmation: {00AD43}$%s{A9C4E4}.\nCash after this confirmation: {00AD43}$%s{A9C4E4}.\n\nTo go ahead and confirm this click on '{FF9900}Confirm{A9C4E4}'\nor if you wish to go back click on '{FF9900}Back{A9C4E4}'.", _format, Pkr_FormatNumber(_betAmount), Pkr_FormatNumber(Pkr_GetPlayerChips(_gameId, _slot)), Pkr_FormatNumber(_playerChips));
    ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_MSGBOX, "Texas Hold 'em Poker - Bet Confirm", _format, "Confirm", "Back");
	Pkr_HideCursorForPlayerId(playerid);
	Pkr_SetPokerDialog(playerid, POKER_DIALOGS: BET_CONFIRM);
    return;
}

stock Pkr_GameShowRaiseDialog(const playerid, const gameId, const RAISE_DIALOG_ERROR: error = RAISE_DIALOG_ERROR: NONE)
{
    new _format[2048];
    new _slot = Pkr_GetCurrentPlayerPosition(gameId);

    format(_format, 2048, "Hi {FF9900}%s{A9C4E4},\n\nBy raising you're increasing the existing\nbet to an amount you're willing to pay.\n\n", Pkr_GetClientName(playerid));

    switch(error)
    {
        case (RAISE_DIALOG_ERROR: NAN):
            format(_format, 2048, "%s{D10047}You have entered an invalid number, please enter\na valid amount of chips you wish to raise.{A9C4E4}\n\n", _format);
        case (RAISE_DIALOG_ERROR: NO_MONEY):
            format(_format, 2048, "%s{D10047}You cannot afford to raise that much, please enter\na valid amount of chips you wish to raise.{A9C4E4}\n\n", _format);
        case (RAISE_DIALOG_ERROR: LAST_BET):
            format(_format, 2048, "%s{D10047}Your raise must meet the last bet, please enter\na valid amount of chips you wish to raise.{A9C4E4}\n\n", _format);
    }

    format(_format, 2048, "%sYour Chips: {00AD43}$%s{A9C4E4}.\nMinimum raise: {00AD43}$%s{A9C4E4}.\n", _format, Pkr_FormatNumber(Pkr_GetPlayerChips(gameId, _slot)), Pkr_FormatNumber(Pkr_GetLastBet(gameId)));
    format(_format, 2048, "%sEnter the amount of chips you wish to\nraise below and click on '{FF9900}Raise{A9C4E4}' to \nproceed, if you have changed your mind\nclick on '{FF9900}Cancel{A9C4E4}'.", _format);
    Pkr_SetPokerDialog(playerid, POKER_DIALOGS: RAISE);
    ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_INPUT, "Texas Hold 'em Poker - Raise", _format, "Raise", "Cancel");
	Pkr_HideCursorForPlayerId(playerid);
    return;
}

stock Pkr_GameShowRaiseConfirmDialog(const playerid)
{
    new _format[2048];
    new _gameId = Pkr_GetPlayerGame(playerid);
    new _slot = Pkr_GetCurrentPlayerPosition(_gameId);

    new _inputAmount = GetPVarInt(playerid, POKER_PLAYER_RAISE_AMOUNT_VAR);
    new _amountToMeet = Pkr_GetCurrentBet(_gameId) - Pkr_GetPlayerBetContribution(_gameId, _slot);
    new _raiseAmount = _inputAmount + _amountToMeet;
    new _playerChips = Pkr_GetPlayerChips(_gameId, _slot) - _raiseAmount;

    format(_format, sizeof(_format), "Thank you {FF9900}%s{A9C4E4},\n\nBefore you raise we would like to confirm the\namount of chips you wish to raise with.\n\n", Pkr_GetClientName(playerid));
    format(_format, sizeof(_format), "%sYour chosen chips: {00AD43}$%s{A9C4E4}.\nCash before this confirmation: {00AD43}$%s{A9C4E4}.\nCash after this confirmation: {00AD43}$%s{A9C4E4}.\n\nTo go ahead and confirm this click on '{FF9900}Confirm{A9C4E4}'\nor if you wish to go back click on '{FF9900}Back{A9C4E4}'.", _format, Pkr_FormatNumber(_raiseAmount), Pkr_FormatNumber(Pkr_GetPlayerChips(_gameId, _slot)), Pkr_FormatNumber(_playerChips));
    ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_MSGBOX, "Texas Hold 'em Poker - Raise Confirm", _format, "Raise", "Back");
    Pkr_SetPokerDialog(playerid, POKER_DIALOGS: RAISE_CONFIRM);
	Pkr_HideCursorForPlayerId(playerid);
    return;
}

stock Pkr_GameShowCallConfirmDialog(const playerid, const gameId)
{
    new _playerSlot = Pkr_GetCurrentPlayerPosition(gameId);
    new _format[2048];
    new _currentBet = Pkr_GetCurrentBet(gameId) - Pkr_GetPlayerBetContribution(gameId, _playerSlot);

    format(_format, sizeof(_format), "Thank you {FF9900}%s{A9C4E4},\n\nBefore you call we would like to confirm the\namount of chips you wish to call.\n\n", Pkr_GetClientName(playerid));
    format(_format, sizeof(_format), "%sCash before this confirmation: {00AD43}$%s{A9C4E4}.\nCash after this confirmation: {00AD43}$%s{A9C4E4}.\nTotal to call: {00AD43}$%s{A9C4E4}.\n\n", _format, Pkr_FormatNumber(Pkr_GetPlayerChips(gameId, _playerSlot)), Pkr_FormatNumber(Pkr_GetPlayerChips(gameId, _playerSlot) - _currentBet), Pkr_FormatNumber(_currentBet));
    format(_format, sizeof(_format), "%sTo go ahead and confirm this click on '{FF9900}Call{A9C4E4}'\nor if you wish to go back click on '{FF9900}Back{A9C4E4}'.", _format);
    ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_MSGBOX, "Texas Hold 'em Poker - Call", _format, "Call", "Back");
    Pkr_SetPokerDialog(playerid, POKER_DIALOGS: CALL_CONFIRM);
	Pkr_HideCursorForPlayerId(playerid);
    return;
}

stock Pkr_GameShowCheckConfirmDialog(const playerid)
{
    new _format[2048];
    format(_format, sizeof(_format), "Thank you {FF9900}%s{A9C4E4},\n\nBefore you check we would like you to confirm.\n\n", Pkr_GetClientName(playerid));
    format(_format, sizeof(_format), "%sTo go ahead and confirm this click on '{FF9900}Check{A9C4E4}'\nor if you wish to cancel click on '{FF9900}Back{A9C4E4}'.", _format);
    ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_MSGBOX, "Texas Hold 'em Poker - Check", _format, "Check", "Back");
    Pkr_SetPokerDialog(playerid, POKER_DIALOGS: CHECK_CONFIRM);
	Pkr_HideCursorForPlayerId(playerid);
    return;
}

stock Pkr_GameShowFoldDialog(const playerid) {
	ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_MSGBOX, "Texas Hold 'em Poker - Fold", "Are you sure you wish to fold?", "Fold", "Cancel");
	Pkr_SetPokerDialog(playerid, POKER_DIALOGS: FOLD_CONFIRM);
	Pkr_HideCursorForPlayerId(playerid);
	return;
}

stock Pkr_GameShowAllInDialog(const playerid) {
	ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_MSGBOX, "Texas Hold 'em Poker - All In", "Are you sure you wish to go all in?", "All In", "Cancel");
	Pkr_SetPokerDialog(playerid, POKER_DIALOGS: ALL_IN_CONFIRM);
	Pkr_HideCursorForPlayerId(playerid);
	return;
}
