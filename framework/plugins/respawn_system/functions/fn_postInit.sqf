
if (hasInterface) then {
    
    if (player_is_spectator) exitWith {};
    
    player_current_lives = [player] call BRM_RespawnSystem_fnc_getLives;

    player addEventHandler ["Respawn", {[player] call BRM_RespawnSystem_fnc_onRespawn}];
    
    if (player_current_lives == 0) then { [player] spawn BRM_RespawnSystem_fnc_removeFromMission };
};