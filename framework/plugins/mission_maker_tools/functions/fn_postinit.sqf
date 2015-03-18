
if (isMultiplayer) exitWith {};

fnc_teleport = {
    #include "mapTeleport.sqf"
};

fnc_openArsenal = {
    ["Open",true] spawn BIS_fnc_arsenal;
};

fnc_stopAI = {
    { _x stop true } forEach allUnits;
};

fnc_initAI = {
    { if (!(isPlayer _x)&&(_x isKindOf "CAManBase")) then { [_x, "auto"] call BRM_fnc_initAI }  } forEach allUnits;
};

teleportAction = player addaction ["Teleport", fnc_teleport,"", 0, false, true];
stopAIAction = player addAction ["Stop AI", fnc_stopAI, "", 0, false, true];
initAIAction = player addAction ["Initialize all AI", fnc_initAI, "", 0, false, true];
arsenalAction = player addAction ["Open Virtual Arsenal", fnc_openArsenal, "", 0, false, true];