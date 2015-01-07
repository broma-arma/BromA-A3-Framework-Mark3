[-2, {
    private["_ending","_stats","_showEnding","_success"];
    
    _ending = _this;

    _stats = [] call BRM_fnc_endingGetStats;
    _success = [_ending] call compile preprocessFile "mission\settings\endings.sqf";
    _showEnding = [] spawn BRM_fnc_endingScreen;

    waitUntil{(scriptDone _showEnding)};

    if (isServer) then { sleep 2 };
    [_ending, _success,true] spawn BIS_fnc_endMission;
}, _this select 0] call CBA_fnc_globalExecute;