
params ["_faction"];

#include "\broma_framework\loadouts\includes\private-variables.sqf"
#include "\broma_framework\loadouts\content\content-list.sqf"
#include "\broma_framework\loadouts\includes\faction-info-index.sqf"

_assignLoadoutMode = false;

_loadoutCondition = (!((_faction) in read_local_loadouts_specific));

// READ LOADOUT DATA ===========================================================

#include "read-data.sqf"

// =============================================================================

_ret = [];

#include "\broma_framework\loadouts\includes\return-properties.sqf"

_ret