    
// ============================================================================
//                                                                             |
//   This is where you set the plugin parameters for your mission, have fun!   |
//                                                                             |
// ============================================================================

// ============================================================================
//                           ACE Medical System                                |
// ============================================================================


// Medical Settings ===========================================================


// Enables litter and discards upon treatment.
// true/false
ACE_medicalTreatment_allowLitter = true;

// Delay for removing litter objects in seconds.
// number (seconds) -1 is forever
ACE_medicalTreatment_litterRemove = 3000;

// Enable screams of pain.
// true/false
ACE_Medical_screams = true;

// Damage a player can take before being killed
// default : 1
ACE_Medical_playerDamage = 1;

// Damage the ai can take before being killed
// default : 1
ACE_Medical_aiDamage = 1;

// Enables AI going unconcious.
// 0 = disabled; 1 = 50/50; 2 = enabled
ACE_Medical_unconAI = 0;

// Prevents units from dying instantly and makes them unconcious instead.
// true/false
ACE_Medical_preventInstaDeath = true;

// Coefficient to modify the bleeding speed
// default : 1
ACE_Medical_bleeding = 1;

// Coefficient to modify the pain
// default : 1
ACE_Medical_pain = 1;


// Advanced Medical Settings ===================================================


// Select what units the medical system will be enabled for (adv only).
// 0 = players; 1 = players and AI
ACE_Medical_enableFor = 0;

// Enable wounds reopening.
// true/false
ACE_Medical_advWounds = false;

// Enable damage from vehicle crashes
// true/false
ACE_Medical_Veh = true;

// Who can use the PAK?
// 0 = anyone; 1 = medics; 2 = doctors
ACE_medicalTreatment_usePAK = 1;

// Consume PAK on treatment
// 0 = no; 1 = yes
ACE_medicalTreatment_consumePAK = 0;

// Locations enabled for PAK use
// 0 = anywhere; 1 = medical vehicles; 2 = medical facilities; 3 = medical vehicles and facilities; 4 = disabled
ACE_medicalTreatment_usePAKLocation = 0;

// Who can use the surgical kit?
// 0 = anyone; 1 = medics; 2 = doctors
ACE_medicalTreatment_useSurgKit = 1;

// Consume a Surgical Kit on treatment
// 0 = no; 1 = yes
ACE_medicalTreatment_consumeSurgKit = 0;

// Locations enabled for Surgical Kit use
// 0 = anywhere; 1 = medical vehicles; 2 = medical facilities; 3 = medical vehicles and facilities; 4 = disabled
ACE_medicalTreatment_useSurgKitLocation = 3;
