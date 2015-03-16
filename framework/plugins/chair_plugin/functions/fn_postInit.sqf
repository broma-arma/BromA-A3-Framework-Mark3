take_chair_cond = "((_this getVariable ['chair_holding', 'nothing']) == 'nothing')&&!(_target getVariable ['chair_occupied', false])&&!(_this getVariable ['unit_sitting',false])";

chair_plugin_chairs = ["Land_CampingChair_V1_F"];

chair_sitting_positions = [
["Crew", 1]
];

#include "includes\settings.sqf"

player setVariable ["unit_sitting", false, false];
player setVariable ["chair_holding", "nothing", false];

if (!isServer) exitWith {};

publicVariable "take_chair_cond";
publicVariable "chair_plugin_chairs";
publicVariable "chair_sitting_positions";

chair_plugin_list = nearestObjects [[0,0,0], chair_plugin_chairs, 300000];

{ 
    [_x,"BRM_ChairPlugin_fnc_initChair",true,true] spawn BIS_fnc_MP;
} forEach chair_plugin_list;