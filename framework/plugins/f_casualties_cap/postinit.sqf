f_fnc_casualtyCap = compile preprocessFileLineNumbers "framework\plugins\f_casualties_cap\f_CasualtiesCapCheck.sqf";

sleep 5;

#include "settings.sqf"

[casualty_group_player, mission_cas_cap, "defeat"] spawn f_fnc_casualtyCap;

if (mission_game_mode == "tvt") then {
[casualty_group_enemy, mission_cas_cap, "victory"] spawn f_fnc_casualtyCap;
};