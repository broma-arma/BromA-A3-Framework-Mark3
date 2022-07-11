// Use this script to execute the functions related to objectives and tasks.
// Keep in mind that only the Server will run these scripts.

[
	// SIDE / UNIT that the task will be assigned to.
	side_a_side,

	// ID of the task.
	"newTaskBLU1",

	[
		// Name of the task.
		"Kill the Scientist and protect the Pilot",

		// Description.
		"My description 1",

		// Type (https://community.bistudio.com/wiki/Arma_3_Tasks_Overhaul#Appendix)
		"attack",

		// Position
		getPos tgt1
	],

	[
		// Condition for: task to be assigned / to be completed / to fail (OPTIONAL)
		{ true },
		{ !alive tgt1 },
		{ !alive tgt2 }
	],

	// Determine the priority of a task.
	// 0 - Optional | 1 - Secondary | 2 - Primary (must be completed and not failed)
	2,

	// Code executed at certain events related to the task.
	// Task assigned | Task completed | Task failed
	["", "", ""]
] spawn BRM_FMK_fnc_newTask;

// =============================================================================
// This is an example of how to make an optional task.
// Notice that we leave the position value empty to show that we do not want to give a position.
[
	side_a_side,
	"newTaskBLU2",
	["Kill Nikos, maybe?", "Nikos needs to die. Or not. It's up to you - doesn't matter either way.", "kill", []],
	["(true)", "(not alive nikos_npc)"],
	0,
	["", "", ""]
] spawn BRM_FMK_fnc_newTask;
// =============================================================================

// =============================================================================
// This task isn't considered a primary task - it doesn't have to be completed
// and won't end the mission if it is failed.
//
// This is useful for TvT objectives, like defending a certain zone,
// which can be failed but won't end the whole mission, but are also
// more important than "optional" objectives.

[
	side_a_side,
	"newTaskBLU3",
	["Destroy the enemy vehicle.", "There's an enemy vehicle right in front of you. I don't like it. Destroy it!", "destroy", getPos TaskEnemyVehicle],
	["(true)", "(not alive TaskEnemyVehicle)"], 1, ["", "", ""]
] spawn BRM_FMK_fnc_newTask;
