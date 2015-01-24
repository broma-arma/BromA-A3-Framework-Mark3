
_path = _this select 0;

if (isNil "mission_dac_zones") then { mission_dac_zones = [] };

BRM_fnc_DAC = compile preprocessFileLineNumbers (_path+"fn_DAC.sqf");
BRM_fnc_createDACZone = compile preprocessFileLineNumbers (_path+"fn_createDACZone.sqf");
BRM_fnc_scaleUnits = compile preprocessFileLineNumbers (_path+"fn_scaleUnits.sqf");
BRM_fnc_getDACSide = compile preprocessFileLineNumbers (_path+"fn_getDACSide.sqf");

if (isNil "mission_AI_controller") then { mission_AI_controller = false };
if (!mission_AI_controller) exitWith {};

[-1, { player globalChat format ["%1 will be handling the AI for this mission.",_this select 0] }, [player] ] call CBA_fnc_globalExecute;

#include "settings.sqf"

_center = createCenter sideLogic; _group = createGroup _center;

mission_DAC_module = _group createUnit ["DAC_Source_Extern", [0,0,0],[], 1,"NONE"];
publicVariable "mission_DAC_module";

_zone1 = [trg1, "Hey, please create an activated friendly zone named whatever, with normal amounts of units and a few tanks."] call BRM_fnc_DAC;