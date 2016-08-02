#define Pkr_ShowPlayerMenu(%0,%1); \
            for(new i; i < MAX_POKER_MENU_ITEMS; ++i) TextDrawShowForPlayer(%0, gPokerGameInfo[%1][E_POKER_GAME_MENU_ITEMS][i]);

#define Pkr_HidePlayerMenu(%0,%1); \
            for(new i; i < MAX_POKER_MENU_ITEMS; ++i) TextDrawHideForPlayer(%0, gPokerGameInfo[%1][E_POKER_GAME_MENU_ITEMS][i]);

#define Pkr_ShowPlayerReady(%0,%1); \
            for(new i; i < 6; ++i) TextDrawShowForPlayer(%0, gPokerGameInfo[%1][E_POKER_GAME_PLAYERS_READY][i]);

#define Pkr_HidePlayerReady(%0,%1); \
            for(new i; i < 6; ++i) TextDrawHideForPlayer(%0, gPokerGameInfo[%1][E_POKER_GAME_PLAYERS_READY][i]);

Pkr_DestroyBGTextDraws()
{
	for(new i; i < 7; ++i)
	{
		TextDrawDestroy(gPokerBG[i]);
		gPokerBG[i] = Text:INVALID_TEXT_DRAW;
	}
}

Pkr_CreateBGTextDraws()
{
	gPokerBG[0] = TextDrawCreate(202.000000, 266.000000, "_");
	TextDrawBackgroundColor(gPokerBG[0], 255);
	TextDrawFont(gPokerBG[0], 0);
	TextDrawLetterSize(gPokerBG[0], 1.500000, 4.400000);
	TextDrawColor(gPokerBG[0], -1);
	TextDrawSetOutline(gPokerBG[0], 0);
	TextDrawSetProportional(gPokerBG[0], 1);
	TextDrawSetShadow(gPokerBG[0], 1);
	TextDrawUseBox(gPokerBG[0], 1);
	TextDrawBoxColor(gPokerBG[0], 255);
	TextDrawTextSize(gPokerBG[0], 264.000000, 50.000000);
	TextDrawSetSelectable(gPokerBG[0], 0);

	gPokerBG[1] = TextDrawCreate(150.000000, 203.000000, "_");
	TextDrawBackgroundColor(gPokerBG[1], 255);
	TextDrawFont(gPokerBG[1], 0);
	TextDrawLetterSize(gPokerBG[1], 1.500000, 4.400000);
	TextDrawColor(gPokerBG[1], -1);
	TextDrawSetOutline(gPokerBG[1], 0);
	TextDrawSetProportional(gPokerBG[1], 1);
	TextDrawSetShadow(gPokerBG[1], 1);
	TextDrawUseBox(gPokerBG[1], 1);
	TextDrawBoxColor(gPokerBG[1], 255);
	TextDrawTextSize(gPokerBG[1], 212.000000, 50.000000);
	TextDrawSetSelectable(gPokerBG[1], 0);

	gPokerBG[2] = TextDrawCreate(202.000000, 140.000000, "_");
	TextDrawBackgroundColor(gPokerBG[2], 255);
	TextDrawFont(gPokerBG[2], 0);
	TextDrawLetterSize(gPokerBG[2], 1.500000, 4.400000);
	TextDrawColor(gPokerBG[2], -1);
	TextDrawSetOutline(gPokerBG[2], 0);
	TextDrawSetProportional(gPokerBG[2], 1);
	TextDrawSetShadow(gPokerBG[2], 1);
	TextDrawUseBox(gPokerBG[2], 1);
	TextDrawBoxColor(gPokerBG[2], 255);
	TextDrawTextSize(gPokerBG[2], 264.000000, 50.000000);
	TextDrawSetSelectable(gPokerBG[2], 0);

	gPokerBG[3] = TextDrawCreate(376.000000, 140.000000, "_");
	TextDrawBackgroundColor(gPokerBG[3], 255);
	TextDrawFont(gPokerBG[3], 0);
	TextDrawLetterSize(gPokerBG[3], 1.500000, 4.400000);
	TextDrawColor(gPokerBG[3], -1);
	TextDrawSetOutline(gPokerBG[3], 0);
	TextDrawSetProportional(gPokerBG[3], 1);
	TextDrawSetShadow(gPokerBG[3], 1);
	TextDrawUseBox(gPokerBG[3], 1);
	TextDrawBoxColor(gPokerBG[3], 255);
	TextDrawTextSize(gPokerBG[3], 438.000000, 60.000000);
	TextDrawSetSelectable(gPokerBG[3], 0);

	gPokerBG[4] = TextDrawCreate(433.000000, 203.000000, "_");
	TextDrawBackgroundColor(gPokerBG[4], 255);
	TextDrawFont(gPokerBG[4], 0);
	TextDrawLetterSize(gPokerBG[4], 1.500000, 4.400000);
	TextDrawColor(gPokerBG[4], -1);
	TextDrawSetOutline(gPokerBG[4], 0);
	TextDrawSetProportional(gPokerBG[4], 1);
	TextDrawSetShadow(gPokerBG[4], 1);
	TextDrawUseBox(gPokerBG[4], 1);
	TextDrawBoxColor(gPokerBG[4], 255);
	TextDrawTextSize(gPokerBG[4], 495.000000, 50.000000);
	TextDrawSetSelectable(gPokerBG[4], 0);

	gPokerBG[5] = TextDrawCreate(376.000000, 266.000000, "_");
	TextDrawBackgroundColor(gPokerBG[5], 255);
	TextDrawFont(gPokerBG[5], 0);
	TextDrawLetterSize(gPokerBG[5], 1.500000, 4.400000);
	TextDrawColor(gPokerBG[5], -1);
	TextDrawSetOutline(gPokerBG[5], 0);
	TextDrawSetProportional(gPokerBG[5], 1);
	TextDrawSetShadow(gPokerBG[5], 1);
	TextDrawUseBox(gPokerBG[5], 1);
	TextDrawBoxColor(gPokerBG[5], 255);
	TextDrawTextSize(gPokerBG[5], 438.000000, 50.000000);
	TextDrawSetSelectable(gPokerBG[5], 0);

	gPokerBG[6] = TextDrawCreate(236.000000, 203.000000, "_");
	TextDrawBackgroundColor(gPokerBG[6], 255);
	TextDrawFont(gPokerBG[6], 0);
	TextDrawLetterSize(gPokerBG[6], 1.500000, 4.400000);
	TextDrawColor(gPokerBG[6], -1);
	TextDrawSetOutline(gPokerBG[6], 0);
	TextDrawSetProportional(gPokerBG[6], 1);
	TextDrawSetShadow(gPokerBG[6], 1);
	TextDrawUseBox(gPokerBG[6], 1);
	TextDrawBoxColor(gPokerBG[6], 255);
	TextDrawTextSize(gPokerBG[6], 394.000000, 50.000000);
	TextDrawSetSelectable(gPokerBG[6], 0);
}

