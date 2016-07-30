enum SIT_DIALOG_ERROR
{
    NONE,
    NAN,
    NO_MONEY,
    BLINDS
};

Pkr_PlayerShowDialog(const playerid, const gameId, const SIT_DIALOG_ERROR: error = SIT_DIALOG_ERROR: NONE)
{
    new _format[2048];

    format(_format, 2048, "Welcome {FF9900}%s{A9C4E4},\n\nIn order to sit at this table you're required to\nsit with some chips. Please ensure you sit with\na comfortable amount as this will aid your game\nexperience.\n\n", Pkr_GetClientName(playerid));

    switch(error)
    {
        case (SIT_DIALOG_ERROR: NAN):
            format(_format, 2048, "%s{D10047}You have entered an invalid number, please enter\na valid amount of chips you wish to sit with.{A9C4E4}\n\n", _format);
        case (SIT_DIALOG_ERROR: NO_MONEY):
            format(_format, 2048, "%s{D10047}You cannot afford that many chips, please enter\na valid amount of chips you wish to sit with.{A9C4E4}\n\n", _format);
        case (SIT_DIALOG_ERROR: BLINDS):
            format(_format, 2048, "%s{D10047}You cannot meet the blinds with that amount,\nplease enter a valid amount of chips you wish\nto sit with.{A9C4E4}\n\n", _format);
    }

    format(_format, 2048, "%sYour cash: {00AD43}$%s{A9C4E4}.\nAverage Player Chips: {00AD43}$%.1f{A9C4E4}.\nBig Blind Amount: {00AD43}$%s{A9C4E4}.\nSmall Blind Amount: {00AD43}$%s{A9C4E4}.\nNumber of players: %i/6.", _format, Pkr_FormatNumber(GetPlayerRealMoney(playerid)), Pkr_ReturnAverageChips(gameId), Pkr_FormatNumber((g_rgPokerGames[gameId][BLIND] << 1)), Pkr_FormatNumber(g_rgPokerGames[gameId][BLIND]), Pkr_GetAmountOfPlayersOnGame(gameId));
    format(_format, 2048, "%s\n\nEnter the amount of chips you wish to sit with\nbelow then click on '{FF9900}Sit{A9C4E4}' to proceed. If you\nwish to leave the table click on '{FF9900}Leave{A9C4E4}'.", _format);
    SetPVarInt(playerid, "Pkr_SitGameId", gameId);
    Pkr_SetPokerDialog(playerid, POKER_DIALOGS: SIT);
    ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_INPUT, "Texas Hold 'em Poker - Sit", _format, "Sit", "Leave");

    return;
}

Pkr_PlayerShowConfirmDialog(const playerid)
{
    new _format[2048];
    new _sitcash = GetPVarInt(playerid, "Pkr_SitCash");
    format(_format, sizeof(_format), "Thank you {FF9900}%s{A9C4E4},\n\nBefore you sit we would like to confirm the\namount of chips you wish to sit with.\n\n", Pkr_GetClientName(playerid));
    format(_format, sizeof(_format), "%sYour chosen chips: {00AD43}$%s{A9C4E4}.\nCash before this confirmation: {00AD43}$%s{A9C4E4}.\nCash after this confirmation: {00AD43}$%s{A9C4E4}.\n\nTo go ahead and confirm this click on '{FF9900}Sit{A9C4E4}'\nor if you wish to go back click on '{FF9900}Back{A9C4E4}'.", _format, Pkr_FormatNumber(_sitcash), Pkr_FormatNumber(GetPlayerRealMoney(playerid)), Pkr_FormatNumber(GetPlayerRealMoney(playerid) - _sitcash));
    ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_MSGBOX, "Texas Hold 'em Poker", _format, "Sit", "Back");
    Pkr_SetPokerDialog(playerid, POKER_DIALOGS: SIT_CONFIRM);

    return;
}
