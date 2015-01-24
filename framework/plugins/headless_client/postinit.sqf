scriptName "headless_client";

if (mission_enable_hc && (isServer || hasInterface)) then { mission_AI_controller = false };
if (!mission_enable_hc && !isServer) then { mission_AI_controller = false };

if (!mission_enable_hc && isServer) then { mission_AI_controller = true; mission_HC_enabled = true; publicVariable "mission_HC_enabled" };
if (mission_enable_hc && (!isServer && !hasInterface)) then { mission_AI_controller = true; mission_HC_enabled = true; publicVariable "mission_HC_enabled" };

HeadlessController = mission_AI_controller;
HeadlessVariable = mission_HC_enabled;

if (HeadlessVariable) then { publicVariable "HeadlessVariable" };