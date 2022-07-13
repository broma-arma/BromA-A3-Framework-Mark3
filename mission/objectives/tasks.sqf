// Use this script to execute the functions related to objectives and tasks.
// Keep in mind that only the Server will run these scripts.

[
	// SIDE / UNIT that the task will be assigned to.
	side_a_side,

	// ID of the task.
	"newTaskBLU1",

	// Name of the task.
	"Kill the Scientist and protect the Pilot",

	// Description.
	"My description 1",

	// Type (https://community.bistudio.com/wiki/Arma_3_Tasks_Overhaul#Appendix)
	"attack",

	// Position
	getPos tgt1,

	true, // Task completion is required for mission completion
	true, // Task failure causes mission failure

	[ // Condition for task:
		{ true }, // to be assigned
		{ !alive tgt1 }, // to be completed
		{ !alive tgt2 } // to fail
	],

	[ // Code executed when the task is:
		{}, // Assigned
		{}, // Completed
		{} // Failed
	]
] spawn BRM_FMK_fnc_newTask;

// =============================================================================
// This is an example of how to make an optional task.
// Notice that we leave the position value empty to show that we do not want to give a position.
[
	side_a_side,
	"newTaskBLU2",
	"Kill Nikos, maybe?",
	"Nikos needs to die. Or not. It's up to you - doesn't matter either way.",
	"kill",
	[],
	false,
	false,
	[{true}, {!alive nikos_npc}],
	[{}, {}, {}]
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
	"Destroy the enemy vehicle.", "There's an enemy vehicle right in front of you. I don't like it. Destroy it!",
	"destroy", TaskEnemyVehicle,
	true, false,
	[{true}, {!alive TaskEnemyVehicle}], [{}, {}, {}]
] spawn BRM_FMK_fnc_newTask;
