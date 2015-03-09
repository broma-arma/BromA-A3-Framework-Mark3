private ["_winningSides","_losingSides","_title","_reason","_showStats","_endNumber"];

switch (_this select 0) do {
    
// ============================================================================
//             ENDING FOR WHEN THE PLAYERS WIN A COOP MISSION                  |
// ============================================================================
    case "victory": 
    {
        _winningSides = [side_a_side];
        _losingSides = [side_b_side, side_c_side];
        _showStats = true;
        _title = "Mission completed!";
        _reason = "%1 have completed all their objectives!";
        _endNumber = 1;
    };    
// ============================================================================
//                    ... AND FOR WHEN THEY DON'T                              |
// ============================================================================    
    case "defeat": 
    {
        _winningSides = [];
        _losingSides = [side_a_side];
        _showStats = true;
        _title = "Mission failed.";
        _reason = "%1 failed the mission.";
        _endNumber = 2;
    };
// ============================================================================
//     GENERIC TVT ENDING, AUTOMATICALLY DECIDES THE WINNER BASED ON KILLS     |
// ============================================================================    
    case "tvt_end": 
    {
        _winningSides = [];
        _losingSides = [];
        _showStats = true;
        _title = "Mission over.";
        _reason = "*";
        _endNumber = 2;
    };
// ============================================================================
//                           SIDE_A TVT VICTORY                                |
// ============================================================================    
    case "side_a": 
    {
        _winningSides = [side_a_side];
        _losingSides = [side_b_side, side_c_side];
        _showStats = true;
        _title = "Mission over.";
        _reason = "%1 won the mission and defeated %2.";
        _endNumber = 3;
    };
// ============================================================================
//                           SIDE_B TVT VICTORY                                |
// ============================================================================    
    case "side_b":
    {
        _winningSides = [side_b_side];
        _losingSides = [side_c_side, side_c_side];
        _showStats = true;
        _title = "Mission over.";
        _reason = "%1 won the mission and defeated %2.";
        _endNumber = 3;
    }; 
// ============================================================================
//                           SIDE_C TVT VICTORY                                |
// ============================================================================    
    case "side_c": 
    {
        _winningSides = [side_c_side];
        _losingSides = [side_b_side, side_a_side];
        _showStats = true;
        _title = "Mission over.";
        _reason = "%1 won the mission and defeated %2.";
        _endNumber = 3;
    };
// ============================================================================
//                            CUSTOM ENDING                                    |
// ============================================================================    
    case "custom": 
    {
        _winningSides = [side_a_side,side_b_side,side_c_side];
        _losingSides = [side_a_side,side_b_side,side_c_side];
        _showStats = true;
        _title = "The mission is over, maybe?";
        _reason = "%1 defeated %2.";
        _endNumber = 1;
    };
};

// =============================================================================

mission_ending_details = [_winningSides, _losingSides, _showStats, _title, _reason, _endNumber];
publicVariable "mission_ending_details";