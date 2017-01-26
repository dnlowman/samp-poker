Pkr_CreateTimerTextDraw(const gameId) {
	new Text: textDraw = TextDrawCreate(307.332977, 149.762985, "_");
	Pkr_SetTimerTextdraw(gameId, textDraw);
	TextDrawLetterSize(textDraw, 0.400000, 1.600000);
	TextDrawAlignment(textDraw, 1);
	TextDrawColor(textDraw, -1);
	TextDrawSetShadow(textDraw, 0);
	TextDrawSetOutline(textDraw, 1);
	TextDrawBackgroundColor(textDraw, 255);
	TextDrawFont(textDraw, 1);
	TextDrawSetProportional(textDraw, 1);
	TextDrawSetShadow(textDraw, 0);
	return;
}

Pkr_DestroyTimerTextDraw(const gameId) {
	new Text: textDraw = Pkr_GetTimerTextdraw(gameId);
	TextDrawDestroy(textDraw);
	Pkr_SetTimerTextdraw(gameId, Text: INVALID_TEXT_DRAW);
	return;
}

Pkr_SetTimerTextDrawText(const gameId, const text[]) {
	new Text: textDraw = Pkr_GetTimerTextdraw(gameId);
	new newText[4];
	format(newText, sizeof(newText), "%s", text);
	TextDrawSetString(textDraw, newText);
	return;
}

Pkr_ShowTimerTextDraw(const playerid, const gameId) {
	new Text: textDraw = Pkr_GetTimerTextdraw(gameId);
	TextDrawShowForPlayer(playerid, textDraw);
	return;
}

Pkr_HideTimerTextDraw(const playerid, const gameId) {
	new Text: textDraw = Pkr_GetTimerTextdraw(gameId);
	TextDrawHideForPlayer(playerid, textDraw);
	return;
}
