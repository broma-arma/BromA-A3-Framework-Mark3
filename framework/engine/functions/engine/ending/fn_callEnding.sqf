if (!mission_running) exitWith {};
mission_running = false; publicVariable "mission_running";

[-2, {
    private["_ending","_stats","_showEnding","_success"];

    _ending = _this;
    
    if (isServer) then {
        [_ending] call compile preprocessFile "mission\settings\endings.sqf";
        
        [] call BRM_fnc_endingGetStats;
    };
    waitUntil{!isNil "mission_ending_details"};
    
    [] call BRM_fnc_endingGetContext;

    if (mission_ending_details select 2) then {
        _showEnding = [] spawn BRM_fnc_endingScreen;
        waitUntil{(scriptDone _showEnding)};
    };

    if (isServer) then { sleep 2 };
    [_ending, (mission_ending_personal select 0), true] spawn BIS_fnc_endMission;
    
}, _this select 0] call CBA_fnc_globalExecute;