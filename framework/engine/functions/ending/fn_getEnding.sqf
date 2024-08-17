if (!isNil "BRM_FMK_fnc_getEnding") then { _this call BRM_FMK_fnc_getEnding };

params ["_ending"];

private _title = "Mission over";
private _reason = format ["'%1', unconfigured ending. (%2)", _ending, "%1, %2, %3"];
private _winningSides = ["a"];
private _losingSides = ["b", "c"];
private _showStats = true;

private _cfgEnding = missionConfigFile >> "BRM_CfgEnding" >> _ending;
if (isClass _cfgEnding) then {
	_title = getText (_cfgEnding >> "title");
	_reason = getText (_cfgEnding >> "reason");
	_winningSides = getArray (_cfgEnding >> "winningSides") apply { missionNamespace getVariable format ["side_%1_side", _x] };
	_losingSides = getArray (_cfgEnding >> "losingSides") apply { missionNamespace getVariable format ["side_%1_side", _x] };
	if (isNumber (_cfgEnding >> "showStats")) then {
		_showStats = getNumber (_cfgEnding >> "showStats") > 0;
	};
};

if (!mission_enable_side_c) then {
	_winningSides = _winningSides - [side_c_side];
	_losingSides = _losingSides - [side_c_side];
};

mission_ending_details = [_winningSides, _losingSides, _showStats, _title, _reason, 1];
