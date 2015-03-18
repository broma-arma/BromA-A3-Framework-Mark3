take_chair_cond = "( (((getPos _this) distance (getPos _target)) < 2) && (_this getVariable ['chair_holding', 'nothing']) == 'nothing')&&!(_target getVariable ['chair_occupied', false])&&!(_this getVariable ['unit_sitting',false])";

chair_plugin_chairs = ["Land_CampingChair_V1_F"];

chair_sitting_positions = [
["Crew", 1]
];

MAC_fnc_switchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;

    _object switchMove _anim;
};

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