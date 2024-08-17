params ["_type"];

// Default values.

private _setSkill   = [[0.2, 0.8], [0.2, 0.8], [0.2, 0.8], [0.2, 0.8], [0.2, 0.8], [0.2, 0.8], [0.2, 0.8], [0.2, 0.8], [0.2, 0.8], [0.2, 0.8]];
private _setCombat  = ["green", "white", "yellow"];
private _setBehav   = ["careless", "safe", "aware"];
private _setSpeed   = ["limited", "normal", "full"];
private _setForm    = ["line", "vee", "column", "wedge", "stag column", "ech left", "ech right", "file", "diamond"];
private _setFleeing = [0, 200];
private _setHeliVal = [100, 600, 1, 0];
private _setPause   = [[5, 10], [5, 10], [5, 10], [20, 30, 5, 5], [1, 3], [0, 10]];
private _setBldgBeh = [5, 50, 300, 600, 2];
private _setPatrol  = ["45 + (20 * (skill _leader))", "(60 + (random 60)) + ((skill _leader) * 50)"];
private _setSearch  = ["40 + ((skill _leader) * 150)", "50 + ((skill _leader) * 50)"];
private _setSupport = [0, 0];
private _setJoin    = 2;
private _setEmpVeh  = [[200, 80], [100, 80]];
private _setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))", 2, 5];
private _setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];

// =============================================================================

switch (_type) do {
	case 0: { // EASY
		_setSkill = [
			[0.2, 0.3], // Aiming Accuracy
			[0.2, 0.3], // Aiming Shake
			[0.2, 0.3], // Aiming Speed
			[0.2, 0.3], // Endurance
			[0.2, 0.3], // Spot Distance
			[0.2, 0.3], // Spot Time
			[0.2, 0.3], // Courage
			[0.2, 0.3], // Reload Speed
			[0.2, 0.3], // Commanding
			[0.2, 0.3] // General
		];
		_setCombat = ["green"];
		_setForm = ["line"];
	};

	case 1: { // NORMAL
		_setSkill = [
			[0.8, 0.9], // Aiming Accuracy
			[0.4, 0.5], // Aiming Shake
			[0.4, 0.5], // Aiming Speed
			[0.8, 0.9], // Endurance
			[0.8, 0.9], // Spot Distance
			[0.6, 0.7], // Spot Time
			[0.8, 0.9], // Courage
			[0.2, 0.4], // Reload Speed
			[0.8, 0.9], // Commanding
			[0.8, 0.9] // General
		];
	};

	case 2: { // STEALTH
		_setSkill = [
			[0.2, 0.3], // Aiming Accuracy
			[0.3, 0.4], // Aiming Shake
			[0.3, 0.4], // Aiming Speed
			[0.6, 0.8], // Endurance
			[0.3, 0.5], // Spot Distance
			[0.2, 0.3], // Spot Time
			[0.5, 0.8], // Courage
			[0.2, 0.4], // Reload Speed
			[0.6, 0.8], // Commanding
			[0.4, 0.6] // General
		];
		_setCombat = ["red", "white"];
		_setBehav = ["stealth"];
		_setSpeed = ["full"];
		_setPause set [0, [2, 5]]; // Reduce infantry waypoint wait time
		_setBldgBeh set [0, 0]; // Disable building garrisoning
		_setEmpVeh select 0 set [0, 0]; // Disable empty vehicle usage.
	};

	case 3: { // HARD
		_setSkill = [
			[0.7, 0.8], // Aiming Accuracy
			[0.7, 0.8], // Aiming Shake
			[0.7, 0.8], // Aiming Speed
			[0.7, 0.8], // Endurance
			[0.5, 0.6], // Spot Distance
			[0.5, 0.6], // Spot Time
			[0.7, 0.8], // Courage
			[0.7, 0.8], // Reload Speed
			[0.7, 0.8], // Commanding
			[0.7, 0.8] // General
		];
	};

	default {
		if (DAC_Basic_Value != 5) then {
			DAC_Basic_Value = 5; publicVariable "DAC_Basic_Value";
			hintC "Error: DAC_Config_Behaviour > No valid config number";
		};
	};
};

private _difficulty = DAC_AI_Level / 3; // 0.3, 0.6, 1, 1.3
{
	for "_i" from 0 to 1 do {
		_x set [_i, _x#_i * _difficulty min 1];
	};
} forEach _setSkill;

[
	_setSkill, _setCombat, _setBehav, _setSpeed, _setForm, _setFleeing,
	_setHeliVal, _setPause, _setBldgBeh, _setPatrol, _setSearch,
	_setSupport, _setJoin, _setEmpVeh, _setSupTime, _setHidTime
]
