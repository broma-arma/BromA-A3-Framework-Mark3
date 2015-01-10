private["_lives","_index"];

waitUntil {(alive player)};
currentLives = [player] call BRM_fnc_getLives;

if (((currentLives) == 0) || !(mission_allow_respawn)) then {
    
    [player, 0] call BRM_fnc_setLives;
    
    deadPlayersArray pushBack [(getPlayerUID player), (name player)]; publicVariable "deadPlayersArray";

    [player] spawn BRM_fnc_removeFromMission;    
} else {
    [player, (currentLives-1)] call BRM_fnc_setLives;
};