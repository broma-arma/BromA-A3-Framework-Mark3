_path = _this select 0;

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