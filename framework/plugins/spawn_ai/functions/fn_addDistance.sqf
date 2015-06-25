
// [myArray, [-100, 50],[-100, 50]] call BRM_spawnAI_fnc_addDistance;

_array = _this select 0;
_d1 = _this select 1;
_d2 = _this select 1;

_d1 = _d1 call BIS_fnc_randomInt;
_d2 = _d2 call BIS_fnc_randomInt;

_array set [0, _d1 + (_array select 0)];
_array set [1, _d2 + (_array select 1)];

_array