
if (mission_AI_controller && !isServer) then {
    ["ALL","CHAT", format ["Headless Client has been enabled as %1.", player]] call BRM_fnc_doLog;
} else {
    waitUntil {!(isNil "mission_AI_controller_name")};
    ["LOCAL","CHAT", format ["Headless Client is already enabled as %1.", mission_AI_controller_name]] call BRM_fnc_doLog;
};

if (mission_AI_controller) then {
    
    mission_init_enemies = [] execVM "mission\objectives\enemies.sqf";
    
    #include "core_functions.sqf"

    [] call hc_fnc_loadMissionObjects;
};