Pkr_ShowPlayerTextDraws(playerid, game)
{
	if(Pkr_IsValidGame(game))
	{
		new _i;
		for(_i = 0; _i < 7; ++_i) TextDrawShowForPlayer(playerid, gPokerBG[_i]);
		for(_i = 0; _i < MAX_POKER_PLAYERS; ++_i)
		{
			TextDrawShowForPlayer(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][_i]);
			TextDrawShowForPlayer(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][_i]);
			TextDrawShowForPlayer(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][_i]);
			TextDrawShowForPlayer(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][_i]);
		}
		TextDrawShowForPlayer(playerid, gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][0]);
		TextDrawShowForPlayer(playerid, gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][1]);
		TextDrawShowForPlayer(playerid, gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][2]);
		TextDrawShowForPlayer(playerid, gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][3]);
		TextDrawShowForPlayer(playerid, gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][4]);
		TextDrawShowForPlayer(playerid, gPokerGameInfo[game][E_POKER_GAME_POT]);
		TextDrawShowForPlayer(playerid, gPokerGameInfo[game][E_POKER_GAME_BLINDS]);
		return 1;
	}
	return 0;
}

Pkr_HidePlayerTextDraws(playerid, game)
{
	if(Pkr_IsValidGame(game))
	{
		new _i;
		for(_i = 0; _i < 7; ++_i) TextDrawHideForPlayer(playerid, gPokerBG[_i]);
		for(_i = 0; _i < MAX_POKER_PLAYERS; ++_i)
		{
			TextDrawHideForPlayer(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][_i]);
			TextDrawHideForPlayer(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][_i]);
			TextDrawHideForPlayer(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][_i]);
			TextDrawHideForPlayer(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][_i]);
		}
		TextDrawHideForPlayer(playerid, gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][0]);
		TextDrawHideForPlayer(playerid, gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][1]);
		TextDrawHideForPlayer(playerid, gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][2]);
		TextDrawHideForPlayer(playerid, gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][3]);
		TextDrawHideForPlayer(playerid, gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][4]);
		TextDrawHideForPlayer(playerid, gPokerGameInfo[game][E_POKER_GAME_POT]);
		TextDrawHideForPlayer(playerid, gPokerGameInfo[game][E_POKER_GAME_BLINDS]);
		return 1;
	}
	return 0;
}

Pkr_ShowPCardTextDraws(playerid, game)
{
	new _game = Pkr_ReturnPlayerGame(playerid);
	new _slot = Pkr_ReturnPlayerSlot(playerid, _game);
	if(Pkr_IsValidGame(_game) && Pkr_IsValidSlot(_game))
	{
		PlayerTextDrawShow(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][_slot]);
		PlayerTextDrawShow(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][_slot]);
		return 1;
	}
	return 0;
}

Pkr_HidePCardTextDraws(playerid, game)
{
	new _game = Pkr_ReturnPlayerGame(playerid);
	new _slot = Pkr_ReturnPlayerSlot(playerid, _game);
	if(Pkr_IsValidGame(_game) && Pkr_IsValidSlot(_game))
	{
		PlayerTextDrawHide(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][_slot]);
		PlayerTextDrawHide(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][_slot]);
		return 1;
	}
	return 0;
}

