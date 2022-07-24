// https://github.com/broma-arma/BromA-A3-Framework-Mark3/wiki/Tasks

[
	side_a_side, // side
	"newTaskBLU1", // id
	"Kill the Scientist and protect the Pilot", // title
	"My description 1", // description
	"attack", // type
	getPos tgt1, // position
	true, // completion
	true, // failure
	[ // conditions
		{ true }, // assign
		{ !alive tgt1 }, // complete
		{ !alive tgt2 } // fail
	],
	[ // callbacks
		{}, // assigned
		{}, // completed
		{} // failed
	]
] spawn BRM_FMK_fnc_newTask;

[
	side_a_side,
	"newTaskBLU2",
	"Kill Nikos, maybe?", "Nikos needs to die. Or not. It's up to you - doesn't matter either way.",
	"kill", [],
	false, false,
	[{true}, {!alive nikos_npc}], [{}, {}, {}]
] spawn BRM_FMK_fnc_newTask;

[
	side_a_side,
	"newTaskBLU3",
	"Destroy the enemy vehicle.", "There's an enemy vehicle right in front of you. I don't like it. Destroy it!",
	"destroy", TaskEnemyVehicle,
	true, false,
	[{true}, {!alive TaskEnemyVehicle}], [{}, {}, {}]
] spawn BRM_FMK_fnc_newTask;
