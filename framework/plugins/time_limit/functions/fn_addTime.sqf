
_time = _this select 0;

if (_time == 0) exitWith {};

[0, { mission_countdown = mission_countdown + _this }, _time] call CBA_fnc_globalExecute;

private ["_message"];

if (_time >= 60) then {
    _message = "%1 minute(s) have been added to time limit!";
    _time = floor(_time)/60;
} else {
    _message = "%1 seconds have been added to time limit!";
};

[-1, { ["Timer",[format [_this select 0, _this select 1]]] call BIS_fnc_showNotification }, [_message, _time]] call CBA_fnc_globalExecute;