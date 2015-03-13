
// =============================================================================
//  Headless Client parameters
// =============================================================================

switch (param_hc_enabled) do {
    case 0: { mission_enable_hc = false };
    case 1: { mission_enable_hc = true };
};
publicVariable "mission_enable_hc";

// =============================================================================

if (mission_enable_hc && (isServer || hasInterface)) then { mission_AI_controller = false };
if (!mission_enable_hc && !isServer) then { mission_AI_controller = false };

if (!mission_enable_hc && isServer) then { mission_AI_controller = true; mission_HC_enabled = true; publicVariable "mission_HC_enabled" };
if (mission_enable_hc && (!isServer && !hasInterface)) then { mission_AI_controller = true; mission_HC_enabled = true; publicVariable "mission_HC_enabled" };

if (mission_AI_controller) then {
    if (isServer) then { mission_AI_controller_name = "SERVER" } 
    else { mission_AI_controller_name = player };
    
    publicVariable "mission_AI_controller_name";
};

HeadlessController = mission_AI_controller;

if (mission_AI_controller && !isServer) then {
    ["ALL","CHAT", format ["Headless Client ENABLED as %1.", player]] call BRM_fnc_doLog;
} else {
    waitUntil {!(isNil "mission_AI_controller_name")};
    ["LOCAL","CHAT", format ["Headless Client is enabled as %1.", mission_AI_controller_name]] call BRM_fnc_doLog;
};

if (mission_AI_controller) then {
    
    mission_init_enemies = [] execVM "mission\objectives\enemies.sqf";
    
    #include "core_functions.sqf"

    [] call hc_fnc_loadMissionObjects;
};