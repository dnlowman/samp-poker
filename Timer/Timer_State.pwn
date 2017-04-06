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

Pkr_SetTimerValue(const gameId, const value) {
	if(Pkr_GetTimerStart(gameId) == 0)
		return;

	new tdText[128];
	format(tdText, sizeof(tdText), "%d", value);
	Pkr_SetTimerTextDrawText(gameId, tdText);
	Pkr_SetTimer(gameId, value);
	return;
}

forward Pkr_OnOneSecond();
public Pkr_OnOneSecond() {
	Pkr_ForeachGame(gameId) {
		if(!Pkr_GetIsAssigned(gameId) || Pkr_GetTimerStart(gameId) == 0)
			continue;

		new POKER_GAME_STATUS: gameStatus = Pkr_GetGameStatus(gameId);
		if(gameStatus != POKER_GAME_STATUS: LOBBY && gameStatus != POKER_GAME_STATUS: EVALUATION) {
			new currentTime = Pkr_GetTimer(gameId);

			if(currentTime <= 6 && currentTime > 0)
				Pkr_PlaySoundForPlayers(gameId, 1137);

			if(currentTime == 0) {
				Pkr_PlaySoundForPlayers(gameId, 1085);
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

Pkr_PlaySoundForPlayers(const gameId, const soundId) {
	Pkr_ForeachPlayer(playerSlot) {
		PlayerPlaySound(Pkr_GetPlayerId(gameId, playerSlot), soundId, 0.0, 0.0, 0.0);
	}
}
