params ["_type"];

private _factions = [
	"AUTO", "VANILLA",
	"RACS", "SLA", "MUJAHIDEEN", "ANA", "AHKMA-PMC",
	"CHEDAKI", "MARINES", "IONPMC", "TKMILITIA", "FINNS",
	"CSAT", "NATO", "AAF", "FIA", "VDV"
];

private _faction = "auto";
if (_type > 0 && _type < count _factions + 1) then {
	_faction = _factions select _type - 1;
} else {
	if (DAC_Basic_Value != 5) then {
		DAC_Basic_Value = 5; publicVariable "DAC_Basic_Value";
		hintC "Error: DAC_Config_Events > No valid config number";
	};
};

private _initGroup = format ["{ [_x, '%1'] call BRM_fnc_initAI; } forEach units _group;", _faction];
private _initUnit = format ["[_unit, '%1'] call BRM_fnc_initAI;", _faction];

[
	[[_initGroup], [], [], [], [], [_initUnit], []],
	[[_initGroup], [], [], [], [], [_initUnit], []],
	[[_initGroup], [], [], [], [], [_initUnit]],
	[[_initGroup], [], [], []],
	[[], [], [], [], [], []],
	[[], [], [], []],
	[[], [], []]
]
