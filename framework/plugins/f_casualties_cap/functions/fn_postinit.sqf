
if (!isMultiplayer) exitWith {};
if (!isServer) exitWith {};
if (mission_cas_cap == -1) exitWith {};

0 spawn {
    
#include "includes\settings.sqf"

private ["_casA","_casB","_casC"];

call compile format ["casBLU = %1", casualty_group_BLU];
call compile format ["casOP = %1", casualty_group_OP];
call compile format ["casIND = %1", casualty_group_IND];

switch (side_a_side) do {
    case WEST: { _casA = casBLU };
    case EAST: { _casA = casOP };
    case RESISTANCE: { _casA = casIND };
};

switch (side_b_side) do {
    case WEST: { _casB = casBLU };
    case EAST: { _casB = casOP };
    case RESISTANCE: { _casB = casIND };
};

switch (side_c_side) do {
    case WEST: { _casC = casBLU };
    case EAST: { _casC = casOP };
    case RESISTANCE: { _casC = casIND };
};

sleep 5;

if (mission_game_mode == "tvt") then {    
    
    [_casA, mission_cas_cap, endings_tvt_auto] spawn f_cas_cap_fnc_CasualtiesCapCheck;
        
    [_casB, mission_cas_cap, endings_tvt_auto] spawn f_cas_cap_fnc_CasualtiesCapCheck;

    if (mission_enable_side_c) then {        
        [_casC, mission_cas_cap, endings_tvt_auto] spawn f_cas_cap_fnc_CasualtiesCapCheck;
    };
} else {
    [_casA, mission_cas_cap, endings_defeat] spawn f_cas_cap_fnc_CasualtiesCapCheck;
};

};