_path = _this select 0;

// =============================================================================
//  Player casualty cap
// =============================================================================

waitUntil{!isNil"param_cas_cap"};

switch (param_cas_cap) do {
    case 0: { mission_cas_cap = 80 };
    case 1: { mission_cas_cap = 90 };
    case 2: { mission_cas_cap = 95 };
    case 3: { mission_cas_cap = 100 };
};
publicVariable "mission_cas_cap";

// =============================================================================

f_fnc_casualtyCap = compile preprocessFileLineNumbers (_path+"f_CasualtiesCapCheck.sqf");

sleep 5;

#include "settings.sqf"

[casualty_group_a, mission_cas_cap, "defeat"] spawn f_fnc_casualtyCap;

if (mission_game_mode == "tvt") then {
[casualty_group_b, mission_cas_cap, "defeat"] spawn f_fnc_casualtyCap;
};

if (mission_enable_side_c) then {
[casualty_group_c, mission_cas_cap, "defeat"] spawn f_fnc_casualtyCap;
};