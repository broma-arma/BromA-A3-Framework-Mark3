
// ============================================================================
//                                                                             |
//                    Executes all mission Briefings.                          |
//                                                                             |
// ============================================================================

private ["_radioFreqs"];

_autoRadio = ("auto_radio_freq" in usedPlugins);

[] execVM "framework\credits.sqf";

switch (side player) do {
    case WEST : {
        if (_autoRadio) then { waitUntil{(!isNil "mission_radiochannels_BLU")}; _radioFreqs = mission_radiochannels_BLU };
        ["LOCAL", "F_LOG", "PLAYER: ASSIGNING WEST BRIEFING"] call BRM_fnc_doLog;
        #include "briefing-west.sqf";
    };
    case EAST : {
        if (_autoRadio) then { waitUntil{(!isNil "mission_radiochannels_OP")}; _radioFreqs = mission_radiochannels_OP };
        ["LOCAL", "F_LOG", "PLAYER: ASSIGNING EAST BRIEFING"] call BRM_fnc_doLog;
        #include "briefing-east.sqf";
    };
    case RESISTANCE : {
        if (_autoRadio) then { waitUntil{(!isNil "mission_radiochannels_IND")}; _radioFreqs = mission_radiochannels_IND };
        ["LOCAL", "F_LOG", "PLAYER: ASSIGNING INDEPENDENT BRIEFING"] call BRM_fnc_doLog;
        #include "briefing-ind.sqf";
    };
    case CIVILIAN : {
        if (_autoRadio) then { waitUntil{(!isNil "mission_radiochannels_CIV")}; _radioFreqs = mission_radiochannels_CIV };
        ["LOCAL", "F_LOG", "PLAYER: ASSIGNING CIVILIAN BRIEFING"] call BRM_fnc_doLog;
        #include "briefing-civ.sqf";
    };
};