Pkr_CreateGameTextDraws(game)
{
	if(Pkr_IsValidGame(game))
	{
		/* Player Cards - ONE */
		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][0] = TextDrawCreate(202.000000, 266.000000, "_");
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][0], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][0], 4);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][0], 0.470000, 0.899999);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][0], -1);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][0], 0);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][0], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][0], 1);
		TextDrawUseBox(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][0], 1);
		TextDrawBoxColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][0], 255);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][0], 30.000000, 40.000000);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][0], 0);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][1] = TextDrawCreate(150.000000, 203.000000, "_");
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][1], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][1], 4);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][1], 0.470000, 0.899999);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][1], -1);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][1], 0);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][1], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][1], 1);
		TextDrawUseBox(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][1], 1);
		TextDrawBoxColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][1], 255);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][1], 30.000000, 40.000000);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][1], 0);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][2] = TextDrawCreate(202.000000, 140.000000, "_");
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][2], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][2], 4);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][2], 0.470000, 0.899999);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][2], -1);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][2], 0);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][2], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][2], 1);
		TextDrawUseBox(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][2], 1);
		TextDrawBoxColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][2], 255);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][2], 30.000000, 40.000000);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][2], 0);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][3] = TextDrawCreate(376.000000, 140.000000, "_");
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][3], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][3], 4);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][3], 0.470000, 0.899999);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][3], -1);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][3], 0);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][3], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][3], 1);
		TextDrawUseBox(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][3], 1);
		TextDrawBoxColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][3], 255);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][3], 30.000000, 40.000000);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][3], 0);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][4] = TextDrawCreate(433.000000, 203.000000, "_");
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][4], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][4], 4);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][4], 0.470000, 0.899999);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][4], -1);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][4], 0);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][4], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][4], 1);
		TextDrawUseBox(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][4], 1);
		TextDrawBoxColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][4], 255);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][4], 30.000000, 40.000000);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][4], 0);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][5] = TextDrawCreate(376.000000, 266.000000, "_");
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][5], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][5], 4);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][5], 0.470000, 0.899999);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][5], -1);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][5], 0);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][5], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][5], 1);
		TextDrawUseBox(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][5], 1);
		TextDrawBoxColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][5], 255);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][5], 30.000000, 40.000000);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][5], 0);

		/* Player Cards - TWO */
		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][0] = TextDrawCreate(234.000000, 266.000000, "_");
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][0], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][0], 4);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][0], 0.470000, 0.899999);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][0], -1);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][0], 0);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][0], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][0], 1);
		TextDrawUseBox(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][0], 1);
		TextDrawBoxColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][0], 255);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][0], 30.000000, 40.000000);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][0], 0);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][1] = TextDrawCreate(182.000000, 203.000000, "_");
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][1], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][1], 4);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][1], 0.470000, 0.899999);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][1], -1);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][1], 0);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][1], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][1], 1);
		TextDrawUseBox(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][1], 1);
		TextDrawBoxColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][1], 255);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][1], 30.000000, 40.000000);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][1], 0);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][2] = TextDrawCreate(234.000000, 140.000000, "_");
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][2], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][2], 4);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][2], 0.470000, 0.899999);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][2], -1);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][2], 0);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][2], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][2], 1);
		TextDrawUseBox(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][2], 1);
		TextDrawBoxColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][2], 255);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][2], 30.000000, 40.000000);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][2], 0);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][3] = TextDrawCreate(408.000000, 140.000000, "_");
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][3], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][3], 4);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][3], 0.470000, 0.899999);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][3], -1);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][3], 0);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][3], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][3], 1);
		TextDrawUseBox(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][3], 1);
		TextDrawBoxColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][3], 255);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][3], 30.000000, 40.000000);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][3], 0);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][4] = TextDrawCreate(465.000000, 203.000000, "_");
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][4], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][4], 4);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][4], 0.470000, 0.899999);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][4], -1);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][4], 0);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][4], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][4], 1);
		TextDrawUseBox(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][4], 1);
		TextDrawBoxColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][4], 255);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][4], 30.000000, 40.000000);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][4], 0);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][5] = TextDrawCreate(408.000000, 266.000000, "_");
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][5], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][5], 4);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][5], 0.470000, 0.899999);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][5], -1);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][5], 0);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][5], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][5], 1);
		TextDrawUseBox(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][5], 1);
		TextDrawBoxColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][5], 255);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][5], 30.000000, 40.000000);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][5], 0);

		/* Player Status */
		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][0] = TextDrawCreate(233.000000, 308.000000, "");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][0], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][0], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][0], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][0], 0.170000, 1.000000);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][0], -6749953);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][0], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][0], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][0], 0);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][0], 0);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][1] = TextDrawCreate(182.000000, 245.000000, "");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][1], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][1], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][1], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][1], 0.170000, 1.000000);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][1], -6749953);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][1], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][1], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][1], 0);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][1], 0);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][2] = TextDrawCreate(233.000000, 182.000000, "");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][2], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][2], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][2], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][2], 0.170000, 1.000000);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][2], -6749953);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][2], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][2], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][2], 0);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][2], 0);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][3] = TextDrawCreate(407.000000, 182.000000, "");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][3], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][3], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][3], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][3], 0.170000, 1.000000);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][3], -6749953);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][3], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][3], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][3], 0);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][3], 0);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][4] = TextDrawCreate(465.000000, 245.000000, "");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][4], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][4], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][4], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][4], 0.170000, 1.000000);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][4], -6749953);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][4], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][4], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][4], 0);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][4], 0);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][5] = TextDrawCreate(408.000000, 308.000000, "");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][5], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][5], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][5], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][5], 0.170000, 1.000000);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][5], -6749953);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][5], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][5], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][5], 0);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][5], 0);

		/* Player Chips */
		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][0] = TextDrawCreate(233.000000, 254.000000, "");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][0], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][0], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][0], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][0], 0.170000, 1.000000);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][0], -6749953);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][0], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][0], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][0], 0);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][0], 0);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][1] = TextDrawCreate(182.000000, 191.000000, "");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][1], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][1], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][1], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][1], 0.170000, 1.000000);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][1], -6749953);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][1], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][1], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][1], 0);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][1], 0);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][2] = TextDrawCreate(233.000000, 128.000000, "");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][2], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][2], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][2], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][2], 0.170000, 1.000000);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][2], -6749953);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][2], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][2], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][2], 0);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][2], 0);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][3] = TextDrawCreate(407.000000, 128.000000, "");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][3], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][3], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][3], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][3], 0.170000, 1.000000);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][3], -6749953);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][3], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][3], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][3], 0);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][3], 0);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][4] = TextDrawCreate(464.000000, 191.000000, "");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][4], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][4], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][4], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][4], 0.170000, 1.000000);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][4], -6749953);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][4], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][4], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][4], 0);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][4], 0);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][5] = TextDrawCreate(407.000000, 254.000000, "");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][5], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][5], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][5], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][5], 0.170000, 1.000000);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][5], -6749953);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][5], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][5], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][5], 0);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][5], 0);

		/* Player Ready */
		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][0] = TextDrawCreate(234.000000, 280.000000, "~w~EMPTY SEAT");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][0], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][0], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][0], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][0], 0.200000, 1.000000);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][0], 16711935);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][0], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][0], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][0], 0);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][0], 15, 84);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][0], 1);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][1] = TextDrawCreate(182.000000, 218.000000, "~w~EMPTY SEAT");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][1], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][1], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][1], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][1], 0.200000, 1.000000);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][1], 16711935);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][1], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][1], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][1], 0);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][1], 15, 84);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][1], 1);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][2] = TextDrawCreate(233.000000, 155.000000, "~w~EMPTY SEAT");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][2], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][2], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][2], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][2], 0.200000, 1.000000);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][2], 16711935);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][2], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][2], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][2], 0);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][2], 15, 84);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][2], 1);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][3] = TextDrawCreate(408.000000, 155.000000, "~w~EMPTY SEAT");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][3], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][3], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][3], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][3], 0.200000, 1.000000);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][3], 16711935);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][3], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][3], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][3], 0);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][3], 15, 84);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][3], 1);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][4] = TextDrawCreate(465.000000, 218.000000, "~w~EMPTY SEAT");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][4], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][4], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][4], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][4], 0.200000, 1.000000);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][4], 16711935);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][4], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][4], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][4], 0);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][4], 15, 84);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][4], 1);

		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][5] = TextDrawCreate(407.000000, 280.000000, "~w~EMPTY SEAT");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][5], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][5], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][5], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][5], 0.200000, 1.000000);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][5], 16711935);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][5], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][5], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][5], 0);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][5], 15, 84);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][5], 1);

		/* Table Cards */
		gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][0] = TextDrawCreate(236.000000, 203.000000, "_");
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][0], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][0], 4);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][0], 0.470000, 0.899999);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][0], -1);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][0], 0);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][0], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][0], 1);
		TextDrawUseBox(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][0], 1);
		TextDrawBoxColor(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][0], 255);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][0], 30.000000, 40.000000);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][0], 0);

		gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][1] = TextDrawCreate(268.000000, 203.000000, "_");
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][1], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][1], 4);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][1], 0.470000, 0.899999);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][1], -1);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][1], 0);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][1], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][1], 1);
		TextDrawUseBox(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][1], 1);
		TextDrawBoxColor(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][1], 255);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][1], 30.000000, 40.000000);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][1], 0);

		gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][2] = TextDrawCreate(300.000000, 203.000000, "_");
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][2], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][2], 4);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][2], 0.470000, 0.899999);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][2], -1);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][2], 0);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][2], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][2], 1);
		TextDrawUseBox(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][2], 1);
		TextDrawBoxColor(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][2], 255);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][2], 30.000000, 40.000000);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][2], 0);

		gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][3] = TextDrawCreate(332.000000, 203.000000, "_");
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][3], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][3], 4);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][3], 0.470000, 0.899999);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][3], -1);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][3], 0);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][3], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][3], 1);
		TextDrawUseBox(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][3], 1);
		TextDrawBoxColor(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][3], 255);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][3], 30.000000, 40.000000);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][3], 0);

		gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][4] = TextDrawCreate(364.000000, 203.000000, "_");
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][4], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][4], 4);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][4], 0.470000, 0.899999);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][4], -1);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][4], 0);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][4], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][4], 1);
		TextDrawUseBox(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][4], 1);
		TextDrawBoxColor(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][4], 255);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][4], 30.000000, 40.000000);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][4], 0);

		/* Menu Items */
		gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][0] = TextDrawCreate(315.000000, 270.000000, "ALL IN");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][0], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][0], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][0], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][0], 0.300000, 1.000000);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][0], -1);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][0], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][0], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][0], 0);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][0], 5, 64);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][0], 1);

		gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][1] = TextDrawCreate(315.000000, 281.000000, "CALL");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][1], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][1], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][1], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][1], 0.300000, 1.000000);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][1], -1);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][1], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][1], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][1], 0);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][1], 5, 64);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][1], 1);

		gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][2] = TextDrawCreate(315.000000, 292.000000, "FOLD");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][2], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][2], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][2], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][2], 0.300000, 1.000000);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][2], -1);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][2], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][2], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][2], 0);
		TextDrawTextSize(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][2], 5, 64);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][2], 1);

		gPokerGameInfo[game][E_POKER_GAME_POT] = TextDrawCreate(314.000000, 192.000000, "~w~ POT: ~g~$0");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_POT], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_POT], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_POT], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_POT], 0.139999, 0.799999);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_POT], -6749953);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_POT], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_POT], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_POT], 0);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_POT], 0);

		gPokerGameInfo[game][E_POKER_GAME_BLINDS] = TextDrawCreate(317.000000, 244.000000, "BLINDS: ~y~NOT SET ~w~/ ~y~NOT SET");
		TextDrawAlignment(gPokerGameInfo[game][E_POKER_GAME_BLINDS], 2);
		TextDrawBackgroundColor(gPokerGameInfo[game][E_POKER_GAME_BLINDS], 255);
		TextDrawFont(gPokerGameInfo[game][E_POKER_GAME_BLINDS], 2);
		TextDrawLetterSize(gPokerGameInfo[game][E_POKER_GAME_BLINDS], 0.210000, 1.300000);
		TextDrawColor(gPokerGameInfo[game][E_POKER_GAME_BLINDS], -1);
		TextDrawSetOutline(gPokerGameInfo[game][E_POKER_GAME_BLINDS], 1);
		TextDrawSetProportional(gPokerGameInfo[game][E_POKER_GAME_BLINDS], 1);
		TextDrawSetShadow(gPokerGameInfo[game][E_POKER_GAME_BLINDS], 1);
		TextDrawSetSelectable(gPokerGameInfo[game][E_POKER_GAME_BLINDS], 0);
		return 1;
	}
	return 0;
}

