_path = _this select 0;

// =============================================================================
//  Player casualty cap
// =============================================================================

switch (param_cas_cap) do {
    case 0: { mission_cas_cap = 80 };
    case 1: { mission_cas_cap = 90 };
    case 2: { mission_cas_cap = 95 };
    case 3: { mission_cas_cap = 100 };
};
publicVariable "mission_cas_cap";

// =============================================================================

//if (true) exitWith {};

f_fnc_casualtyCap = compile preprocessFileLineNumbers (_path+"f_CasualtiesCapCheck.sqf");

call compile format ["casA = %1", casualty_group_a];
call compile format ["casB = %1", casualty_group_b];
call compile format ["casC = %1", casualty_group_c];

sleep 5;

#include "settings.sqf"

if (mission_game_mode == "tvt") then {    
    
    [casA, mission_cas_cap, endings_tvt_auto] spawn f_fnc_casualtyCap;
        
    [casB, mission_cas_cap, endings_tvt_auto] spawn f_fnc_casualtyCap;

    if (mission_enable_side_c) then {        
        [casualty_group_c, mission_cas_cap, endings_tvt_auto] spawn f_fnc_casualtyCap;
    };
} else {    
    [casA, mission_cas_cap, endings_defeat] spawn f_fnc_casualtyCap;
};