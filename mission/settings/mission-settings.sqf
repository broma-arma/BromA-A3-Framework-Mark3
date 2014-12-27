

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

missionAuthorName = "Mission Maker";
missionVersion =    "v0";

// ============================================================================
//                          == MISSION GAMEMODE ==                             |

//                      What is the type of mission?                           |
//              "coop" - Cooperative missions, players against AI.             |         
//         "tvt" - Team vs Team, each group of players fight each other.       |
//     "cotvt" - Same as a COOP, but with enemy players on the other side.     |
//                                                                             |
// ============================================================================

missionGameMode = "coop";

// ============================================================================
//                          ==   LOADOUT MODE   ==                             |

//              Configures how the units' loadout will be loaded.              |
//                                                                             |
//     "classic" will load the units using the default framework method.       |
//     "arsenal" uses arsenal loadouts and load them straight up.              |
//     "disabled" makes units use their default loadouts.                      |
//                                                                             |
//     NOTE: Currently, only the Arsenal loadouts are supported for DAC AI.    |
// ============================================================================

loadoutStylePlayer = "arsenal";
loadoutStyleAI =     "arsenal";

// ============================================================================
//                        == PLAYERS INFORMATION ==                            |

//            Edit this value with the side the players belong to.             |
//                            Valid values are:                                |         
//                                                                             |
//                          west, east, resistance                             |
//
//   Valid colors are: "blue","red","green","white","black" and "yellow".      |
//
//   FactionName is the name which will be displayed on the ending screens.    |
// ============================================================================

sideA_Side = west;            // Side the players belong to
sideA_Color = "blue";         // Color of the player side.
sideA_Name = "NATO";          // Player faction name.

// =============================================================================

sideB_Side = east;            // Side the enemies belong to
sideB_Color = "red";          // Color of the enemy side.
sideB_Name = "CSAT";          // Enemy faction.

// =============================================================================

DAC_Res_Side = 1;                    // Side the independent are friendly to:
                                     // 0: EAST / 1: WEST / 2: NOBODY
                                     // (MUST BE THE SAME AS THE EDITOR!)

// ============================================================================
//                            == CASUALTY CAP ==                               |

//          Whenever a percentage of the selected group(s) is dead,            |
//                       a certain ending is called.                           |
//        http://ferstaberinde.com/f2/en/index.php?title=Casualties_Cap        |
// ============================================================================
useCasualtyCap = false;                         // Enable module - true or false.

    casualtyGroupPlayer = [alpha_grp_blu1, alpha_grp_blu2, bravo_grp_blu1, bravo_grp_blu2, charlie_grp_blu1, charlie_grp_blu2, delta_grp_blu1, delta_grp_blu2];
    // Casualty groups for the Player group
    
    casualtyGroupEnemy =  [alpha_grp_op1, alpha_grp_op2, bravo_grp_op1, bravo_grp_op2, charlie_grp_op1, charlie_grp_op2, delta_grp_op1, delta_grp_op2];
    // Casualty group for the Enemy group - Ignore if COOP
    
// =============================================================================

// =============================================================================
//                         == EVADE AND ESCAPE ==                              |

//        Called when a certain group approaches a certain object.             |
//     http://ferstaberinde.com/f2/en/index.php?title=Group_E%26E_Check        |
// =============================================================================
useEEcheck = false;                             // Enable module - true or false.

    EEGroupName = grpNull;                          // Group to be checked.
    EEObjectName = nil;                         // Object to be checked.
    EEdistance = 100;                           // Proximity necessary.
// ============================================================================= 

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
//                           == BODY REMOVAL ==                                |

//            Removes dead bodies after a certain amount of time.              |
//    http://ferstaberinde.com/f2/en/index.php?title=Automatic_Body_Removal    |
// =============================================================================
useBodyRemoval = true;                          // Enable module - true or false.
    f_removeBodyDelay = 60;                     // Time in seconds for removal.
    f_doNotRemoveBodies = [];                   // Units whose body won't vanish. 
// ============================================================================= 

// =============================================================================
//                            == COIN MODULE ==                                |

//          Change settings at the broma\coinSettings.sqf file.                |
// http://ferstaberinde.com/f2/en/index.php?title=Construction_Interface_%28COIN%29_Presets
// =============================================================================
useCoinModule = false;
// =============================================================================           

// =============================================================================
//                           == ALLOW JIP ==                                   |

//      If this value is set to false, JIPs will be removed upon joining.      |
// =============================================================================    
allowJIP = true;
// =============================================================================

// =============================================================================
//                        == SPAWN PROTECTION ==                               |

//        Creates a spawn protection zone around the player(s)' respawn        |
// ============================================================================= 
useSpawnProtection = true;                      // Enable module - true or false.

    spawnSize = 50;                              // Size of the area.
    
    setupSize = 50;                              // Size of the Setup Zone for TVTs - ignore if COOP        
// =============================================================================

// =============================================================================
//                            == RESPAWN TYPE ==                               |
//                                                                             |
//               Where will a player who has just died go to?                  |
//  Keep in mind that this is different from the default respawn types in the  |
//             description.ext file, which should remain unchanged.            |
//                                                                             |
// Valid types are:                                                            |
//              "BASE": sends the player to it's valid respawn marker.         |
//              "LEADER": teleports to the group leader or other member.       |
//              "LAST": player goes back to the spot where he died.            |
// =============================================================================

respawnType = "BASE";

// =============================================================================
//        This is a list with all playable units, for DAC to use:              |
//                     add or remove as necessary.                             |

