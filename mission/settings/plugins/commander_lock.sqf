//==============================================================================
// COMMANDER LOCK
// This module stops all of a side's units from entering vehicles or shooting, until their CO or similarly authorized player says so.

// What units are authorized to ready their team.
co_lock_units = ["blu_0_0_1", "blu_1_0_1", "op_0_0_1", "op_1_0_1", "ind_0_0_1", "ind_1_0_1"];

// If this is enabled, the mission won't start until all sides are ready.
co_lock_tvt_mode = false;
