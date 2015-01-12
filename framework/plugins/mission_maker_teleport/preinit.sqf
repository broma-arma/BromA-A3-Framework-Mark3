if (isMultiplayer) exitWith {};

fnc_teleport = {
    #include "mapTeleport.sqf"
};

while {true} do {
    teleportAction = player addaction ["Teleport", fnc_teleport,"", 0, false, true];
    waitUntil {!alive player};
    waitUntil {alive player};
    sleep 1;
};