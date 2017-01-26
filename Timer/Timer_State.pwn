Pkr_SetTimerValue(const gameId, const value) {
	new tdText[128];
	format(tdText, sizeof(tdText), "%d", value);
	Pkr_SetTimerTextDrawText(gameId, tdText);
	Pkr_SetTimer(gameId, value);
	return;
}

forward Pkr_OnOneSecond();
public Pkr_OnOneSecond() {
	Pkr_ForeachGame(gameId) {
		if(!Pkr_GetIsAssigned(gameId))
			continue;

		new POKER_GAME_STATUS: gameStatus = Pkr_GetGameStatus(gameId);
		if(gameStatus != POKER_GAME_STATUS: LOBBY && gameStatus != POKER_GAME_STATUS: EVALUATION) {
			new currentTime = Pkr_GetTimer(gameId);

			if(currentTime == 0) {
				new playerSlot = Pkr_GetCurrentPlayerPosition(gameId);
				Pkr_SetPlayerStatusFolded(gameId, playerSlot);
				Pkr_SetNextPlayerPlaying(gameId);
				continue;
			}

			Pkr_SetTimerValue(gameId, currentTime - 1);
		}
	}

	return;
}
