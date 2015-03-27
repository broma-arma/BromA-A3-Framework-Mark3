
if (!isMultiplayer) exitWith {};
if (!isServer) exitWith {};
if (mission_cas_cap == -1) exitWith {};

0 spawn {

call compile format ["casA = %1", casualty_group_a];
call compile format ["casB = %1", casualty_group_b];
call compile format ["casC = %1", casualty_group_c];

sleep 5;

#include "includes\settings.sqf"

if (mission_game_mode == "tvt") then {    
    
    [casA, mission_cas_cap, endings_tvt_auto] spawn f_cas_cap_fnc_CasualtiesCapCheck;
        
    [casB, mission_cas_cap, endings_tvt_auto] spawn f_cas_cap_fnc_CasualtiesCapCheck;

    if (mission_enable_side_c) then {        
        [casualty_group_c, mission_cas_cap, endings_tvt_auto] spawn f_cas_cap_fnc_CasualtiesCapCheck;
    };
} else {    
    [casA, mission_cas_cap, endings_defeat] spawn f_cas_cap_fnc_CasualtiesCapCheck;
};

};