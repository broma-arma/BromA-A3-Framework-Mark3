if (isNil "missionCustomDate") then { missionCustomDate = date; };
if (isNil "missionCustomWeather") then { missionCustomWeather = [overcast, rain, lightnings, rainbow]; };
if (isNil "missionCustomFog") then { missionCustomFog = fogParams; };
if (isNil "missionCustomWind") then { missionCustomWind = [windStr, gusts, waves]; };

if (!isNil "BRM_FMK_MissionConditions_fnc_setParams") then { _this call BRM_FMK_MissionConditions_fnc_setParams; };
