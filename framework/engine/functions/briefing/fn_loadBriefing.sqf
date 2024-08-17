if (!isNil "BRM_FMK_fnc_loadBriefing") then { _this call BRM_FMK_fnc_loadBriefing };

if (!hasInterface) exitWith {};

call compile preprocessFileLineNumbers "\broma_framework\credits.sqf";

private _briefing = [
	"opfor", "blufor", "indfor", "civfor",
	"unknown", "enemy", "friendly",
	"logic", "empty", "ambient"
] select (side player call BIS_fnc_sideID);

private _file = format ["mission\briefings\briefing-%1.sqf", _briefing];
private _fileExists = fileExists _file;
["LOCAL", "F_LOG", format ["PLAYER: %1 %2 BRIEFING", ["SKIPPING", "ASSIGNING"] select _fileExists, toUpper _briefing]] call BRM_FMK_fnc_doLog;
if (_fileExists) then {
	call compile preprocessFileLineNumbers _file;
};
