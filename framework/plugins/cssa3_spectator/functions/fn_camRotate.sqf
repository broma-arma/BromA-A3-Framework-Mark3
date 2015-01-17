/*
	Author: Karel Moricky - Bohemia Interactive.

	Description:
	- Rotate the camera.

	Parameter(s):
	_dX : Number - Amount to move the camera along the X axis. (Left/Right)
	_dY : Number - Amount to move the camera along the Y axis. (Up/Down)

	Returns:
	NOTHING
*/

private ["_cam","_dX","_dY","_pitchbank"];

_cam = missionnamespace getvariable "CSSA3_mainCamera";
_dX = _this select 0;
_dY = _this select 1;
_pitchbank = _cam call bis_fnc_getpitchbank;
_cam setdir (direction _cam + _dX);
[
	_cam,
	(_pitchbank select 0) + _dY,
	0
] call bis_fnc_setpitchbank;