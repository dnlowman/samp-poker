#include "Blinds_TextDraws.pwn"
#include "BlindsState.pwn"
#include "Blinds_Commands.pwn"

Pkr_SetBlindValue(const gameId, const amount) {
	Pkr_SetBlind(gameId, amount);
	new tdText[128];
	format(tdText, sizeof(tdText), "BLINDS: ~y~$%d ~w~/ ~y~$%d", amount, amount << 1);
	TextDrawSetString(Pkr_GetBlindsTextDrawId(gameId), tdText);
	return;
}