Pkr_DestroyGameTextDraws(game)
{
	if(Pkr_IsValidGame(game))
	{
		new _i;
		/* Player Cards - ONE */
		for(_i = 0; _i < MAX_POKER_PLAYERS; ++_i)
		{
			TextDrawDestroy(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][_i]);
			gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][_i] = Text:INVALID_TEXT_DRAW;
		}

		/* Player Cards - TWO */
		for(_i = 0; _i < MAX_POKER_PLAYERS; ++_i)
		{
			TextDrawDestroy(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][_i]);
			gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][_i] = Text:INVALID_TEXT_DRAW;
		}

		/* Ready */
		for(_i = 0; _i < MAX_POKER_PLAYERS; ++_i)
		{
			TextDrawDestroy(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][_i]);
			gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][_i] = Text:INVALID_TEXT_DRAW;
		}

		/* Player Status */
		for(_i = 0; _i < MAX_POKER_PLAYERS; ++_i)
		{
			TextDrawDestroy(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][_i]);
			gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][_i] = Text:INVALID_TEXT_DRAW;
		}

		/* Player Chips */
		for(_i = 0; _i < MAX_POKER_PLAYERS; ++_i)
		{
			TextDrawDestroy(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][_i]);
			gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][_i] = Text:INVALID_TEXT_DRAW;
		}

		/* Table Cards */
		for(_i = 0; _i < MAX_POKER_TABLE_CARDS; ++_i)
		{
			TextDrawDestroy(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][_i]);
		}

		/* Menu Items */
		for(_i = 0; _i < MAX_POKER_MENU_ITEMS; ++_i)
		{
			TextDrawDestroy(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][_i]);
			gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][_i] = Text:INVALID_TEXT_DRAW;
		}

		/* Blinds */
		TextDrawDestroy(gPokerGameInfo[game][E_POKER_GAME_BLINDS]);
		gPokerGameInfo[game][E_POKER_GAME_BLINDS] = Text:INVALID_TEXT_DRAW;
		return 1;
	}
	return 0;
}

