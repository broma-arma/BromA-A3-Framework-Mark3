
// =============================================================================
//  ACE Revive Time
// =============================================================================

switch (param_ace3_revive_time) do {
    case 0: { mission_ace3_revive_time = 1 ; mission_ace3_revive_enable = 0 };
    case 1: { mission_ace3_revive_time = 120 };
    case 2: { mission_ace3_revive_time = 300 };
    case 3: { mission_ace3_revive_time = 600 };
    case 4: { mission_ace3_revive_time = -1 };
};

// =============================================================================
//  ACE Revive Lives
// =============================================================================

switch (param_ace3_revive_lives) do {
    case 0: { mission_ace3_revive_lives = 0 ; mission_ace3_revive_enable = 0 };
    case 1: { mission_ace3_revive_lives = 1 };
    case 2: { mission_ace3_revive_lives = 3 };
    case 3: { mission_ace3_revive_lives = 5 };
    case 4: { mission_ace3_revive_lives = 9999 };
};

// =============================================================================
//  ACE Medical level
// =============================================================================

switch (param_ace3_medical_level) do {
    case 0: { mission_ace3_medical_level = 1; };
    case 1: { mission_ace3_medical_level = 2; };
};

// =============================================================================
//  ACE Medical level
// =============================================================================

switch (param_ace3_everyone_medic) do {
    case 0: { mission_ace3_everyone_medic = false; };
    case 1: { mission_ace3_everyone_medic = true; };
};


// =============================================================================

