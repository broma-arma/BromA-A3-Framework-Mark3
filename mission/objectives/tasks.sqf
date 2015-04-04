
// ============================================================================
//                                                                             |
//         Use this script to execute the functions related to objectives      |
//     and tasks, but keep in mind they will only be executed server-side.     |
//                                                                             |
//         For more help on the Task system, read the documentation.           |
//                                                                             |
// ============================================================================

if (!isServer) exitWith {};
waitUntil{scriptDone(mission_settings)};
// =============================================================================

[
// SIDE / UNIT that the task will be assigned to.
side_a_side,

// ID of the task.
"newTaskBLU1", 

// Name of the task.
["Kill the Scientist and protect the Pilot.", 

// Description.
"My description 1"],

// Condition for: task to be assigned / to be completed / to fail
["(true)","(not alive tgt1)", "(not alive tgt2)"],

// If the task is essential, meaning it must be completed and must not be failed.
true
] spawn BRM_fnc_newTask;

[
side_a_side, 
"newTaskBLU2", 
["Kill Nikos, maybe?", 
"Nikos needs to die. Or not. It's up to you - doesn't matter either way."],
["(true)","(not alive nikos_npc)"],
false
] spawn BRM_fnc_newTask;

/*

[
side_b_side, 
"newTaskOP1", 
["Kill the Pilot and protect the Scientist.", 
"My description 1"],
["(true)","(not alive tgt2)"],
true
] spawn BRM_fnc_newTask;

[
side_c_side, 
"newTaskIND1", 
["Kill the Surfer.", 
"My description 1"],
["(true)","(not alive tgt3)"],
true
] spawn BRM_fnc_newTask;
*/

[] spawn BRM_fnc_checkTasks;

true