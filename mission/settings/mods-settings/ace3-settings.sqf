    
// ============================================================================
//                                                                             |
//   This is where you set the plugin parameters for your mission, have fun!   |
//                                                                             |
// ============================================================================

// ============================================================================
//                           ACE Medical System                                |
// ============================================================================

// GENERAL SETTINGS ============================================================


// AI damage coefficient.
ACE_Medical_aiDamage = 1;

// Player damage coefficient.
ACE_Medical_playerDamage = 1;

// Bleeding coefficient.
ACE_Medical_bleeding = 1;

// Enable wounds reopening.
ACE_Medical_advWounds = false;

// Select what units the medical system will be enabled for (adv only).
// 0 = players; 1 = players and AI
ACE_Medical_enableFor = 1;

// Enable screams of pain.
ACE_Medical_screams = true;

// Enables AI going unconcious.
ACE_Medical_unconAI = true;

// Crew takes damage on vehicle crash.
ACE_Medical_vehicleCrashDamage = true;

// Prevents units from dying instantly and makes them unconcious instead.
ACE_Medical_preventInstaDeath = true;

// TREATMENT SETTINGS ==========================================================

// Enables litter and discards upon treatment.
ACE_medicalTreatment_allowLitter = true;

// Consume PAK on treatment
ACE_medicalTreatment_consumePAK = 0;
ACE_medicalTreatment_usePAK = 1;

// Locations enabled for PAK use
// 0 = anywhere; 1 = medical vehicles; 2 = medical facilities; 3 = medical vehicles and facilities; 4 = disabled
ACE_medicalTreatment_usePAKLocation = 0;

// Consume a Surgical Kit on treatment
ACE_medicalTreatment_consumeSurgKit = 0;
ACE_medicalTreatment_useSurgKit = 1;

// Locations enabled for Surgical Kit use
// 0 = anywhere; 1 = medical vehicles; 2 = medical facilities; 3 = medical vehicles and facilities; 4 = disabled
ACE_medicalTreatment_useSurgKitLocation = 3;

// Enable overdosing of patients.
ACE_medicalTreatment_enableOverdose = false;

// Delay for removing litter objects in seconds.
ACE_medicalTreatment_litterRemove = 3000;

// =============================================================================