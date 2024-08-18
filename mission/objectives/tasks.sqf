// Use this file to call any functions or scripts related to tasks.
// Only the Server will execute this file.

// Primary, completion required to complete mission and failure causes mission failure.
[
	side_a_side, // SIDE / GROUP / UNIT that the task will be assigned to
	"a1", // Unique task identifier
	[
		"Kill the Scientist", // Name
		"The Scientist knows too much, eliminate them.", // Description
		"attack", // Type (See https://community.bistudio.com/wiki/Arma_3:_Task_Framework#Task_Icons)
		taskScientist // POSITION / OBJECT / MARKER denoting the position of the task
	],
	[ // Condition for task to ...
		{ true }, // be assigned
		{ !alive taskScientist }, // complete
		{ false } // fail (OPTIONAL)
	],
	2, // Priority: 0 - Optional, 1 - Secondary, 2 - Primary, 3 - Abortive
		// Completing Primary and Secondary tasks, or failing Secondary, are required to win the mission
		// Failing Primary or Abortive tasks will fail the mission
	[ // Code executed when task is ...
		{}, // assigned
		{}, // completed
		{} // failed
	]
] spawn BRM_FMK_fnc_newTask;

// Secondary, completion or failure required to complete mission.
[
	side_a_side,
	"a2",
	[
		"Destroy the enemy vehicle.",
		"There's an enemy vehicle right in front of you. I don't like it. Destroy it!",
		"destroy",
		getPos TaskEnemyVehicle // This causes the task position to not follow the object
	],
	[{ true }, { !alive TaskEnemyVehicle }],
	1,
	[{}, {}, {}]
] spawn BRM_FMK_fnc_newTask;

// Optional, outcome doesn't affect mission outcome.
[side_a_side, "a3", [
	"Kill Nikos?", "To kill Nikos, or not to kill Nikos, that is the question. Though, we don't care what the answer is.",
	"kill", objNull // Use objNull for no position
], [{ true }, { !alive taskNikos }], 0, [{}, {}, {}]] spawn BRM_FMK_fnc_newTask;

// Abortive, failure causes mission failure.
[side_a_side, "a4", ["Protect the Pilot", "Don't let the Pilot die.", "defend", taskPilot],
	[{ true }, { false }, { !alive taskPilot }], 3, [{}, {}, {}]
] spawn BRM_FMK_fnc_newTask;
