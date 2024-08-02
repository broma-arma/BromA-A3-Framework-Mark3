// ============================================================================
//                                                                             |
//                    Executes all mission Briefings.                          |
//                                                                             |
// ============================================================================

0 spawn {

private ["_radioChannel", "_radioFreq"];

_autoRadio = ("radiofreq" in usedPlugins);

[] execVM "broma_framework\credits.sqf";

switch (side player) do {
    case BLUFOR : {
        if (_autoRadio) then {
			waitUntil { (!isNil "mission_radiochannels_BLU") };
			waitUntil { (!isNil "mission_radiochannels_add_BLU") };
			_radioChannel = mission_radiochannels_BLU;
			_radioFreq = mission_radiochannels_add_BLU
		};
        ["LOCAL", "F_LOG", "PLAYER: ASSIGNING BLUFOR BRIEFING"] call BRM_FMK_fnc_doLog;
        #include "briefing-blufor.sqf";
    };
    case OPFOR : {
        if (_autoRadio) then {
			waitUntil { (!isNil "mission_radiochannels_OP") };
			waitUntil { (!isNil "mission_radiochannels_add_OP") };
			_radioChannel = mission_radiochannels_OP;
			_radioFreq = mission_radiochannels_add_OP
		};
        ["LOCAL", "F_LOG", "PLAYER: ASSIGNING OPFOR BRIEFING"] call BRM_FMK_fnc_doLog;
        #include "briefing-opfor.sqf";
    };
    case INDEPENDENT : {
        if (_autoRadio) then {
			waitUntil { (!isNil "mission_radiochannels_IND") };
			waitUntil { (!isNil "mission_radiochannels_add_IND") };
			_radioChannel = mission_radiochannels_IND;
			_radioFreq = mission_radiochannels_add_IND
		};
        ["LOCAL", "F_LOG", "PLAYER: ASSIGNING INDFOR BRIEFING"] call BRM_FMK_fnc_doLog;
        #include "briefing-indfor.sqf";
    };
    case CIVILIAN : {
        if (_autoRadio) then {
			waitUntil { (!isNil "mission_radiochannels_CIV") };
			waitUntil { (!isNil "mission_radiochannels_add_CIV") };
			_radioChannel = mission_radiochannels_CIV;
			_radioFreq = mission_radiochannels_add_CIV
		};
        ["LOCAL", "F_LOG", "PLAYER: ASSIGNING CIVFOR BRIEFING"] call BRM_FMK_fnc_doLog;
        #include "briefing-civfor.sqf";
    };
};

};