Pkr_UpdatePlayerChips(slot, game, amount, remove = 0)
{
	if(!Pkr_IsValidGame(game) || !Pkr_IsValidSlot(slot)) return 0;
	if(!remove)
	{
        gPokerGameInfo[game][E_POKER_GAME_PLAYER_CAMOUNT][slot] += amount;
		new _str[24];
		format(_str, sizeof(_str), "CHIPS: ~g~$%s", Pkr_FormatNumber(gPokerGameInfo[game][E_POKER_GAME_PLAYER_CAMOUNT][slot]));
		TextDrawSetString(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][slot], _str);
	}
	else
	{
		TextDrawSetString(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CHIPS][slot], "_");
		gPokerGameInfo[game][E_POKER_GAME_PLAYER_CAMOUNT][slot] = 0;
	}
	return 1;
}

Pkr_UpdatePlayerReady(slot, game)
{
	if(!Pkr_IsValidGame(game) || !Pkr_IsValidSlot(slot)) return 0;
	if(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_ON][slot] == INVALID_PLAYER_ID) TextDrawSetString(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][slot], "~w~EMPTY SEAT");
	else
	{
		new _cache = GetPVarType(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_ON][slot], "PokerReady");
		if(_cache == 0) SetPVarInt(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_ON][slot], "PokerReady", 1);
		else DeletePVar(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_ON][slot], "PokerReady");
		TextDrawSetString(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_READY][slot], (_cache == 0) ? ("~g~READY") : ("~r~NOT READY"));
	}
	return 1;
}

