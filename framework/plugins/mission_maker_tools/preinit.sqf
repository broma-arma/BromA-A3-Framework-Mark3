if (isMultiplayer) exitWith {};

fnc_teleport = {
    #include "mapTeleport.sqf"
};

fnc_openArsenal = {
["Open",true] spawn BIS_fnc_arsenal;
};

while {true} do {
    teleportAction = player addaction ["Teleport to map", fnc_teleport,"", 0, false, true];
    arsenalAction = player addAction ["Open Virtual Arsenal", fnc_openArsenal, "", 0, false, true];
    waitUntil {!alive player};
    waitUntil {alive player};
    sleep 1;
};