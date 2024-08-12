params ["_faction", "_property"];

#include "\broma_framework\loadouts\includes\private-variables.sqf"
#include "\broma_framework\loadouts\content\content-list.sqf"

_assignLoadoutMode = false;

#include "read-data.sqf"

_ret = [];
#include "\broma_framework\loadouts\includes\return-properties.sqf"
_ret