Pkr_UpdatePlayerStatus(slot, game, status[] = "_")
{
	if(!Pkr_IsValidGame(game) || !Pkr_IsValidSlot(slot)) return 0;
	new _format[42];
	if(status[0] == '_') _format[0] = '_';
	else format(_format, sizeof(_format), "%s: %s", GetClientName(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_ON][slot]), status);
	TextDrawSetString(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_STATUS][slot], _format);
	return 1;
}

Pkr_UpdateBlinds(game, value)
{
	if(!Pkr_IsValidGame(game)) return 0;
	new _sz[42];
	format(_sz, sizeof(_sz), "BLINDS: ~g~$%i ~w~/ ~g~$%i", value, value * 2);
	TextDrawSetString(gPokerGameInfo[game][E_POKER_GAME_BLINDS], _sz);
	gPokerGameInfo[game][E_POKER_GAME_BLIND_AMOUNT] = value;
	return 1;
}

Pkr_UpdateTablePot(game, amount, reset = 0)
{
	if(!Pkr_IsValidGame(game)) return 0;
	new _str[42];
	if(!reset) gPokerGameInfo[game][E_POKER_GAME_POT_AMOUNT] += amount;
	else gPokerGameInfo[game][E_POKER_GAME_POT_AMOUNT] = 0;
	format(_str, sizeof(_str), "~w~ POT: ~g~$%s", Pkr_FormatNumber(gPokerGameInfo[game][E_POKER_GAME_POT_AMOUNT]));
	TextDrawSetString(gPokerGameInfo[game][E_POKER_GAME_POT], _str);
	return 1;
}


Pkr_DestroyPlayerCardTDs(playerid, game)
{
	new _slot = Pkr_ReturnPlayerSlot(playerid, game);
	if(Pkr_IsValidGame(game) && Pkr_IsValidSlot(_slot))
	{
		PlayerTextDrawDestroy(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][_slot]);
		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][_slot] = PlayerText:INVALID_TEXT_DRAW;
		PlayerTextDrawDestroy(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][_slot]);
		gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][_slot] = PlayerText:INVALID_TEXT_DRAW;
		TextDrawSetString(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][_slot], "_");
		TextDrawSetString(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][_slot], "_");
		return 1;
	}
	else return 0;
}

