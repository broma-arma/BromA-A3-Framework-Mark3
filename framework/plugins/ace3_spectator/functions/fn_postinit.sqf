if !(isClass(configFile>>"CfgPatches">>"ACE_MEDICAL")) exitWith {};

[allUnits] call ace_spectator_fnc_updateUnits;

if ((mission_game_mode == "tvt")||(mission_game_mode == "cotvt")) then {
    if (!player_is_spectator) then {
        [[side player]] call ace_spectator_fnc_updateSpectatableSides;
    };
};