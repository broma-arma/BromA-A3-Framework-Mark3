_path = _this select 0;

if (isNil "mission_dead_players") then { mission_dead_players = [] };
if (isNil "mission_players_lives") then { mission_players_lives = [] };

BRM_fnc_removeFromMission = compile preprocessFileLineNumbers (_path+"fn_removeFromMission.sqf");
BRM_fnc_callRespawn = compile preprocessFileLineNumbers (_path+"fn_callRespawn.sqf");
BRM_fnc_setLives = compile preprocessFileLineNumbers (_path+"fn_setLives.sqf");
BRM_fnc_getLives = compile preprocessFileLineNumbers (_path+"fn_getLives.sqf");
BRM_fnc_onRespawnLives = compile preprocessFileLineNumbers (_path+"fn_onRespawn.sqf");
BRM_fnc_killPlayer = compile preprocessFileLineNumbers (_path+"fn_killPlayer.sqf");

if (hasInterface) then {
    waitUntil{!(isNull player)};
    
    player_current_lives = [player] call BRM_fnc_getLives;

    player addEventHandler ["Respawn", {[player] call BRM_fnc_onRespawnLives}];
    
    if (player_current_lives == 0) then { [player] spawn BRM_fnc_removeFromMission };
};