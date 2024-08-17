if (!isNil "BRM_FMK_fnc_getLoadoutProperty") then { _this call BRM_FMK_fnc_getLoadoutProperty };

params ["_faction", "_property"];

#include "\broma_framework\loadouts\includes\private-variables.sqf"
#include "\broma_framework\loadouts\content\content-list.sqf"

_assignLoadoutMode = false;

#include "read-data.sqf"

_ret = [];
#include "\broma_framework\loadouts\includes\return-properties.sqf"
_ret
