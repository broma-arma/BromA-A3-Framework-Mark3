// =============================================================================
//   These parameters will be used in the mission whenever "Custom" is chosen
//                    as the mission condition parameter.
//
//    https://community.bistudio.com/wiki/Category:Command_Group:_Environment
// =============================================================================

// These are values as you've set them in the editor.
_year = (date) select 0;
_month = (date) select 1;
_day = (date) select 2;
_hour = (date) select 3;
_minute = (date) select 4;

missionCustomDate = [_year, _month, _day, _hour, _minute];

// overcast, rain, lightnings, rainbow
missionCustomWeather = [overcast, rain, lightnings, rainbow];

// base value, decay, altitude
missionCustomFog = [fogParams select 0, fogParams select 1, fogParams select 2];

// windStr, gusts, waves
missionCustomWind = [windStr, gusts, waves];
