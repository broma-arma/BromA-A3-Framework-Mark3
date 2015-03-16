take_chair_cond = "((_this getVariable ['chair_holding', 'nothing']) == 'nothing')&&!(_target getVariable ['chair_occupied', false])&&!(_this getVariable ['unit_sitting',false])";

chair_sitting_positions = [
["Crew", 1], ["ChopperLight_CB_idle1shaky_H", 1.8], ["ChopperHeavy_R_Static_H", 1.8], ["commander_apctracked1aa_H", 2.7],
["commander_apctracked3_out", 1.7]
];

player setVariable ["unit_sitting", false, false];

if (!isServer) exitWith {};

#include "includes\settings.sqf"

chair_plugin_list = nearestObjects [[0,0,0], chair_plugin_chairs, 300000];

{ 
    [_x,"BRM_ChairPlugin_fnc_initChair",true,true] spawn BIS_fnc_MP;
} forEach chair_plugin_list;