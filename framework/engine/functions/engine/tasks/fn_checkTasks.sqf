if (!isServer) exitWith {};

while {(mission_running)} do {
    
    if ((count tasks_a > 0)&&(mission_running)) then {
        _count = 0;
        {
            _id = _x select 0;
            _wincond = call compile format ["%1",_x select 1];
            _losecond = call compile format ["%1",_x select 2];
            
            _done = false;
            _mandatory = (_id in tasks_mandatory_a);
            
            if (_wincond) then {
                [_id,"succeeded", true] call BRM_fnc_setTask;
                if (_mandatory) then { _count = _count + 1 };
            };
            if (_losecond) then {
                if (_mandatory) then {
                    [_id,"failed", true] call BRM_fnc_setTask;
                    if (mission_game_mode == "tvt") then {
                        [endings_tvt_side_a_defeat] call BRM_fnc_callEnding;
                    } else {
                        [endings_defeat] call BRM_fnc_callEnding;
                    };
                } else {
                    [_id,"canceled", true] call BRM_fnc_setTask;
                };
            };
        } forEach tasks_a;

        if ( (_count == (count tasks_mandatory_a)) && (count tasks_mandatory_a >= 1) ) exitWith {
            if (mission_game_mode == "tvt") then {
                [endings_tvt_side_a_victory] call BRM_fnc_callEnding;
            } else {
                [endings_victory] call BRM_fnc_callEnding;
            };
        };
    };
    
    if ((count tasks_b > 0)&&(mission_running)) then {
        _count = 0;
        {
            _id = _x select 0;
            _wincond = call compile format ["%1",_x select 1];
            _losecond = call compile format ["%1",_x select 2];
            
            _done = false;
            _mandatory = (_id in tasks_mandatory_b);
            
            if (_wincond) then {
                [_id,"succeeded", true] call BRM_fnc_setTask;
                if (_mandatory) then { _count = _count + 1 };
            };
            if (_losecond) then {
                if (_mandatory) then {
                    [_id,"failed", true] call BRM_fnc_setTask;
                    if (mission_game_mode == "tvt") then {
                        [endings_tvt_side_b_defeat] call BRM_fnc_callEnding;
                    };
                } else {
                    [_id,"canceled", true] call BRM_fnc_setTask;
                };
            };
        } forEach tasks_b;

        if (_count == (count tasks_mandatory_b)) exitWith {
            if (mission_game_mode == "tvt") then {
                [endings_tvt_side_b_victory] call BRM_fnc_callEnding;
            };
        };
    };
    
    if ((count tasks_c > 0)&&(mission_running)) then {
        _count = 0;
        {
            _id = _x select 0;
            _wincond = call compile format ["%1",_x select 1];
            _losecond = call compile format ["%1",_x select 2];
            
            _done = false;
            _mandatory = (_id in tasks_mandatory_c);
            
            if (_wincond) then {
                [_id,"succeeded", true] call BRM_fnc_setTask;
                if (_mandatory) then { _count = _count + 1 };
            };
            if (_losecond) then {
                if (_mandatory) then {
                    [_id,"failed", true] call BRM_fnc_setTask;
                    if (mission_game_mode == "tvt") then {
                        [endings_tvt_side_c_defeat] call BRM_fnc_callEnding;
                    };
                } else {
                    [_id,"canceled", true] call BRM_fnc_setTask;
                };
            };
        } forEach tasks_c;

        if (_count == (count tasks_mandatory_c)) exitWith {
            if (mission_game_mode == "tvt") then {
                [endings_tvt_side_c_victory] call BRM_fnc_callEnding;
            };
        };
    };
    
    sleep 5;
};