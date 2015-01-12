if (isNil "deadPlayersArray") then { deadPlayersArray = [] };
if (isNil "playerLives") then { playerLives = [] };

BRM_fnc_removeFromMission = compile preprocessFileLineNumbers "framework\plugins\respawn_system\fn_removeFromMission.sqf";
BRM_fnc_callRespawn = compile preprocessFileLineNumbers "framework\plugins\respawn_system\fn_callRespawn.sqf";
BRM_fnc_setLives = compile preprocessFileLineNumbers "framework\plugins\respawn_system\fn_setLives.sqf";
BRM_fnc_getLives = compile preprocessFileLineNumbers "framework\plugins\respawn_system\fn_getLives.sqf";
BRM_fnc_onRespawnLives = compile preprocessFileLineNumbers "framework\plugins\respawn_system\fn_onRespawn.sqf";

if (!isDedicated) then {
    currentLives = [player] call BRM_fnc_getLives;

    player addEventHandler ["Respawn", {[player] call BRM_fnc_onRespawnLives}];
};