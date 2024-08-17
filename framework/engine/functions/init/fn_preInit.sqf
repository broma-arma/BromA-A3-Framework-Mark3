if (!isNil "BRM_FMK_fnc_preInit") then { _this call BRM_FMK_fnc_preInit };

// Engine preInit
{
	if (!isNil _x) then {
		_this call (missionNamespace getVariable _x);
	};
} forEach [
	"BRM_fnc_loadSettings",
	"BRM_FMK_fnc_initVariables",
	"BRM_FMK_fnc_engine_pre"
];

// Plugins preInit
{
	
	private _functionTag = [_x, "functionTag", configName _x] call BIS_fnc_returnConfigEntry;
	private _preInitFunctions = [format ["BRM_%1_fnc_preInit", _functionTag], format ["BRM_FMK_%1_fnc_preInit", _functionTag]];
	private _index = _preInitFunctions findIf { !isNil { missionNamespace getVariable _x } };
	if (_index != -1) then {
		_this call (missionNamespace getVariable _preInitFunctions#_index);
	};
} forEach ("true" configClasses (missionConfigFile >> "CfgPlugins"));
