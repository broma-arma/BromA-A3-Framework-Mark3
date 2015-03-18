
if (mission_enable_hc && (isServer || hasInterface)) then { mission_AI_controller = false };
if (!mission_enable_hc && !isServer) then { mission_AI_controller = false };

if (!mission_enable_hc && isServer) then { mission_AI_controller = true; mission_HC_enabled = true; publicVariable "mission_HC_enabled" };
if (mission_enable_hc && (!isServer && !hasInterface)) then { mission_AI_controller = true; mission_HC_enabled = true; publicVariable "mission_HC_enabled" };

if (mission_AI_controller) then {
    if (isServer) then { mission_AI_controller_name = "SERVER" } 
    else { 
        if (hasInterface) then { 
            mission_AI_controller_name = name player;
        } else {
            mission_AI_controller_name = player;
        };        
    };
    
    publicVariable "mission_AI_controller_name";
};

HeadlessController = mission_AI_controller;

0 spawn {
    waitUntil {!(isNil "mission_AI_controller_name")};
    ["LOCAL","CHAT", format ["AI Controller is currently enabled as %1.", mission_AI_controller_name]] call BRM_fnc_doLog;
};

if (mission_AI_controller) then {
    
    #include "includes\core_functions.sqf"

    [] call hc_fnc_loadMissionObjects;
};