//                 Chances are you can just leave this alone.                  |
// =============================================================================
DAC_STRPlayers = [
// =============================================================================

//                     ==== BLUFOR 1st PLATOON ====

             "Zero69Actual","Platoon69Medic","Zero69RTO",
                
                     "Alpha69Actual","Alpha69Corpsman",
                   "FTL691_Alpha_1_1","FTL692_Alpha_2_1",
                 "Alpha691692","Alpha691693","Alpha691694",
                 "Alpha692692","Alpha692693","Alpha692694",
                 
                    "Bravo69Actual","Bravo69Corpsman",
                   "FTL691_Bravo_1_1","FTL692_Bravo_2_1",
                 "Bravo691692","Bravo691693","Bravo691694",
                 "Bravo692692","Bravo692693","Bravo692694",
                 
                    "Charlie69Actual","Charlie69Corpsman",
                  "FTL691_Charlie_1_1","FTL692_Charlie_2_1",
                "Charlie691692","Charlie691693","Charlie691694",
                "Charlie692692","Charlie692693","Charlie692694",
                
                    "Delta69Actual","Delta69Corpsman",
                   "FTL691_Delta_1_1","FTL692_Delta_2_1",
                  "Delta691692","Delta691693","Delta691694",
                  "Delta692692","Delta692693","Delta692694",

           "Omega691691","Omega691692","Omega691693","Omega691694",
           
        "Pegasus691691","Pegasus691692","Pegasus692691","Pegasus692692",
        
                    "Hermes69Actual","Hermes692","Hermes693",

                    "Titan69Actual","Titan692","Titan693",
                "Lance69169Actual","Lance691692","Lance691693",
                "Lance69269Actual","Lance692692","Lance692693",

                             "Haris69Press",
                             
// =============================================================================

// =============================================================================

//                        ==== OPFOR 1st PLATOON ====

                "Zero69Actual_op","Platoon69Medic_op","Zero69RTO_op",
                
                     "Alpha69Actual_op","Alpha69Corpsman_op",
                   "FTL691_Alpha_1_1_op","FTL692_Alpha_2_1_op",
                 "Alpha691692_op","Alpha691693_op","Alpha691694_op",
                 "Alpha692692_op","Alpha692693_op","Alpha692694_op",
                 
                    "Bravo69Actual_op","Bravo69Corpsman_op",
                   "FTL691_Bravo_1_1_op","FTL692_Bravo_2_1_op",
                 "Bravo691692_op","Bravo691693_op","Bravo691694_op",
                 "Bravo692692_op","Bravo692693_op","Bravo692694_op",
                 
                    "Charlie69Actual_op","Charlie69Corpsman_op",
                  "FTL691_Charlie_1_1_op","FTL692_Charlie_2_1_op",
                "Charlie691692_op","Charlie691693_op","Charlie691694_op",
                "Charlie692692_op","Charlie692693_op","Charlie692694_op",
                
                    "Delta69Actual_op","Delta69Corpsman_op",
                   "FTL691_Delta_1_1_op","FTL692_Delta_2_1_op",
                  "Delta691692_op","Delta691693_op","Delta691694_op",
                  "Delta692692_op","Delta692693_op","Delta692694_op",

           "Omega691691_op","Omega691692_op","Omega691693_op","Omega691694_op",
           
        "Pegasus691691_op","Pegasus691692_op","Pegasus692691_op","Pegasus692692_op",
        
                    "Hermes69Actual_op","Hermes692_op","Hermes693_op",

                    "Titan69Actual_op","Titan692_op","Titan693_op",
                "Lance69169Actual_op","Lance691692_op","Lance691693_op",
                "Lance69269Actual_op","Lance692692_op","Lance692693_op",
                             
// =============================================================================

// =============================================================================

//                      ==== INDEPENDENT 1st PLATOON ====

               "Zero69Actual_ind","Platoon69Medic_ind","Zero69RTO_ind",
                
                     "Alpha69Actual_ind","Alpha69Corpsman_ind",
                   "FTL691_Alpha_1_1_ind","FTL692_Alpha_2_1_ind",
                 "Alpha691692_ind","Alpha691693_ind","Alpha691694_ind",
                 "Alpha692692_ind","Alpha692693_ind","Alpha692694_ind",
                 
                    "Bravo69Actual_ind","Bravo69Corpsman_ind",
                   "FTL691_Bravo_1_1_ind","FTL692_Bravo_2_1_ind",
                 "Bravo691692_ind","Bravo691693_ind","Bravo691694_ind",
                 "Bravo692692_ind","Bravo692693_ind","Bravo692694_ind",
                 
                    "Charlie69Actual_ind","Charlie69Corpsman_ind",
                  "FTL691_Charlie_1_1_ind","FTL692_Charlie_2_1_ind",
                "Charlie691692_ind","Charlie691693_ind","Charlie691694_ind",
                "Charlie692692_ind","Charlie692693_ind","Charlie692694_ind",
                
                    "Delta69Actual_ind","Delta69Corpsman_ind",
                   "FTL691_Delta_1_1_ind","FTL692_Delta_2_1_ind",
                  "Delta691692_ind","Delta691693_ind","Delta691694_ind",
                  "Delta692692_ind","Delta692693_ind","Delta692694_ind",

           "Omega691691_ind","Omega691692_ind","Omega691693_ind","Omega691694_ind",
           
        "Pegasus691691_ind","Pegasus691692_ind","Pegasus692691_ind","Pegasus692692_ind",
        
                    "Hermes69Actual_ind","Hermes692_ind","Hermes693_ind",

                    "Titan69Actual_ind","Titan692_ind","Titan693_ind",
                "Lance69169Actual_ind","Lance691692_ind","Lance691693_ind",
                "Lance69269Actual_ind","Lance692692_ind","Lance692693_ind"
                             
// =============================================================================

];
// =============================================================================
// =============================================================================