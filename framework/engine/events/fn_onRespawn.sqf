private["_lives","_index"];

waitUntil {(alive player)};
currentLives = [player] call BRM_fnc_getLives;

if (((currentLives) == 0) || !(mission_allow_respawn)) then {
    {
        if ((_x select 0) == (getplayerUID player)) then {
            playerLives set [_forEachIndex, [(getPlayerUID player), (name player), 0]]; publicVariable "playerLives";
        };
    } forEach playerLives;
    
    deadPlayersArray pushBack [(getPlayerUID player), (name player)];
    publicVariable "deadPlayersArray";

    [player] spawn BRM_fnc_removeFromMission;
    
} else {
    {
        if ((_x select 0) == (getplayerUID player)) exitWith {
            playerLives set [_forEachIndex, [(getPlayerUID player), (name player), (currentLives-1)]]; publicVariable "playerLives";
        }
    } forEach playerLives;
};