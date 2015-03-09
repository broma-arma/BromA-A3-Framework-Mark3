
_path = _this select 0;

if (isNil "mission_dac_zones") then { mission_dac_zones = [] };
if (isNil "mission_dac_camps") then { mission_dac_camps = [] };

BRM_fnc_DAC = compile preprocessFileLineNumbers (_path+"fn_DAC.sqf");
BRM_fnc_createDACZone = compile preprocessFileLineNumbers (_path+"fn_createDACZone.sqf");
BRM_fnc_createDACCamp = compile preprocessFileLineNumbers (_path+"fn_createDACCamp.sqf");
BRM_fnc_scaleUnits = compile preprocessFileLineNumbers (_path+"fn_scaleUnits.sqf");
BRM_fnc_getDACStat = compile preprocessFileLineNumbers (_path+"fn_getDACStat.sqf");

#include "settings.sqf"

_center = createCenter sideLogic; _group = createGroup _center;
_group createUnit ["DAC_Source_Extern", [0,0,0],[], 1,"NONE"];

true