Pkr_CreatePlayerCardTDs(playerid, game)
{
	new _slot = Pkr_ReturnPlayerSlot(playerid, game);
	if(Pkr_IsValidGame(game) && Pkr_IsValidSlot(_slot))
	{
		switch(_slot)
		{
			case 0:
			{
				gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][0] = CreatePlayerTextDraw(playerid, 202.000000, 266.000000, "_");
				PlayerTextDrawBackgroundColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][0], 255);
				PlayerTextDrawFont(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][0], 4);
				PlayerTextDrawLetterSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][0], 0.470000, 0.899999);
				PlayerTextDrawColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][0], -1);
				PlayerTextDrawSetOutline(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][0], 0);
				PlayerTextDrawSetProportional(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][0], 1);
				PlayerTextDrawSetShadow(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][0], 1);
				PlayerTextDrawUseBox(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][0], 1);
				PlayerTextDrawBoxColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][0], 255);
				PlayerTextDrawTextSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][0], 30.000000, 40.000000);
				PlayerTextDrawSetSelectable(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][0], 0);

				gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][0] = CreatePlayerTextDraw(playerid, 234.000000, 266.000000, "_");
				PlayerTextDrawBackgroundColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][0], 255);
				PlayerTextDrawFont(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][0], 4);
				PlayerTextDrawLetterSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][0], 0.470000, 0.899999);
				PlayerTextDrawColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][0], -1);
				PlayerTextDrawSetOutline(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][0], 0);
				PlayerTextDrawSetProportional(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][0], 1);
				PlayerTextDrawSetShadow(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][0], 1);
				PlayerTextDrawUseBox(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][0], 1);
				PlayerTextDrawBoxColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][0], 255);
				PlayerTextDrawTextSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][0], 30.000000, 40.000000);
				PlayerTextDrawSetSelectable(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][0], 0);
			}

			case 1:
			{
				gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][1] = CreatePlayerTextDraw(playerid, 150.000000, 203.000000, "_");
				PlayerTextDrawBackgroundColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][1], 255);
				PlayerTextDrawFont(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][1], 4);
				PlayerTextDrawLetterSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][1], 0.470000, 0.899999);
				PlayerTextDrawColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][1], -1);
				PlayerTextDrawSetOutline(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][1], 0);
				PlayerTextDrawSetProportional(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][1], 1);
				PlayerTextDrawSetShadow(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][1], 1);
				PlayerTextDrawUseBox(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][1], 1);
				PlayerTextDrawBoxColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][1], 255);
				PlayerTextDrawTextSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][1], 30.000000, 40.000000);
				PlayerTextDrawSetSelectable(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][1], 0);

				gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][1] = CreatePlayerTextDraw(playerid, 182.000000, 203.000000, "_");
				PlayerTextDrawBackgroundColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][1], 255);
				PlayerTextDrawFont(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][1], 4);
				PlayerTextDrawLetterSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][1], 0.470000, 0.899999);
				PlayerTextDrawColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][1], -1);
				PlayerTextDrawSetOutline(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][1], 0);
				PlayerTextDrawSetProportional(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][1], 1);
				PlayerTextDrawSetShadow(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][1], 1);
				PlayerTextDrawUseBox(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][1], 1);
				PlayerTextDrawBoxColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][1], 255);
				PlayerTextDrawTextSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][1], 30.000000, 40.000000);
				PlayerTextDrawSetSelectable(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][1], 0);
			}

			case 2:
			{
				gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][2] = CreatePlayerTextDraw(playerid, 202.000000, 140.000000, "_");
				PlayerTextDrawBackgroundColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][2], 255);
				PlayerTextDrawFont(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][2], 4);
				PlayerTextDrawLetterSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][2], 0.470000, 0.899999);
				PlayerTextDrawColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][2], -1);
				PlayerTextDrawSetOutline(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][2], 0);
				PlayerTextDrawSetProportional(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][2], 1);
				PlayerTextDrawSetShadow(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][2], 1);
				PlayerTextDrawUseBox(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][2], 1);
				PlayerTextDrawBoxColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][2], 255);
				PlayerTextDrawTextSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][2], 30.000000, 40.000000);
				PlayerTextDrawSetSelectable(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][2], 0);

				gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][2] = CreatePlayerTextDraw(playerid, 234.000000, 140.000000, "_");
				PlayerTextDrawBackgroundColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][2], 255);
				PlayerTextDrawFont(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][2], 4);
				PlayerTextDrawLetterSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][2], 0.470000, 0.899999);
				PlayerTextDrawColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][2], -1);
				PlayerTextDrawSetOutline(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][2], 0);
				PlayerTextDrawSetProportional(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][2], 1);
				PlayerTextDrawSetShadow(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][2], 1);
				PlayerTextDrawUseBox(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][2], 1);
				PlayerTextDrawBoxColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][2], 255);
				PlayerTextDrawTextSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][2], 30.000000, 40.000000);
				PlayerTextDrawSetSelectable(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][2], 0);
			}

			case 3:
			{
				gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][3] = CreatePlayerTextDraw(playerid, 376.000000, 140.000000, "_");
				PlayerTextDrawBackgroundColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][3], 255);
				PlayerTextDrawFont(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][3], 4);
				PlayerTextDrawLetterSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][3], 0.470000, 0.899999);
				PlayerTextDrawColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][3], -1);
				PlayerTextDrawSetOutline(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][3], 0);
				PlayerTextDrawSetProportional(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][3], 1);
				PlayerTextDrawSetShadow(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][3], 1);
				PlayerTextDrawUseBox(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][3], 1);
				PlayerTextDrawBoxColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][3], 255);
				PlayerTextDrawTextSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][3], 30.000000, 40.000000);
				PlayerTextDrawSetSelectable(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][3], 0);

				gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][3] = CreatePlayerTextDraw(playerid, 408.000000, 140.000000, "_");
				PlayerTextDrawBackgroundColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][3], 255);
				PlayerTextDrawFont(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][3], 4);
				PlayerTextDrawLetterSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][3], 0.470000, 0.899999);
				PlayerTextDrawColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][3], -1);
				PlayerTextDrawSetOutline(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][3], 0);
				PlayerTextDrawSetProportional(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][3], 1);
				PlayerTextDrawSetShadow(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][3], 1);
				PlayerTextDrawUseBox(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][3], 1);
				PlayerTextDrawBoxColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][3], 255);
				PlayerTextDrawTextSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][3], 30.000000, 40.000000);
				PlayerTextDrawSetSelectable(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][3], 0);
			}

			case 4:
			{
				gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][4] = CreatePlayerTextDraw(playerid, 433.000000, 203.000000, "_");
				PlayerTextDrawBackgroundColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][4], 255);
				PlayerTextDrawFont(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][4], 4);
				PlayerTextDrawLetterSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][4], 0.470000, 0.899999);
				PlayerTextDrawColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][4], -1);
				PlayerTextDrawSetOutline(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][4], 0);
				PlayerTextDrawSetProportional(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][4], 1);
				PlayerTextDrawSetShadow(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][4], 1);
				PlayerTextDrawUseBox(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][4], 1);
				PlayerTextDrawBoxColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][4], 255);
				PlayerTextDrawTextSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][4], 30.000000, 40.000000);
				PlayerTextDrawSetSelectable(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][4], 0);

				gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][4] = CreatePlayerTextDraw(playerid, 465.000000, 203.000000, "_");
				PlayerTextDrawBackgroundColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][4], 255);
				PlayerTextDrawFont(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][4], 4);
				PlayerTextDrawLetterSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][4], 0.470000, 0.899999);
				PlayerTextDrawColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][4], -1);
				PlayerTextDrawSetOutline(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][4], 0);
				PlayerTextDrawSetProportional(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][4], 1);
				PlayerTextDrawSetShadow(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][4], 1);
				PlayerTextDrawUseBox(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][4], 1);
				PlayerTextDrawBoxColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][4], 255);
				PlayerTextDrawTextSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][4], 30.000000, 40.000000);
				PlayerTextDrawSetSelectable(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][4], 0);
			}

			case 5:
			{
				gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][5] = CreatePlayerTextDraw(playerid, 376.000000, 266.000000, "_");
				PlayerTextDrawBackgroundColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][5], 255);
				PlayerTextDrawFont(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][5], 4);
				PlayerTextDrawLetterSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][5], 0.470000, 0.899999);
				PlayerTextDrawColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][5], -1);
				PlayerTextDrawSetOutline(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][5], 0);
				PlayerTextDrawSetProportional(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][5], 1);
				PlayerTextDrawSetShadow(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][5], 1);
				PlayerTextDrawUseBox(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][5], 1);
				PlayerTextDrawBoxColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][5], 255);
				PlayerTextDrawTextSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][5], 30.000000, 40.000000);
				PlayerTextDrawSetSelectable(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][5], 0);

				gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][5] = CreatePlayerTextDraw(playerid, 408.000000, 266.000000, "_");
				PlayerTextDrawBackgroundColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][5], 255);
				PlayerTextDrawFont(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][5], 4);
				PlayerTextDrawLetterSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][5], 0.470000, 0.899999);
				PlayerTextDrawColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][5], -1);
				PlayerTextDrawSetOutline(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][5], 0);
				PlayerTextDrawSetProportional(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][5], 1);
				PlayerTextDrawSetShadow(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][5], 1);
				PlayerTextDrawUseBox(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][5], 1);
				PlayerTextDrawBoxColor(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][5], 255);
				PlayerTextDrawTextSize(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][5], 30.000000, 40.000000);
				PlayerTextDrawSetSelectable(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][5], 0);
			}
		}

		PlayerTextDrawShow(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][_slot]);
		PlayerTextDrawShow(playerid, gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][_slot]);
		return 1;
	}
	return 0;
}

