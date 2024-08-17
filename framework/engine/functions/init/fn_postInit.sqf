if (!isNil "BRM_FMK_fnc_postInit") then { _this call BRM_FMK_fnc_postInit };

// Engine postInit
{
	if (!isNil _x) then {
		_this call (missionNamespace getVariable _x);
	};
} forEach [
	"BRM_FMK_fnc_logPlugins",
	"BRM_FMK_fnc_warnConflict",
	"BRM_FMK_fnc_defineGroups",
	"BRM_FMK_fnc_createPlayerVehicles",
	"BRM_FMK_fnc_readExtraction",
	"BRM_FMK_fnc_initPlayer",
	"BRM_fnc_loadBriefing",
	"BRM_fnc_endLoading"
];

// Plugins postInit
{
	private _functionTag = [_x, "functionTag", configName _x] call BIS_fnc_returnConfigEntry;

	private _params = parseSimpleArray ([_x, "params", "[]"] call BIS_fnc_returnConfigEntry);
	if (_params isNotEqualTo []) then {
		private _setParamsFunctions = [format ["BRM_%1_fnc_setParams", _functionTag], format ["BRM_FMK_%1_fnc_setParams", _functionTag]];
		private _index = _setParamsFunctions findIf { !isNil { missionNamespace getVariable _x } };
		if (_index != -1) then {
			_params apply {
				if (!isNil "_x") then { _x call BIS_fnc_getParamValue } else { nil }
			} call (missionNamespace getVariable _setParamsFunctions#_index);
		};
	};

	private _postInitFunctions = [format ["BRM_%1_fnc_postInit", _functionTag], format ["BRM_FMK_%1_fnc_postInit", _functionTag]];
	private _index = _postInitFunctions findIf { !isNil { missionNamespace getVariable _x } };
	if (_index != -1) then {
		_this call (missionNamespace getVariable _postInitFunctions#_index);
	};
} forEach ("true" configClasses (missionConfigFile >> "CfgPlugins"));
