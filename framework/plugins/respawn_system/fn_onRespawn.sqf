private["_lives","_index"];

waitUntil {(alive player)};
currentLives = [player] call BRM_fnc_getLives;

if (((currentLives) == 0) || !(mission_allow_respawn)) then {
    
    [player, 0] call BRM_fnc_setLives;
    
    mission_dead_players pushBack [(getPlayerUID player), (name player)]; publicVariable "mission_dead_players";

    [player] spawn BRM_fnc_removeFromMission;    
} else {
    player setVariable ["unit_deaths", (player getVariable ["unit_deaths",0])+1,true];
    [player, (currentLives-1)] call BRM_fnc_setLives;
};