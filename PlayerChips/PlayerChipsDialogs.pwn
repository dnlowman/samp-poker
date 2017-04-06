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

enum PLAYER_CHIPS_DIALOG_ERROR {
	NONE,
	NAN,
	NO_MONEY
}

Pkr_ShowChipsDialog(const playerid, const PLAYER_CHIPS_DIALOG_ERROR: error = PLAYER_CHIPS_DIALOG_ERROR: NONE)
{
    Pkr_SetPokerDialog(playerid, POKER_DIALOGS: CHIPS);

	new message[2048];
    format(message, sizeof(message), "Hey {FF9900}%s{A9C4E4},\n\nPlease insert an amount of chips you\nwishto add to your stack below.\n\nPlease ensure you add an amount\nwhich will allow you to meet the\nblinds.\n\n", Pkr_GetClientName(playerid));

	switch(error)
    {
        case (PLAYER_CHIPS_DIALOG_ERROR: NAN):
            format(message, sizeof(message), "%s{D10047}You have entered an invalid number.\nPlease enter a valid amount of chips\nyou wish to add.{A9C4E4}\n\n", message);
        case (PLAYER_CHIPS_DIALOG_ERROR: NO_MONEY):
            format(message, sizeof(message), "%s{D10047}You cannot afford that many chips.\nPlease enter\na valid amount of chips\nyou wish to add.{A9C4E4}\n\n", message);
    }

	ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_INPUT, "Texas Hold 'em Poker - Add Chips", message, "Buy", "Cancel");
	Pkr_HideCursorForPlayerId(playerid);
    return;
}

Pkr_ShowChipsConfirmDialog(const playerid, const amount)
{
	new message[2048];
	SetPVarInt(playerid, POKER_CHIPS_VAR_NAME, amount);
	Pkr_SetPokerDialog(playerid, POKER_DIALOGS: CHIPS_CONFIRM);
	format(message, sizeof(message), "Are you sure you wish to add $%s chips to your stack?", Pkr_FormatNumber(amount));
    ShowPlayerDialog(playerid, POKER_DIALOG_ID, DIALOG_STYLE_MSGBOX, "Texas Hold 'em Poker - Add Chips Confirm", message, "Confirm", "Back");
    return;
}
