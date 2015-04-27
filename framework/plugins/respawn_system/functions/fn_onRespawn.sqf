private["_lives","_index"];

waitUntil {(alive player)};

player_current_lives = [player] call BRM_RespawnSystem_fnc_getLives;

if (((player_current_lives) == 0) || !(mission_allow_respawn)) then {
    
    [player, 0] call BRM_RespawnSystem_fnc_setLives;
    
    mission_dead_players pushBack [(getPlayerUID player), (name player),(player getVariable "unit_side")]; publicVariable "mission_dead_players";

    [player] spawn BRM_RespawnSystem_fnc_removeFromMission;
} else {
    player setVariable ["unit_deaths", (player getVariable ["unit_deaths",0])+1,true];
    [player, (player_current_lives-1)] call BRM_RespawnSystem_fnc_setLives;
    player_current_lives = player_current_lives - 1;
};