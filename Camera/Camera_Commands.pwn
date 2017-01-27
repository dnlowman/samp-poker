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
