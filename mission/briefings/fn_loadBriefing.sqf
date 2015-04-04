
// ============================================================================
//                                                                             |
//                    Executes all mission Briefings.                          |
//                                                                             |
// ============================================================================

0 spawn {
    
private ["_radioChannel", "_radioFreq"];

_autoRadio = ("radiofreq" in usedPlugins);

[] execVM "framework\credits.sqf";

switch (side player) do {
    case WEST : {
        if (_autoRadio) then {
        waitUntil{(!isNil "mission_radiochannels_BLU")}; 
        waitUntil{(!isNil "mission_radiochannels_add_BLU")};
        _radioChannel = mission_radiochannels_BLU;
        _radioFreq = mission_radiochannels_add_BLU};
        ["LOCAL", "F_LOG", "PLAYER: ASSIGNING WEST BRIEFING"] call BRM_fnc_doLog;
        #include "briefing-west.sqf";
    };
    case EAST : {
        if (_autoRadio) then { 
        waitUntil{(!isNil "mission_radiochannels_OP")}; 
        waitUntil{(!isNil "mission_radiochannels_add_OP")};
        _radioChannel = mission_radiochannels_OP;
        _radioFreq = mission_radiochannels_add_OP};
        ["LOCAL", "F_LOG", "PLAYER: ASSIGNING EAST BRIEFING"] call BRM_fnc_doLog;
        #include "briefing-east.sqf";
    };
    case RESISTANCE : {
        if (_autoRadio) then { 
        waitUntil{(!isNil "mission_radiochannels_IND")}; 
        waitUntil{(!isNil "mission_radiochannels_add_IND")};
        _radioChannel = mission_radiochannels_IND;
        _radioFreq = mission_radiochannels_add_IND};
        ["LOCAL", "F_LOG", "PLAYER: ASSIGNING INDEPENDENT BRIEFING"] call BRM_fnc_doLog;
        #include "briefing-ind.sqf";
    };
    case CIVILIAN : {
        if (_autoRadio) then { 
        waitUntil{(!isNil "mission_radiochannels_CIV")}; 
        waitUntil{(!isNil "mission_radiochannels_add_CIV")};
        _radioChannel = mission_radiochannels_CIV;
        _radioFreq = mission_radiochannels_add_CIV};
        ["LOCAL", "F_LOG", "PLAYER: ASSIGNING CIVILIAN BRIEFING"] call BRM_fnc_doLog;
        #include "briefing-civ.sqf";
    };
};

};