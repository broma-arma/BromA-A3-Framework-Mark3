private ["_scope","_type","_msg"];

_scope = _this select 0;
_type = _this select 1;
_msg = _this select 2;

if (!(typeName _msg == "STRING")) then { _msg = str _msg };

switch (toUpper(_scope)) do {
    case "LOCAL" : { _scope = 1 };
    case "SERVER" : { _scope = 0 };
    case "CLIENTS" : { _scope = -1 };
    case "ALL" : { _scope = -2 };
    default { _scope = 1 };
};

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