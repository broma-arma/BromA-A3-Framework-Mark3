
// INFO ========================================================================
/*

    SPRG Report is the most dedicated team of impetuous war-crawlers, ready to turn
    massacres and genocides into coverage for the highest paying news station.
	
    Ever since the conflict between CSAT and NATO broke out, their schedule has
    been very, very busy.
	
*/

_defaultSide = WEST;
_defaultVoice = [_voiceAMERICAN];
_defaultFace = [_faceWHITE];
_defaultInsignia = "";

// =============================================================================
if (!_isMan) exitWith {};
switch (true) do {
// ============================================================================= 
    
    case (_type == "reporter"): {
        ["empty", "rds_uniform_Functionary1", "V_Press_F", "empty"] call _useUniform;
        [[_unit,[_NVGEN1,1]]] call _addtoUniform;
    };
    
    case (_type == "cameraman"): {
        ["H_Cap_press", "U_C_Journalist", "V_Press_F", "empty"] call _useUniform;
        [[_unit,[_NVGEN1,1]]] call _addtoUniform;
        _unit addWeapon "R3F_JIM_LR";
    };
};

// ADDS ESSENTIALS =============================================================

["ItemMap", "ItemCompass", "ItemWatch"] call _linkItem;