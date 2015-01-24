0 spawn {
    
if (!isServer) exitWith {};
waitUntil{(!isNil "paramsArray")};
_paramArray = paramsArray;
{
    _paramName = (configName ((missionConfigFile >> "Params") select _forEachIndex));
    _paramValue = (_paramArray select _forEachIndex);
    _paramCode = ( getText (missionConfigFile >> "Params" >> _paramName >> "code"));
    _code = format[_paramCode, _paramValue];
    call compile _code;
    if (isServer) then {
        publicVariable _paramName;
    };
} foreach _paramArray; 

// =============================================================================
//  Headless Client
// =============================================================================

switch (param_hc_enabled) do {
    case 0: { mission_enable_hc = false };
    case 1: { mission_enable_hc = true };
};
publicVariable "mission_enable_hc";

// =============================================================================
//  Date
// =============================================================================
switch (param_time_of_day) do {
    
    // Dawn
    case 0: { setDate [2007, 5, 11, 4, 50] };
    
    // Early Morning
    case 1: { setDate [2007, 5, 11, 5, 50] };
    
    // Morning
    case 2: { setDate [2007, 5, 11, 9, 00] };
    
    // Noon
    case 3: { setDate [2007, 5, 11, 12, 0] };
    
    // Afternoon
    case 4: { setDate [2007, 5, 11, 15, 00] };
    
    // Evening
    case 5: { setDate [2007, 5, 11, 17, 50] };
    
    // Dusk
    case 6: { setDate [2007, 5, 11, 18, 50] };
    
    // Night
    case 7: { setDate [2007, 5, 11, 0, 0] };
};

// =============================================================================
//  Weather conditions
// =============================================================================
private ["_MissionOvercast","_MissionRain","_MissionRainbow","_MissionLightnings","_MissionWindStr","_MissionWindGusts","_MissionFog","_MissionWaves","_MissionHumidity"];

switch (param_weather) do { 
    // Clear (Calm)
    case 0: {
        _MissionOvercast = 0.01;
        _MissionRain = 0;
        _MissionRainbow = 0;
        _MissionLightnings = 0;
        _MissionWindStr = 0;
        _MissionWindGusts = 0;
        _MissionFog = 0;
        _MissionWaves = 0.1;
        _MissionHumidity = 0.2;
    };
    // Clear (Light Winds)
    case 1: {
        _MissionOvercast = 0.01;
        _MissionRain = 0;
        _MissionRainbow = 0;
        _MissionLightnings = 0;
        _MissionWindStr = 0.25;
        _MissionWindGusts = 0.5;
        _MissionFog = 0;
        _MissionWaves = 0.25;
        _MissionHumidity = 0.2;
    };
    
    // Clear (Strong Winds)
    case 2: {
        _MissionOvercast = 0.01;
        _MissionRain = 0;
        _MissionRainbow = 0;
        _MissionLightnings = 0;
        _MissionWindStr = 0.75;
        _MissionWindGusts = 1;
        _MissionFog = 0;
        _MissionWaves = 0.75;
        _MissionHumidity = 0.2;
    };
    
    // Overcast (Calm)
    case 3: {
        _MissionOvercast = 0.8;
        _MissionRain = 0;
        _MissionRainbow = 0;
        _MissionLightnings = 0;
        _MissionWindStr = 0;
        _MissionWindGusts = 0;
        _MissionFog = 0;
        _MissionWaves = 0.1;
        _MissionHumidity = 0.2;
    };
    
    // Overcast (Light Winds)
    case 4: {
        _MissionOvercast = 0.8;
        _MissionRain = 0;
        _MissionRainbow = 0;
        _MissionLightnings = 0;
        _MissionWindStr = 0.25;
        _MissionWindGusts = 0.5;
        _MissionFog = 0;
        _MissionWaves = 0.25;
        _MissionHumidity = 0.2;
    };
    
    // Overcast (Strong Winds)
    case 5: {
        _MissionOvercast = 0.8;
        _MissionRain = 0;
        _MissionRainbow = 0;
        _MissionLightnings = 0;
        _MissionWindStr = 0.75;
        _MissionWindGusts = 1;
        _MissionFog = 0;
        _MissionWaves = 0.75;
        _MissionHumidity = 0.2;
    };
    
    // Rain (Light Winds)
    case 6: {
        _MissionOvercast = 1;
        _MissionRain = 1;
        _MissionRainbow = 0;
        _MissionLightnings = 0;
        _MissionWindStr = 0.25;
        _MissionWindGusts = 0.5;
        _MissionFog = 0;
        _MissionWaves = 0.75;
        _MissionHumidity = 0.9;
    };
    
    // Rain (Strong Winds)
    case 7: {
        _MissionOvercast = 1;
        _MissionRain = 1;
        _MissionRainbow = 0;
        _MissionLightnings = 0;
        _MissionWindStr = 0.75;
        _MissionWindGusts = 1;
        _MissionFog = 0;
        _MissionWaves = 0.75;
        _MissionHumidity = 0.9;
    };
    
    // Storm
    case 8: {
        _MissionOvercast = 1;
        _MissionRain = 1;
        _MissionRainbow = 0;
        _MissionLightnings = 1;
        _MissionWindStr = 1;
        _MissionWindGusts = 1;
        _MissionFog = 0;
        _MissionWaves = 1;
        _MissionHumidity = 1;
    };
    
    // Light Fog
    case 9: {
        _MissionOvercast = 0.25;
        _MissionRain = 0;
        _MissionRainbow = 0;
        _MissionLightnings = 0;
        _MissionWindStr = 0;
        _MissionWindGusts = 0;
        _MissionFog = 0.3;
        _MissionWaves = 0;
        _MissionHumidity = 0.7;
    };
    // Heavy Fog
    case 10: {
        _MissionOvercast = 0.8;
        _MissionRain = 0;
        _MissionRainbow = 0;
        _MissionLightnings = 0;
        _MissionWindStr = 0;
        _MissionWindGusts = 0;
        _MissionFog = 0.7;
        _MissionWaves = 0;
        _MissionHumidity = 0.7;
    };
};

0 setOvercast _MissionOvercast;
0 setFog _MissionFog;
0 setRain _MissionRain;
0 setRainbow _MissionRainbow;
0 setWindStr  _MissionWindStr;
0 setWindForce _MissionWindGusts;
0 setWaves _MissionWaves;

[] spawn BRM_fnc_stampTime;

// =============================================================================
//  Time limit
// =============================================================================

switch (param_time_limit) do {
    case 0: { mission_time_limit = -1 };
    case 1: { mission_time_limit = 10800 };
    case 2: { mission_time_limit = 7200 };
    case 3: { mission_time_limit = 3600 };
    case 4: { mission_time_limit = 2700 };
    case 5: { mission_time_limit = 1800 };
    case 6: { mission_time_limit = 900 };
    case 7: { mission_time_limit = 600 };
    case 8: { mission_time_limit = 65 };        
};
publicvariable "mission_time_limit";

// =============================================================================
//  AGM Revive Time
// =============================================================================

switch (param_revive_time) do {
    case 0: { mission_revive_time = 10 };
    case 1: { mission_revive_time = 120 };
    case 2: { mission_revive_time = 300 };
    case 3: { mission_revive_time = 600 };
};
publicVariable "mission_revive_time";

// =============================================================================
//  Mission setup time
// =============================================================================

switch (param_setup_time) do {
    case 0: { mission_setup_time = 15 };
    case 1: { mission_setup_time = 60*1 };
    case 2: { mission_setup_time = 60*3 };
    case 3: { mission_setup_time = 60*5 };
    case 4: { mission_setup_time = 60*10 };
};
publicvariable "mission_setup_time";

// =============================================================================
//  Civilian casualty cap
// =============================================================================

switch (param_dead_civies) do {
    case 0: { mission_dead_civies = -1 };
    case 1: { mission_dead_civies = 5 };
    case 2: { mission_dead_civies = 15 };
    case 3: { mission_dead_civies = 30 };
};
publicVariable "mission_dead_civies";

// =============================================================================
//  Player casualty cap
// =============================================================================

switch (param_cas_cap) do {
    case 0: { mission_cas_cap = 80 };
    case 1: { mission_cas_cap = 90 };
    case 2: { mission_cas_cap = 95 };
    case 3: { mission_cas_cap = 100 };
};
publicVariable "mission_cas_cap";

// =============================================================================
//  Enable respawn
// =============================================================================

switch (param_allow_respawn) do {
    case 0: { mission_allow_respawn = true };
    case 1: { mission_allow_respawn = false };
};
publicVariable "mission_allow_respawn";

// =============================================================================
//  Player lives
// =============================================================================

switch (param_player_lives) do {
    case 0: { mission_player_lives = 1 };
    case 1: { mission_player_lives = 3 };
    case 2: { mission_player_lives = 5 };
    case 3: { mission_player_lives = 10 };
};
publicVariable "mission_player_lives";

// =============================================================================
//  Allow third person
// =============================================================================

switch (param_allow_tp_veh) do {
    case 0: { mission_allow_tp_veh = "disabled" };
    case 1: { mission_allow_tp_veh = "everyone" };
    case 2: { mission_allow_tp_veh = "drivers" };
};
publicVariable "mission_allow_tp_veh";

paramsDone = true; publicVariable "paramsDone";
};