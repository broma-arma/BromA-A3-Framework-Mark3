

// =============================================================================
/*
    This is where you set the module parameters for your mission, have fun!    
*/
// =============================================================================

// ============================================================================
//                       == CREDITS AND VERSION ==                             |
//
//      Before we get started, write down the author name and the mission
//          version just so you can keep track of the credits easier!
//
// ============================================================================

mission_author_name = "Mission Maker";
mission_version =    "v0";

// ============================================================================
//                          == MISSION GAMEMODE ==                             |

//                      What is the type of mission?                           |
//              "coop" - Cooperative missions, players against AI.             |         
//         "tvt" - Team vs Team, each group of players fight each other.       |
//     "cotvt" - Same as a COOP, but with enemy players on the other side.     |
//                                                                             |
// ============================================================================

mission_game_mode = "coop";

// ============================================================================
//                          ==   LOADOUT MODE   ==                             |
// ============================================================================

units_player_useVanillaGear = false;
units_AI_useVanillaGear = false;

// ============================================================================
//                        == PLAYERS INFORMATION ==                            |

//            Edit this value with the side the players belong to.             |
//                            Valid values are:                                |         
//                                                                             |
//                         west, east, resistance                              |
//
//   Valid colors are: "blue","red","green","white","black" and "yellow".      |
//
// ============================================================================

side_a_side = west;            // Side the players belong to
side_a_color = "blue";         // Color of the player side.
side_a_faction = "RACS";       // Faction of the players.
side_a_name = "NATO";          // Player faction name.

// =============================================================================

side_b_side = east;            // Side the enemies belong to
side_b_color = "red";          // Color of the enemy side.
side_b_faction = "sla";         // Enemy faction.
side_b_name = "CSAT";          // Enemy faction name.

// =============================================================================

mission_enable_side_c = false;

// =============================================================================

side_c_side = resistance;      // Side of third faction.
side_c_color = "green";        // Color of the third faction.
side_c_faction = "pmc";         // Third side's faction.
side_c_name = "AAF";           // Name of the third faction.

// =============================================================================

DAC_Res_Side = 1;                    // Side the independent are friendly to:
                                     // 0: EAST / 1: WEST / 2: NOBODY
                                     // (MUST BE THE SAME AS THE EDITOR!)

// =============================================================================
//                         == MODULE ENDINGS ==                                |

//        These are the endings that are called when conditions are met.       |

//            Some can be ignored if you aren't using its module.              |
// =============================================================================
genericEnding = 1;                              // Default ending.
casualtyEnding = 1;                             // Maximum casualties reached - default TVT ending!
EEending = 4;                                   // Evade and Escape ending.
missionwinEnd = 3;                              // Objectives completed.
missionfailEnd = 4;                             // Critical objective failed.
civCapEnding = 5;                               // Max number of civies killed.
timeLimitEnding = 6;                            // Time limit reached. 
// =============================================================================           

// =============================================================================
//                           == ALLOW JIP ==                                   |

//      If this value is set to false, JIPs will be removed upon joining.      |
// =============================================================================   

mission_allow_jip = true;

// =============================================================================
// =============================================================================