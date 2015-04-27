
0 spawn {
    
if (isServer) then {
    setup_sides = [];
    {
        if ((!(side _x in setup_sides))&&!(str _x == "<NULL-object>")&&(isPlayer _x)) then {
            setup_sides pushBack (side _x);
        };
    } forEach allUnits;
    publicVariable "setup_sides";
} else {
    waitUntil{(!isNil "setup_sides")};
};

#include "includes\settings.sqf"

if !(mission_game_mode == "coop") then {
            
    private["_markfix"];
    if (side player == resistance) then { _markfix = "resistance" } else { _markfix = side player };
    _resp1 = format ["respawn_%1", _markfix];
    _resp2 = format ["respawn_%1", _markfix];
    _resp3 = format ["respawn_%1", _markfix];

    zone1 = [_resp1, setup_zone_area, mission_setup_time, side_a_side] spawn BRM_SetupZone_fnc_setupZone;
    zone2 = [_resp2, setup_zone_area, mission_setup_time, side_b_side] spawn BRM_SetupZone_fnc_setupZone;
    
    if (mission_enable_side_c) then {
    zone3 = [_resp3, setup_zone_area, mission_setup_time, side_c_side] spawn BRM_SetupZone_fnc_setupZone;
    };
};

};