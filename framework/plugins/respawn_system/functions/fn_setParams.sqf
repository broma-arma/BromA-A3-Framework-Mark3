// =============================================================================
//  Enable respawn
// =============================================================================

switch (param_allow_respawn) do {
    case 0: { mission_allow_respawn = false };
    case 1: { mission_allow_respawn = true };
};

// =============================================================================
//  Player lives
// =============================================================================

switch (param_player_lives) do {
    case 0: { mission_player_lives = 1 };
    case 1: { mission_player_lives = 3 };
    case 2: { mission_player_lives = 5 };
    case 3: { mission_player_lives = 10 };
};

// =============================================================================