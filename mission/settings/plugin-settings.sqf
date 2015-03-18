    
// ============================================================================
//                                                                             |
//   This is where you set the plugin parameters for your mission, have fun!   |
//                                                                             |
// ============================================================================

// ============================================================================
//                          == INTRO CUTSCENE ==                               |
//                                                                             |
//  Valids are: "ESTABLISHING", "TEXT", "CINEMA" and "NONE".                   |
// ============================================================================

intro_cutscene = "ESTABLISHING";

// ============================================================================
//                         == CH VIEW DISTANCE ==                              |
// ============================================================================

// Allows players to turn grass off - recommended FALSE for TVTs.
CHVD_allowNoGrass = true;

// Max rendering distance for the terrain.
CHVD_maxView = 12000;

// Max rendering distance for objects..
CHVD_maxObj = 12000;

// ============================================================================
//                                                                             |
//                       == AGM MEDICAL SETTINGS ==                            |
//                                                                             |
// ============================================================================

// Non-medic units can use epinephrine and blood bags.
agm_settings_AllowNonmedics = true;

// Unconcious units wake up by themselves after a while.
agm_settings_AutomaticWakeup = true;

// How much a unit bleeds, default 1.
agm_settings_CoefBleeding = 1;

// How much damage a unit takes, default 1.
agm_settings_CoefDamage = 1;

// How harder it is for non-medics to perform medical actions, default 1.
agm_settings_CoefNonMedic = 4;

// How much pain a unit feels, default 1.
agm_settings_CoefPain = 1;

// Player units who are unconcious will not die after being shot again.
agm_settings_PreventDeathWhileUnconscious = true;

// Player units won't die before going unconcious.
agm_settings_PreventInstaDeath = true;

// Require a diagnosis before treating a wounded unit.
agm_settings_RequireDiagnosis = false;

// Require only a single bandage to treat a unit.
agm_settings_SingleBandage = false;

// Disables screams of pain.
agm_settings_DisableScreams = false;

// ============================================================================
//                                                                             |
//                   == TASK FORCE RADIO ALPHA SETTINGS ==                     |
//                                                                             |
// ============================================================================

tf_same_sw_frequencies_for_side = true;

tf_same_lr_frequencies_for_side = true;

tf_no_auto_long_range_radio = true;

TF_give_personal_radio_to_regular_soldier = false;

TF_give_microdagr_to_soldier = false;

// ============================================================================
//                          == COMMANDER LOCK ==                               |
//                                                                             |
// This module stops all of a side's units from entering vehicles or shooting, |
//           until their CO or similarly authorized player says so.            |
// ============================================================================

// What units are authorized to ready their team.
co_lock_units = "[blu_0_0_1, op_0_0_1, ind_0_0_1]";

// If this is enabled, the mission won't start until all sides are ready.
co_lock_tvt_mode = false;

// ============================================================================
//                       == F2's BODY REMOVAL ==                               |
//                                                                             |
//                    Removes the bodies of dead units.                        |
// ============================================================================

// How long until the bodies are removed.
f_var_removeBodyDelay = 120;

// How far do they have to be from a player.
f_var_removeBodyDistance = 300;

// ============================================================================
//                       == F2's CASUALTY CAP ==                               |
//                                                                             |
//        Detects when a percentage of the selected group(s) is dead,          |
//        http://ferstaberinde.com/f2/en/index.php?title=Casualties_Cap        |
// ============================================================================

casualty_group_a = "[blu_1_0, blu_1_1, blu_1_2, blu_2_0, blu_2_1, blu_2_2, blu_3_0, blu_3_1, blu_3_2, blu_4_0, blu_4_1, blu_4_2]";
// Casualty groups for the first side.

casualty_group_b = "[op_1_0, op_1_1, op_1_2, op_2_0, op_2_1, op_2_2, op_3_0, op_3_1, op_3_2, op_4_0, op_4_1, op_4_2]";
// Casualty group for the second side.

casualty_group_c = "[ind_1_0, ind_1_1, ind_1_2, ind_2_0, ind_2_1, ind_2_2, ind_3_0, ind_3_1, ind_3_2, ind_4_0, ind_4_1, ind_4_2]";
// Casualty group for the third side.
    