Pkr_UpdateTableCard(game, cardslot, cardtype)
{
	if(!Pkr_IsValidGame(game) || 0 > cardslot > MAX_POKER_TABLE_CARDS) return 0;
	TextDrawSetString(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][cardslot], Pkr_ReturnCardSpriteName(gDeck[cardtype]));
	gPokerGameInfo[game][E_POKER_GAME_TABLE_CARD_VALUE][cardslot] = gDeck[cardtype];
	return 1;
}

Pkr_UpdatePlayerCardOneTD(slot, game, cardid)
{
	if(!Pkr_IsValidSlot(slot) || 0 > slot > MAX_POKER_PLAYERS) return 0;
	TextDrawSetString(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][slot], "LD_CARD:cdback");
	PlayerTextDrawSetString(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_ON][slot], gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCONE][slot], Pkr_ReturnCardSpriteName(gDeck[cardid]));
	gPokerGameInfo[game][E_POKER_GAME_PLAYER_CONE_VALUE][slot] = gDeck[cardid];
	return 1;
}

Pkr_UpdatePlayerCardTwoTD(slot, game, cardid)
{
	if(!Pkr_IsValidSlot(slot) || 0 > slot > MAX_POKER_PLAYERS) return 0;
	TextDrawSetString(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][slot], "LD_CARD:cdback");
	PlayerTextDrawSetString(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_ON][slot], gPokerGameInfo[game][E_POKER_GAME_PLAYERS_PCTWO][slot], Pkr_ReturnCardSpriteName(gDeck[cardid]));
	gPokerGameInfo[game][E_POKER_GAME_PLAYER_CTWO_VALUE][slot] = gDeck[cardid];
	return 1;
}

Pkr_ResetPlayerCards(game, slot)
{
	if(!Pkr_IsValidSlot(slot) || !Pkr_IsValidGame(game)) return 0;
	TextDrawSetString(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CONE][slot], "");
	TextDrawSetString(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_CTWO][slot], "");
	gPokerGameInfo[game][E_POKER_GAME_PLAYER_CONE_VALUE][slot] = -1;
	gPokerGameInfo[game][E_POKER_GAME_PLAYER_CTWO_VALUE][slot] = -1;
	return 1;
}

Pkr_ResetTableCards(game)
{
	for(new _i; _i < MAX_POKER_TABLE_CARDS; ++_i)
	{
		TextDrawSetString(gPokerGameInfo[game][E_POKER_GAME_TABLE_CARDS][_i], "_");
		gPokerGameInfo[game][E_POKER_GAME_TABLE_CARD_VALUE][_i] = -1;
	}
}

Pkr_ChangeMenuState(game, newState)
{
	if(!Pkr_IsValidGame(game)) return 0;
	switch(newState)
	{
		case E_POKER_GAME_MONE_STATE_RAISE, E_POKER_GAME_MONE_STATE_ALL_IN:
		{
			TextDrawSetString(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][0], (newState == E_POKER_GAME_MONE_STATE_RAISE) ? ("RAISE") : ("ALL IN"));
			gPokerGameInfo[game][E_POKER_GAME_MENU_ONE_STATE] = newState;
		}

		case E_POKER_GAME_MTWO_STATE_CHECK, E_POKER_GAME_MTWO_STATE_CALL:
		{
			TextDrawSetString(gPokerGameInfo[game][E_POKER_GAME_MENU_ITEMS][1], (newState == E_POKER_GAME_MTWO_STATE_CHECK) ? ("CHECK") : ("CALL"));
			gPokerGameInfo[game][E_POKER_GAME_MENU_TWO_STATE] = newState;
		}
	}
	return 1;
}

Pkr_UpdateWaitingPlayers(game)
{
	for(new i; i < MAX_POKER_PLAYERS; ++i)
	{
		new _state = GetPVarInt(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_ON][i], "PokerState");
		if(gPokerGameInfo[game][E_POKER_GAME_PLAYERS_ON][i] != INVALID_PLAYER_ID && _state != E_POKER_PLAYER_STATE_ALL_IN && _state != E_POKER_PLAYER_STATE_FOLD) Pkr_UpdatePlayerStatus(i, game, "~g~WAITING");
	}
}
