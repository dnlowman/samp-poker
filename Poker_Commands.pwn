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

Pkr_RouteCommands(playerid, cmdtext[])
{
    new command[16];
    new parameters[112];
    sscanf(cmdtext, "s[16]s[112]", command, parameters);

	if(strlen(command) == 0) {
		SendClientMessage(playerid, COLOR_GREY, "USAGE: /pkr [command]");
		SendClientMessage(playerid, COLOR_GREY, "Hint: Use '/pkr help' for the full list of commands.");
		return 1;
	}

    if(strcmp("join", command) == 0) PkrCMD_Join(playerid);
    else if(strcmp("leave", command) == 0) PkrCMD_Leave(playerid);
	else if(strcmp("mouse", command) == 0) PkrCMD_Mouse(playerid);
    else if(strcmp("start", command) == 0) PkrCMD_Start(playerid);
	else if(strcmp("nexthand", command) == 0) PkrCMD_NextHand(playerid);
	#if defined POKER_DEBUG
    else if(strcmp("stats", command) == 0) PkrCMD_Stats(playerid, parameters);
	else if(strcmp("destroy", command) == 0) PkrCMD_Destroy(playerid, parameters);
	else if(strcmp("dealplayer", command) == 0) PkrCMD_DealPlayer(playerid, parameters);
	else if(strcmp("dealtable", command) == 0) PkrCMD_DealTable(playerid, parameters);
	else if(strcmp("addbot", command) == 0) PkrCMD_AddBot(playerid, parameters);
	else if(strcmp("removebot", command) == 0) PkrCMD_RemoveBot(playerid, parameters);
	#endif
	else if(strcmp("spec", command) == 0) PkrCMD_Spectate(playerid);
	else if(strcmp("cam", command) == 0) PkrCMD_Camera(playerid);
	else if(strcmp("sit", command) == 0) PkrCMD_Sit(playerid);
	else if(strcmp("stand", command) == 0) PkrCMD_Stand(playerid);
	else if(strcmp("blind", command) == 0) PkrCMD_SetBlind(playerid, parameters);
    else if(strcmp("blinds", command) == 0) PkrCMD_SetBlind(playerid, parameters);
	else if(strcmp("chips", command) == 0) PkrCMD_Chips(playerid);
	else if(strcmp("rake", command) == 0) PkrCMD_SetRake(playerid, parameters);
	else if(strcmp("timer", command) == 0) PkrCMD_SetTimer(playerid, parameters);
	else if(strcmp("help", command) == 0) PkrCMD_Help(playerid);
	return 1;
}

CMD:pkr(playerid, cmdtext[])
{
	Pkr_RouteCommands(playerid, cmdtext);
	return 1;
}

CMD:poker(playerid, cmdtext[])
{
	Pkr_RouteCommands(playerid, cmdtext);
	return 1;
}

#if defined POKER_DEBUG

PkrCMD_DealPlayer(const playerid, const parameters[]) {
	new gameId;
	new slot;
	new cardSlot;
	new card;

	if(sscanf(parameters, "iiii", gameId, slot, cardSlot, card)) {
		SendClientMessage(playerid, COLOR_GREY, "DEBUG USAGE: /pkr dealplayer [gameId] [playerSlot] [cardSlot] [card]");
		return;
	}

	if(slot < 0 || slot >= MAX_POKER_PLAYERS) {
		SendClientMessage(playerid, COLOR_GREY, "The player slot has to be 0 - 5");
		return;
	}

	if(cardSlot != 0 && cardSlot != 1) {
		SendClientMessage(playerid, COLOR_GREY, "The card slot has to be 0 or 1");
		return;
	}

	if(card < 0 || card >= MAX_POKER_DECK_CARDS) {
		SendClientMessage(playerid, COLOR_GREY, "The card has to be 0 to 51");
		return;
	}

	new cardValue = g_rgCardDeck[card];

	if(cardSlot == 0) {
		Pkr_SetPlayerCardOneValue(gameId, slot, cardValue);
		Pkr_SetPlayerCardOneTextDraw(gameId, slot, Pkr_ReturnCardSpriteName(cardValue));
	}
	else {
		Pkr_SetPlayerCardTwoValue(gameId, slot, cardValue);
		Pkr_SetPlayerCardTwoTextDraw(gameId, slot, Pkr_ReturnCardSpriteName(cardValue));
	}

	SendClientMessage(playerid, COLOR_GREY, "Dealt the card to that player!");
	return;
}

PkrCMD_DealTable(const playerid, const parameters[]) {
	new gameId;
	new tableSlot;
	new card;

	if(sscanf(parameters, "iii", gameId, tableSlot, card)) {
		SendClientMessage(playerid, COLOR_GREY, "DEBUG USAGE: /pkr dealtable [gameId] [tableSlot] [card]");
		return;
	}

	if(tableSlot < 0 || tableSlot >= 5) {
		SendClientMessage(playerid, COLOR_GREY, "The table slot has to be 0 - 5.");
		return;
	}

	if(card < 0 || card >= MAX_POKER_DECK_CARDS) {
		SendClientMessage(playerid, COLOR_GREY, "The card has to be 0 to 51");
		return;
	}

	new cardValue = g_rgCardDeck[card];

	Pkr_SetTableCardValue(gameId, tableSlot, cardValue);
	Pkr_SetTableCardTextDraw(gameId, tableSlot, Pkr_ReturnCardSpriteName(cardValue));

	return;
}

#endif
