/*
================================================================================

NAME:
    BRM_fnc_setParams
    
AUTHOR(s):
    Fer

DESCRIPTION:
    Reads all mission parameters and assigns them to their attributed variables.
    Also processes Time and Weather related parameters.

PARAMETERS:
    None.
    
USAGE:
    [] call BRM_fnc_setParams.
    
RETURNS:
    Nothing.

================================================================================
*/

0 spawn {
    
waitUntil{(!isNil "paramsArray")};

_paramArray = paramsArray;
{
    _paramName = (configName ((missionConfigFile >> "Params") select _forEachIndex));
    _paramValue = (_paramArray select _forEachIndex);
    _paramCode = ( getText (missionConfigFile >> "Params" >> _paramName >> "code"));
    _code = format[_paramCode, _paramValue];
    call compile _code;
    publicVariable _paramName;
} foreach _paramArray;

waitUntil{(!isNil "plugins_loaded")};
waitUntil{(plugins_loaded)};

mission_AGM_enabled = (isClass(configFile>>"CfgPatches">>"AGM_CORE"));
mission_ACE3_enabled = (isClass(configFile>>"CfgPatches">>"ACE_COMMON"));

mission_TFAR_enabled = (isClass(configFile>>"CfgPatches">>"task_force_radio"));
mission_ACRE2_enabled = (isClass(configFile>>"CfgPatches">>"acre_api"));

mission_params_read = true;

if (!isServer) exitWith {};

// ============================================================================
//  Date                                                                       |
// ============================================================================
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
    
    // Random
    case 8: { setDate [2035, 5, 11, floor(random(23)), floor(random(60))] };
};

// ============================================================================
//  Weather conditions                                                         |
// ============================================================================

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
    // Random
    case 11: {
        _MissionOvercast = (random(1));
        _MissionRain = (random(1));
        _MissionRainbow = (random(1));
        _MissionLightnings = (random(1));
        _MissionWindStr = (random(1));
        _MissionWindGusts = (random(1));
        _MissionFog = (random(1));
        _MissionWaves = (random(1));
        _MissionHumidity = (random(1));
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

paramsDone = true; 
publicVariable "paramsDone";
};