// ============================================================================
//                              == TIME LIMIT ==                               |
//                                                                             |
//      This setting decides when players will get a reminder of how much      |
//                 time is there still left in the mission.                    |
// ============================================================================

time_alerted_minutes = [120, 60, 15, 1];

// ============================================================================
//                           == FRIENDLY FIRE ==                               |
//                                                                             |
//              Settings related to the friendly fire plugin.                  |
// ============================================================================

// How long it'll take for a friendly fire notification to appear, in minutes.
friendly_fire_timer_minutes = 1;

// Show message when an AI wounds a player.
friendly_fire_count_AI = false;

// ============================================================================
//                                                                             |
//                         == DISABLE RESLOTTING ==                            |
//                                                                             |
// ============================================================================

// How long players have until their current slot is locked (in seconds).
mission_preventreslot_timer = 5 * 60;

// ============================================================================
//                            == CIVILIAN CAP ==                               |
//                                                                             |
//    Sides included here will be held responsible for civilian casualties,    |
//                   if the parameters for such are enabled.                   |
// ============================================================================

responsible_sides = [side_a_side, side_b_side];

// ============================================================================
//                     == SETUP AND SPAWN PROTECTION ==                        |
//                                                                             |
//  Determines how large the setup and spawn protection zones are, in meters.  |
// ============================================================================

spawn_protection_area = 50;

setup_zone_area = 50;

