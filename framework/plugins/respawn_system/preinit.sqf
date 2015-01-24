if (isNil "deadPlayersArray") then { deadPlayersArray = [] };
if (isNil "playerLives") then { playerLives = [] };
_path = _this select 0;

BRM_fnc_removeFromMission = compile preprocessFileLineNumbers (_path+"fn_removeFromMission.sqf");
BRM_fnc_callRespawn = compile preprocessFileLineNumbers (_path+"fn_callRespawn.sqf");
BRM_fnc_setLives = compile preprocessFileLineNumbers (_path+"fn_setLives.sqf");
BRM_fnc_getLives = compile preprocessFileLineNumbers (_path+"fn_getLives.sqf");
BRM_fnc_onRespawnLives = compile preprocessFileLineNumbers (_path+"fn_onRespawn.sqf");
BRM_fnc_killPlayer = compile preprocessFileLineNumbers (_path+"fn_killPlayer.sqf");

if (hasInterface) then {
    currentLives = [player] call BRM_fnc_getLives;

    player addEventHandler ["Respawn", {[player] call BRM_fnc_onRespawnLives}];
};