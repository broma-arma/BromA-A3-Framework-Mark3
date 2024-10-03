// Use this file to call any functions or scripts related to tasks.
// Only the Server will execute this file.

// Primary, completion required to complete mission and failure causes mission failure.
[
	side_a_side, // SIDE / GROUP / UNIT that the task will be assigned to
	"a1", // Unique task identifier
	0, // Priority: 0 - Primary, 1 - Secondary, 2 - Abortive, 3 - Optional
	[
		"Kill the Scientist", // Name
		"The Scientist knows too much, eliminate them.", // Description
		"attack" // Type (See https://community.bistudio.com/wiki/Arma_3:_Task_Framework#Task_Icons)
	],
	taskScientist, // POSITION / OBJECT / MARKER denoting the position of the task
	[ // Condition for task to ...
		{ !alive taskScientist }, // complete
		{ false }, // fail (OPTIONAL)
		{ true } // be assigned (OPTIONAL)
	],
	[ // Code executed when task is ... (OPTIONAL)
		{}, // completed (OPTIONAL)
		{}, // failed (OPTIONAL)
		{} // assigned (OPTIONAL)
	]
] call BRM_FMK_fnc_createTask;

// Secondary, completion or failure required to complete mission.
[
	side_a_side,
	"a2",
	1,
	[
		"Destroy the enemy vehicle.",
		"There's an enemy vehicle right in front of you. I don't like it. Destroy it!",
		"destroy"
	],
	getPos TaskEnemyVehicle, // This causes the task position to not follow the object
	[{ !alive TaskEnemyVehicle }]
] call BRM_FMK_fnc_createTask;

// Abortive, failure causes mission failure.
[side_a_side, "a3", 2, ["Protect the Pilot",
	"Don't let the Pilot die.", "defend"],
	taskPilot,
[{ false }, { !alive taskPilot }]] call BRM_FMK_fnc_createTask;

// Optional, outcome doesn't affect mission outcome.
[side_a_side, "a4", 3, ["Kill Nikos?",
	"To kill Nikos, or not to kill Nikos, that is the question. Though, we don't care what the answer is.", "kill"],
	objNull, // Use objNull for no position
[{ !alive taskNikos }]] call BRM_FMK_fnc_createTask;
