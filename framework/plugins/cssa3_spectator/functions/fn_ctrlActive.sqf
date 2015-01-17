/*
	Author: Cyrokrypto

	Description:
	- Checks wether the specified control is active (cursor hovering over).
	- Can be shortened and improved. (When not lazy.)

	Parameter(s):
	0   : control    - idc if contol.
	_mX : position2D - Mouse X position.
	_mY : position2D - Mouse Y position.

	Returns:
	_result : Boolean - True if control is active.
*/

private ["_display","_posArray","_result","_cX","_cY","_cW","_cH","_mX","_mY","_outOfX","_outOfY","_rightSide","_bottomSide"];

disableSerialization;

_display = findDisplay 7810;

_posArray = ctrlPosition (_display displayCtrl (_this select 0));
_result = true;

_cX = _posArray select 0;
_cY = _posArray select 1;
_cW = _posArray select 2;
_cH = _posArray select 3;

_mX = _this select 1;
_mY = _this select 2;
_outOfX = false;
_outOfY = false;

_rightSide = _cX + _cW;
_bottomSide = _cY + _cH;

if ((_mX < _cX) || (_mX >_rightSide)) then {_outOfX = true};
if (!(_mY > _cY) || !(_mY < _bottomSide)) then {_outOfY = true};
if ((_outOfX) || {(_outOfY)}) then {_result = false} else {_result = true};

_result;