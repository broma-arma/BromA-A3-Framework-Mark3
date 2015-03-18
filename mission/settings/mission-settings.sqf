mission_settings_loaded = false;

// ============================================================================
//                                                                             |
//    This is where you edit the mission values for your mission, have fun!    |
//                                                                             |
// ============================================================================

// ============================================================================
//                       == CREDITS AND VERSION ==                             |
//                                                                             |
//      Before we get started, write down the author name and the mission      |
//          version just so you can keep track of the credits easier!          |
//                                                                             |
// ============================================================================

mission_author_name = ["Mission Maker"];
mission_version =    "v0";

// ============================================================================
//                          == MISSION GAMEMODE ==                             |
//                                                                             |
//                      What is the type of mission?                           |
//              "coop" - Cooperative missions, players against AI.             |         
//         "tvt" - Team vs Team, each group of players fight each other.       |
//     "cotvt" - Same as a COOP, but with enemy players on the other side.     |
//                                                                             |
// ============================================================================

mission_game_mode = "COOP";

// ============================================================================
//                          ==   LOADOUT MODE   ==                             |
//                                                                             |
//           Determines if players will get any loadouts at all.               |
//                                                                             |
// ============================================================================

units_player_useVanillaGear = false;
units_AI_useVanillaGear = false;

// ============================================================================
//                        == PLAYERS INFORMATION ==                            |
//                                                                             |
//            Edit this value with the side the players belong to.             |
//                            Valid values are:                                |         
//                                                                             |
//                         west, east, resistance                              |
//                                                                             |
//   Valid colors are: "blue","red","green","white","black" and "yellow".      |
//                                                                             |
// ============================================================================

side_a_side = west;                 // Side the players belong to
side_a_color = "blue";              // Color of the player side.
side_a_faction = "RACS";            // Faction of the players.
side_a_name = "BLUE FORCES";        // Player faction name.

// Name the player groups.
side_a_callsigns = ["Zero", "Alpha", "Bravo", "Charlie", "Delta", "Razor", "Sierra", "Wizard", "Shocker", "Paradise", "Meteor", "Lancer", "Titan", "Havoc", "Pegasus"];

// =============================================================================

side_b_side = east;                 // Side the enemies belong to
side_b_color = "red";               // Color of the enemy side.
side_b_faction = "SLA";             // Enemy faction.
side_b_name = "OPPOSING FORCES";    // Enemy faction name.

// Name the enemy groups.
side_b_callsigns = ["Godfather", "Anaconda", "Boa", "Cobra", "Dragon",  "Raven", "Scorpion", "Weasel", "Sparrow", "Pelican", "Moose", "Lion", "Tiger", "Hawk", "Phoenix"];

// =============================================================================

mission_enable_side_c = false;

// =============================================================================

side_c_side = resistance;           // Side of third faction.
side_c_color = "green";             // Color of the third faction.
side_c_faction = "ahkma-pmc";       // Third side's faction.
side_c_name = "AAF";                // Name of the third faction.

// Name the third faction's groups.
side_c_callsigns = ["Papa", "Anna", "Beatrice", "Clara", "Denise",  "Rose", "Sarah", "Whitney", "Shirley", "Penny", "Mary", "Lucy", "Tanya", "Helen", "Petunia"];

// =============================================================================

DAC_Res_Side = 1;                    // Side the independent are friendly to:
                                     // 0: EAST / 1: WEST / 2: NOBODY
                                     // (MUST BE THE SAME AS THE EDITOR!)

// ============================================================================
//                              == ENDINGS ==                                  |
//                                                                             |
//        These are the endings that are called when conditions are met.       |
//                                                                             |
//            Some can be ignored if you aren't using the plugin.              |
//                                                                             |
// ============================================================================

endings_victory = "victory";                    // (COOP) Objectives completed.
endings_defeat = "defeat";                      // (COOP) Critical objective failed.

endings_civilians_killed = "defeat";            // (COOP) Max number of civies killed.
endings_time_over = "defeat";                   // (COOP) Time limit reached. 

endings_tvt_auto = "tvt_end";                   // (TVT) Maximum casualties reached - default TVT ending!

endings_tvt_side_a_victory = "side_a_victory";  // (TVT) Side A wins the mission.
endings_tvt_side_b_victory = "side_b_victory";  // (TVT) Side B wins the mission.
endings_tvt_side_c_victory = "side_c_victory";  // (TVT) Side C wins the mission.

endings_tvt_side_a_defeat = "side_a_defeat";    // (TVT) Side A wins the mission.
endings_tvt_side_b_defeat = "side_a_defeat";    // (TVT) Side B wins the mission.
endings_tvt_side_c_defeat = "side_a_defeat";    // (TVT) Side C wins the mission.

// ============================================================================

// ============================================================================
//                           == ALLOW JIP ==                                   |
//                                                                             |
//      If this value is set to false, JIPs will be removed upon joining.      |
//                                                                             |
// ============================================================================

mission_allow_jip = true;

// =============================================================================
//  Load the plugin settings file.
// =============================================================================

#include "plugin-settings.sqf"

// =============================================================================
mission_settings_loaded = true;