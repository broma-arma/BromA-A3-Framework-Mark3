if (!isServer) exitWith {};

missionOver = false;

while {!(missionOver)} do {
    if ((count mandatoryObjectivesA > 0)&&(!missionOver)) then {
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
                ["defeat"] call BRM_fnc_callEnding;
                missionOver = true;
            };
        } forEach mandatoryObjectivesA;

        if (_count == (count mandatoryObjectivesA)) exitWith {
            ["victory"] call BRM_fnc_callEnding;
            missionOver = true;
        };
    };
    
    if ((count mandatoryObjectivesB > 0)&&(!missionOver)) then {
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
                ["defeat"] call BRM_fnc_callEnding;
                missionOver = true;
            };
        } forEach mandatoryObjectivesB;

        if (_count == (count mandatoryObjectivesB)) exitWith {
            ["victory"] call BRM_fnc_callEnding;
            missionOver = true;
        };
    };
    
    if ((count mandatoryObjectivesC > 0)&&(!missionOver)) then {
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
                ["defeat"] call BRM_fnc_callEnding;
                missionOver = true;
            };
        } forEach mandatoryObjectivesC;

        if (_count == (count mandatoryObjectivesC)) exitWith {
            ["victory"] call BRM_fnc_callEnding;
            missionOver = true;
        };
    };
    
    sleep 5;
};