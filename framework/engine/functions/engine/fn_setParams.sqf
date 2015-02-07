0 spawn {
    
if (!isServer) exitWith {};
waitUntil{(!isNil "paramsArray")};

mission_params_read = false; publicVariable "mission_params_read";

_paramArray = paramsArray;
{
    _paramName = (configName ((missionConfigFile >> "Params") select _forEachIndex));
    _paramValue = (_paramArray select _forEachIndex);
    _paramCode = ( getText (missionConfigFile >> "Params" >> _paramName >> "code"));
    _code = format[_paramCode, _paramValue];
    call compile _code;
    publicVariable _paramName;
} foreach _paramArray;

mission_params_read = true; publicVariable "mission_params_read";

// =============================================================================
//  Date
// =============================================================================
switch (param_time_of_day) do {
    
    // Dawn
    case 0: { setDate [2035, 5, 11, 4, 50] };
    
    // Early Morning
    case 1: { setDate [2035, 5, 11, 5, 50] };
    
    // Morning
    case 2: { setDate [2035, 5, 11, 9, 00] };
    
    // Noon
    case 3: { setDate [2035, 5, 11, 12, 0] };
    
    // Afternoon
    case 4: { setDate [2035, 5, 11, 15, 00] };
    
    // Evening
    case 5: { setDate [2035, 5, 11, 17, 50] };
    
    // Dusk
    case 6: { setDate [2035, 5, 11, 18, 50] };
    
    // Night
    case 7: { setDate [2035, 5, 11, 0, 0] };
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

paramsDone = true; publicVariable "paramsDone";
};