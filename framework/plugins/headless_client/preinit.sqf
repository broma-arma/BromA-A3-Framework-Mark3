
// =============================================================================
//  Headless Client parameters
// =============================================================================

waitUntil{!isNil "param_hc_enabled"};

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