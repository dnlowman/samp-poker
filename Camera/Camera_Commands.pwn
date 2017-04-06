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

PkrCMD_Camera(const playerid) {
	new gameId = Pkr_GetPlayerGame(playerid);
	if(gameId == -1 || gameId == INVALID_POKER_GAME_ID) {
		SendClientMessage(playerid, COLOR_RED, "You're not playing poker.");
		return;
	}

	new objectId = Pkr_GetObjectId(gameId);

	if(GetPVarType(playerid, POKER_CAMERA_VAR_NAME) == PLAYER_VARTYPE_NONE) {
		PkrSys_SetPlayerCamera(playerid, objectId);
		SetPVarInt(playerid, POKER_CAMERA_VAR_NAME, 1);
		return;
	}

	SetCameraBehindPlayer(playerid);
	DeletePVar(playerid, POKER_CAMERA_VAR_NAME);
	return;
}
