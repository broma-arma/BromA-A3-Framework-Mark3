params ["_faction"];

#include "\broma_framework\loadouts\includes\private-variables.sqf"
#include "\broma_framework\loadouts\content\content-list.sqf"
#include "\broma_framework\loadouts\includes\faction-info-index.sqf"

_assignLoadoutMode = false;

_loadoutCondition = (!((_faction) in mission_loadouts));

#include "read-data.sqf"

_ret = [];

#include "\broma_framework\loadouts\includes\return-properties.sqf"

_ret