// ============================================================================
//        This is a list with all playable units, for DAC to use:              |
//                     add or remove as necessary.                             |
//                                                                             |
//                 Chances are you can just leave this alone.                  |
// ============================================================================
DAC_STRPlayers = [
//                     ==== BLUFOR 1st PLATOON ====

                  "blu_0_0_1", "blu_0_0_2", "blu_0_0_3",

                        "blu_1_0_1", "blu_1_0_2",
                        "blu_1_1_1", "blu_1_1_2",
                        "blu_1_1_3", "blu_1_1_4",
                        "blu_1_2_1", "blu_1_2_2",
                        "blu_1_2_3", "blu_1_2_4",

                        "blu_2_0_1", "blu_2_0_2",
                        "blu_2_1_1", "blu_2_1_2",
                        "blu_2_1_3", "blu_2_1_4",
                        "blu_2_2_1", "blu_2_2_2",
                        "blu_2_2_3", "blu_2_2_4",

                        "blu_3_0_1", "blu_3_0_2",
                        "blu_3_1_1", "blu_3_1_2",
                        "blu_3_1_3", "blu_3_1_4",
                        "blu_3_2_1", "blu_3_2_2",
                        "blu_3_2_3", "blu_3_2_4",

                        "blu_4_0_1", "blu_4_0_2",
                        "blu_4_1_1", "blu_4_1_2",
                        "blu_4_1_3", "blu_4_1_4",
                        "blu_4_2_1", "blu_4_2_2",
                        "blu_4_2_3", "blu_4_2_4",
                        
                        "blu_5_0_1","blu_5_0_2",
                        "blu_5_0_3","blu_5_0_4",
                        
                        "blu_6_0_1","blu_6_0_2",
                        "blu_6_0_3","blu_6_0_4",
                        
                        "blu_7_0_1","blu_7_0_2",
                        "blu_7_0_3","blu_7_0_4",
                        
                        "blu_8_0_1","blu_8_0_2",
                        "blu_8_0_3",
                        
                        "blu_9_0_1","blu_9_0_2",
                        
                        "blu_10_1_1","blu_10_1_2",
                        "blu11_1_1","blu_11_1_2",
                        "blu_11_1_3",
                        
                        "blu_12_1_1","blu_12_1_2",
                        "blu_12_1_3","blu_12_1_4",
                        
                        "blu_13_1_1","blu_13_1_2",
                        "blu_13_1_3","blu_13_1_4",
                        "blu_13_1_5",
                        
                        "blu_14_2_1","blu_14_2_2",
                        
                        "blu_14_2_1","blu_14_2_2",                   
                             
// =============================================================================

// =============================================================================

//                        ==== OPFOR 1st PLATOON ====

                     "op_0_0_1", "op_0_0_2", "op_0_0_3",

                            "op_1_0_1", "op_1_0_2",
                            "op_1_1_1", "op_1_1_2",
                            "op_1_1_3", "op_1_1_4",
                            "op_1_2_1", "op_1_2_2",
                            "op_1_2_3", "op_1_2_4",

                            "op_2_0_1", "op_2_0_2",
                            "op_2_1_1", "op_2_1_2",
                            "op_2_1_3", "op_2_1_4",
                            "op_2_2_1", "op_2_2_2",
                            "op_2_2_3", "op_2_2_4",

                            "op_3_0_1", "op_3_0_2",
                            "op_3_1_1", "op_3_1_2",
                            "op_3_1_3", "op_3_1_4",
                            "op_3_2_1", "op_3_2_2",
                            "op_3_2_3", "op_3_2_4",

                            "op_4_0_1", "op_4_0_2",
                            "op_4_1_1", "op_4_1_2",
                            "op_4_1_3", "op_4_1_4",
                            "op_4_2_1", "op_4_2_2",
                            "op_4_2_3", "op_4_2_4",
                            
                            "op_5_0_1","op_5_0_2",
                            "op_5_0_3","op_5_0_4",

                            "op_6_0_1","op_6_0_2",
                            "op_6_0_3","op_6_0_4",

                            "op_7_0_1","op_7_0_2",
                            "op_7_0_3","op_7_0_4",

                            "op_8_0_1","op_8_0_2",
                            "op_8_0_3",

                            "op_9_0_1","op_9_0_2",

                            "op_10_1_1","op_10_1_2",
                            "op11_1_1","op_11_1_2",
                            "op_11_1_3",

                            "op_12_1_1","op_12_1_2",
                            "op_12_1_3","op_12_1_4",

                            "op_13_1_1","op_13_1_2",
                            "op_13_1_3","op_13_1_4",
                            "op_13_1_5",

                            "op_14_2_1","op_14_2_2",

                            "op_14_2_1","op_14_2_2",                              
                             
// =============================================================================

// =============================================================================

//                      ==== INDEPENDENT 1st PLATOON ====

                     "ind_0_0_1", "ind_0_0_2", "ind_0_0_3",

                            "ind_1_0_1", "ind_1_0_2",
                            "ind_1_1_1", "ind_1_1_2",
                            "ind_1_1_3", "ind_1_1_4",
                            "ind_1_2_1", "ind_1_2_2",
                            "ind_1_2_3", "ind_1_2_4",

                            "ind_2_0_1", "ind_2_0_2",
                            "ind_2_1_1", "ind_2_1_2",
                            "ind_2_1_3", "ind_2_1_4",
                            "ind_2_2_1", "ind_2_2_2",
                            "ind_2_2_3", "ind_2_2_4",

                            "ind_3_0_1", "ind_3_0_2",
                            "ind_3_1_1", "ind_3_1_2",
                            "ind_3_1_3", "ind_3_1_4",
                            "ind_3_2_1", "ind_3_2_2",
                            "ind_3_2_3", "ind_3_2_4",

                            "ind_4_0_1", "ind_4_0_2",
                            "ind_4_1_1", "ind_4_1_2",
                            "ind_4_1_3", "ind_4_1_4",
                            "ind_4_2_1", "ind_4_2_2",
                            "ind_4_2_3", "ind_4_2_4",
                            
                            "ind_5_0_1","ind_5_0_2",
                            "ind_5_0_3","ind_5_0_4",

                            "ind_6_0_1","ind_6_0_2",
                            "ind_6_0_3","ind_6_0_4",

                            "ind_7_0_1","ind_7_0_2",
                            "ind_7_0_3","ind_7_0_4",

                            "ind_8_0_1","ind_8_0_2",
                            "ind_8_0_3",

                            "ind_9_0_1","ind_9_0_2",

                            "ind_10_1_1","ind_10_1_2",
                            "ind11_1_1","ind_11_1_2",
                            "ind_11_1_3",

                            "ind_12_1_1","ind_12_1_2",
                            "ind_12_1_3","ind_12_1_4",

                            "ind_13_1_1","ind_13_1_2",
                            "ind_13_1_3","ind_13_1_4",
                            "ind_13_1_5",

                            "ind_14_2_1","ind_14_2_2",

                            "ind_14_2_1","ind_14_2_2",
                            
                            "civ_0_0_1","civ_0_0_2"
                             
// =============================================================================
];