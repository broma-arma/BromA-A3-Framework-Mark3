// ============================================================================
//                                                                             |
//         Use this script to execute the functions related to objectives      |
//     and tasks, but keep in mind they will only be executed server-side.     |
//                                                                             |
//         For more help on the Task system, read the documentation.           |
//                                                                             |
// ============================================================================

if (!isServer) exitWith {};

[{ scriptDone(mission_settings) && !(isNil "server_vehicles_created") }, {
// =============================================================================
// =============================================================================
	[
		side_a_side, // SIDE / UNIT that the task will be assigned to.
		"newTaskBLU1", // ID of the task.
		[
			"Kill the Scientist and protect the Pilot", // Name of the task.
			"My description 1", // Description.
			"attack", // Type. See all types: https://community.bistudio.com/wiki/Arma_3_Tasks_Overhaul#Appendix
			(getPos tgt1) // Position
		],

		[ // Condition for task to ...
			"(true)", // be assigned
			"(not alive tgt1)", // complete
			"(not alive tgt2)" // fail (OPTIONAL)
		],

		2, // Determine the priority of a task. 0 - Optional | 1 - Secondary | 2 - Primary (must be completed and not failed)

		[ // Code executed at certain events related to the task.
			"", // Assigned
			"", // Completed
			"" // Failed
		]
	] spawn BRM_FMK_fnc_newTask;
// =============================================================================

// =============================================================================
//  This is an example of how to make an optional task.
//  Notice that we leave the position value empty to show that we do not want to give a position.
	[
		side_a_side,
		"newTaskBLU2",
		["Kill Nikos, maybe?",
		"Nikos needs to die. Or not. It's up to you - doesn't matter either way.",
		"kill", []],
		["(true)", "(not alive nikos_npc)"],
		0,
		["", "", ""]
	] spawn BRM_FMK_fnc_newTask;
// =============================================================================

// =============================================================================
//  This task isn't considered a primary task - it doesn't have to be completed
//  and won't end the mission if it is failed.
//
//  This is useful for TvT objectives, like defending a certain zone,
//  which can be failed but won't end the whole mission, but are also
//  more important than "optional" objectives.

	[
		side_a_side, "newTaskBLU3",
		["Destroy the enemy vehicle.",
		"There's an enemy vehicle right in front of you. I don't like it. Destroy it!",
		"destroy", (getPos TaskEnemyVehicle)],
		["(true)", "(not alive TaskEnemyVehicle)"], 1, ["", "", ""]
	] spawn BRM_FMK_fnc_newTask;
// =============================================================================

	[] spawn BRM_FMK_fnc_checkTasks;

	true
}, []] call CBA_fnc_waitUntilAndExecute;
