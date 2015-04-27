
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

// Condition for: task to be assigned / to be completed / to fail (OPTIONAL)
["(true)","(not alive tgt1)", "(not alive tgt2)"],

// Determine the priority of a task.
// 0 - Optional | 1 - Secondary | 2 - Primary (must be completed and not failed)
2,

// Code executed at certain events related to the task.
// Task assigned | Task completed | Task failed
["", "", ""]
] spawn BRM_fnc_newTask;
// =============================================================================

// =============================================================================
//  This is an example of how to make an optional task.
[
side_a_side, 
"newTaskBLU2", 
["Kill Nikos, maybe?", 
"Nikos needs to die. Or not. It's up to you - doesn't matter either way."],
["(true)","(not alive nikos_npc)"],
0,
["", "", ""]
] spawn BRM_fnc_newTask;
// =============================================================================

// =============================================================================
//  This task isn't considered a primary task - it doesn't have to be completed
//  and won't end the mission if it is failed.
//
//  This is useful for TvT objectives, like defending a certain zone,
//  which can be failed but won't end the whole mission, but are also
//  more important than "optional" objectives.

[side_a_side, "newTaskBLU3",
["Destroy the Fennek.", 
"There's a Fennek lying close. I don't like it. Destroy it!"],
["(true)","(not alive car1)"], 1, ["", "", ""]] spawn BRM_fnc_newTask;
// =============================================================================

[] spawn BRM_fnc_checkTasks;

true