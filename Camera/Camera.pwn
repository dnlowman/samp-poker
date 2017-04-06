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
