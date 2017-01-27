#include "Camera_Commands.pwn"

PkrSys_SetPlayerCamera(const playerid, const objectid) {
	if(!IsValidDynamicObject(objectid)) return false;
	new Float:_pos[4], Float:_offset[2];
	GetDynamicObjectPos(objectid, _pos[0], _pos[1], _pos[2]);
	GetDynamicObjectRot(objectid, _pos[3], _pos[3], _pos[3]);
	_pos[3] += 270;
	_offset[0] = _pos[0];
	_offset[1] = _pos[1];
	_offset[0] += (0.1 * floatsin(-_pos[3], degrees));
	_offset[1] += (0.1 * floatcos(-_pos[3], degrees));
	SetPlayerCameraPos(playerid, _offset[0], _offset[1], _pos[2] + POKER_CAMERA_HEIGHT);
	SetPlayerCameraLookAt(playerid, _pos[0], _pos[1], _pos[2]);
	return true;
}
