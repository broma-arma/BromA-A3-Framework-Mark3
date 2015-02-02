// ====================================================================================
// BRIEFING GOES ON HERE
//[] execVM CUSTOM_FILES_PATH+"credits.sqf";

switch (side player) do {
    case WEST : {
        ["LOCAL", "F_LOG", "PLAYER: ASSIGNING WEST BRIEFING"] call BRM_fnc_doLog;
        #include "briefing-west.sqf";
    };
    case EAST : {
        ["LOCAL", "F_LOG", "PLAYER: ASSIGNING EAST BRIEFING"] call BRM_fnc_doLog;
        #include "briefing-east.sqf";
    };
    case RESISTANCE : {
        ["LOCAL", "F_LOG", "PLAYER: ASSIGNING INDEPENDENT BRIEFING"] call BRM_fnc_doLog;
        #include "briefing-ind.sqf";
    };
    case CIVILIAN : {
        ["LOCAL", "F_LOG", "PLAYER: ASSIGNING CIVILIAN BRIEFING"] call BRM_fnc_doLog;
        #include "briefing-civ.sqf";
    };
};