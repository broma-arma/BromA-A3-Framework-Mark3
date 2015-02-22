
_path = _this select 0;

if (isNil "mission_dac_zones") then { mission_dac_zones = [] };

BRM_fnc_DAC = compile preprocessFileLineNumbers (_path+"fn_DAC.sqf");
BRM_fnc_createDACZone = compile preprocessFileLineNumbers (_path+"fn_createDACZone.sqf");
BRM_fnc_scaleUnits = compile preprocessFileLineNumbers (_path+"fn_scaleUnits.sqf");
BRM_fnc_getDACSide = compile preprocessFileLineNumbers (_path+"fn_getDACSide.sqf");

if (isNil "mission_AI_controller") then { mission_AI_controller = false };
if (!mission_AI_controller) exitWith {};

["ALL","CHAT", format ["%1 managing DAC.", player]] call BRM_fnc_doLog;

#include "settings.sqf"

_center = createCenter sideLogic; _group = createGroup _center;

mission_DAC_module = _group createUnit ["DAC_Source_Extern", [0,0,0],[], 1,"NONE"];
publicVariable "mission_DAC_module";

_zone1 = [trg1, "Create an activated friendly zone named whatever, with a lot of infantry."] spawn BRM_fnc_DAC;
//_zone2 = [trg2, "Create an activated civilian zone named whatever, with few infantry."] spawn BRM_fnc_DAC;
//_zone2 = [trg2, "Create an activated enemy zone named whatever, with lots of infantry and some vehicles and many tanks."] spawn BRM_fnc_DAC;