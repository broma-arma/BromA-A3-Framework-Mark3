
params ["_faction"];

_assignLoadoutMode = false;
_loadoutCondition = (!((_faction) in read_local_loadouts_specific));

#include "\broma_framework\loadouts\includes\private-variables.sqf"
#include "\broma_framework\loadouts\content\content-list.sqf"
#include "\broma_framework\loadouts\includes\faction-info-index.sqf"

// READ LOADOUT DATA ===========================================================

#include "read-data.sqf"

// =============================================================================

_ret = [];

#include "\broma_framework\loadouts\includes\return-properties.sqf"

_ret