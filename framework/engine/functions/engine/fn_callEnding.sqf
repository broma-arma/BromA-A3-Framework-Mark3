fn_endMission = {
    private["_stats","_showEnding","_success"];
    
    _stats = [] call BRM_fnc_endingGetStats;
    _success = [_this select 0] call compile preprocessFile "mission\settings\endings.sqf";
    _showEnding = [] spawn BRM_fnc_endingScreen;
    
    waitUntil{(scriptDone _showEnding)};
    
    if (isServer) then { sleep 2 };
    [_this select 0, _success,true] spawn BIS_fnc_endMission;
};

if (isServer) then { [[_this select 0], "fn_endMission", true] spawn BIS_fnc_MP };