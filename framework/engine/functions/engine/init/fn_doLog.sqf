/*
================================================================================

NAME:
    BRM_fnc_doLog

AUTHOR(s):
    Nife

DESCRIPTION:
    Logs or displays any desired value, targeting any desired environment.

PARAMETERS:
    0 - Scope or environment where the argument will be logged. (STRING)
    1 - The type of logging. (STRING)
    2 - The value to be logged. (ANY)
    3 - Condition for the logging to happen. (BOOL)

USAGE:
    ["ALL", "HINT", "Loaded the message!"] call BRM_fnc_doLog;
    ["LOCAL", "LOG", (name player)] call BRM_fnc_doLog;
    ["SERVER", "F_LOG", "All events initialized."] call BRM_fnc_doLog;
    ["LOCAL", "CHAT", "Debug mode is on!", DEBUG_MODE] call BRM_fnc_doLog;

RETURNS:
    Nothing.

================================================================================
*/

private ["_scope","_type","_msg","_cond"];

_scope = _this select 0;
_type = _this select 1;
_msg = _this select 2;

_cond = true;

if (count _this > 3) then {
    _cond = _this select 3;
};

if (!_cond) exitWith {};

if (!(typeName _msg == "STRING")) then { _msg = str _msg };

switch (toUpper(_scope)) do {
    case "LOCAL" : { _scope = 1 };
    case "SERVER" : { _scope = 0 };
    case "SERVER_ONLY": { _scope = 2 };
    case "CLIENTS" : { _scope = -1 };
    case "ALL" : { _scope = -2 };
    default { _scope = 1 };
};

if ( (_scope == 2) && !isServer) exitWith {};

switch (toUpper(_type)) do {
    case "HINT" : {
        if (_scope < 1) then {
            [_scope, { hint _this }, _msg] call CBA_fnc_globalExecute;
        } else { hint _msg };
    };
    case "CHAT" : {
        if (_scope < 1) then {
            [_scope, { player globalChat _this }, _msg] call CBA_fnc_globalExecute;
        } else { player globalChat _msg };
    };
    case "LOG" : {
        if (_scope < 1) then {
            [_scope, { diag_log _this }, _msg] call CBA_fnc_globalExecute;
        } else { diag_log _msg };
    };
    case "F_LOG" : {
        _padding = ( 100 - (count _msg) );
        _msg = "=== " + _msg + " ";

        if (_padding > 0) then {
            for "_i" from 0 to _padding do {
                _msg = _msg + "=";
            };
        };
        if (_scope < 1) then {
            [_scope, { diag_log _this }, _msg] call CBA_fnc_globalExecute;
        } else { diag_log _msg };
    };
};