if (!isServer) exitWith {};

while {(mission_running)} do {
    if ((count mandatoryObjectivesA > 0)&&(mission_running)) then {
        _count = 0;
        {
            _id = _x select 0;
            _wincond = call compile format ["%1",_x select 1];
            _losecond = call compile format ["%1",_x select 2];
            
            _done = false;
            
            if (_wincond) then {
                [_id,"succeeded", true] call BRM_fnc_setTask;
                _count = _count + 1;
            };
            if (_losecond) exitWith {
                [_id,"failed", true] call BRM_fnc_setTask;
                if (mission_game_mode != "tvt") then {
                    ["defeat"] call BRM_fnc_callEnding;
                };
            };
        } forEach mandatoryObjectivesA;

        if (_count == (count mandatoryObjectivesA)) exitWith {
            if (mission_game_mode != "tvt") then {
                ["victory"] call BRM_fnc_callEnding;
            } else {
                ["side_a"] call BRM_fnc_callEnding;
            };
        };
    };
    
    if ((count mandatoryObjectivesB > 0)&&(mission_running)) then {
        _count = 0;
        {
            _id = _x select 0;
            _wincond = call compile format ["%1",_x select 1];
            _losecond = call compile format ["%1",_x select 2];
            
            _done = false;
            
            if (_wincond) then {
                [_id,"succeeded", true] call BRM_fnc_setTask;
                _count = _count + 1;
            };
            if (_losecond) exitWith {
                [_id,"failed", true] call BRM_fnc_setTask;
                if (mission_game_mode != "tvt") then {
                    ["defeat"] call BRM_fnc_callEnding;
                };
            };
        } forEach mandatoryObjectivesB;

        if (_count == (count mandatoryObjectivesB)) exitWith {
            if (mission_game_mode != "tvt") then {
                ["victory"] call BRM_fnc_callEnding;
            } else {
                ["side_b"] call BRM_fnc_callEnding;
            };
        };
    };
    
    if ((count mandatoryObjectivesC > 0)&&(mission_running)) then {
        _count = 0;
        {
            _id = _x select 0;
            _wincond = call compile format ["%1",_x select 1];
            _losecond = call compile format ["%1",_x select 2];
            
            _done = false;
            
            if (_wincond) then {
                [_id,"succeeded", true] call BRM_fnc_setTask;
                _count = _count + 1;
            };
            if (_losecond) exitWith {
                [_id,"failed", true] call BRM_fnc_setTask;
                if (mission_game_mode != "tvt") then {
                    ["defeat"] call BRM_fnc_callEnding;
                };
            };
        } forEach mandatoryObjectivesC;

        if (_count == (count mandatoryObjectivesC)) exitWith {
            if (mission_game_mode != "tvt") then {
                ["victory"] call BRM_fnc_callEnding;
            } else {
                ["side_c"] call BRM_fnc_callEnding;
            };
        };
    };
    
    sleep 5;
};