_faction = toUpper _faction;
#include "\broma_framework\loadouts\faction-list.sqf"
#include "..\..\..\..\mission\loadouts\faction-list.sqf"

#include "\broma_framework\loadouts\includes\default-equipment.sqf"

if (_assignLoadoutMode) then {
	if (_UAVBag in ["auto", "ar2", "al6", "al6med"]) then {
		if (_UAVBag == "auto") then { _UAVBag = "ar2" };
		_UAVBag = [_unit, _UAVBag] call BRM_FMK_fnc_getSideUAV select 0;
	};
	if (_UAVTerminal == "auto") then { _UAVTerminal = [_unit, "vanilla"] call BRM_FMK_fnc_getSideUAV select 1; };

	_factionStructure = toUpper _factionStructure;

	private _frameworkStructure = false;
	#include "..\..\..\..\mission\loadouts\structure-list.sqf"
	if (_frameworkStructure) then {
		#include "\broma_framework\loadouts\structure-list.sqf"
	};
};

#include "\broma_framework\loadouts\includes\faction-info-index.sqf"
#include "\broma_framework\loadouts\includes\default-values.sqf"
