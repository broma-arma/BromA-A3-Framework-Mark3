
_path = _this select 0;

waitUntil{!(isNil "mission_AI_controller")};
if (!mission_AI_controller) exitWith {};

if (isNil "mission_dac_zones") then { mission_dac_zones = [] };

BRM_fnc_DAC = compile preprocessFileLineNumbers (_path+"fn_DAC.sqf");
BRM_fnc_createDACZone = compile preprocessFileLineNumbers (_path+"fn_createDACZone.sqf");
BRM_fnc_scaleUnits = compile preprocessFileLineNumbers (_path+"fn_scaleUnits.sqf");
BRM_fnc_getDACSide = compile preprocessFileLineNumbers (_path+"fn_getDACSide.sqf");

["ALL","CHAT", format ["%1 managing DAC.", player]] call BRM_fnc_doLog;

#include "settings.sqf"

_center = createCenter sideLogic; _group = createGroup _center;
_group createUnit ["DAC_Source_Extern", [0,0,0],[], 1,"NONE"];

_zone1 = [trg1, "Create an activated friendly zone named whatever, with few infantry."] spawn BRM_fnc_DAC;
//_zone2 = [trg2, "Create an activated civilian zone named whatever, with few infantry."] spawn BRM_fnc_DAC;
//_zone2 = [trg2, "Create an activated enemy zone named whatever, with lots of infantry and some vehicles and many tanks."] spawn BRM_fnc_DAC;