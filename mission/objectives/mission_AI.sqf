// TODO Rename this to ai.sqf?
// TODO Split spawn_ai and dac into seperate files?
// https://github.com/broma-arma/BromA-A3-Framework-Mark3/wiki/Mission-AI

if ("spawn_ai" in BRM_plugins) then {
	// https://github.com/broma-arma/BromA-A3-Framework-Mark3/wiki/Plugins#spawn-ai
};

if ("dac" in BRM_plugins) then {
	// https://github.com/broma-arma/BromA-A3-Framework-Mark3/wiki/DAC-Plugin
	[trg1, "Create an activated normal default friendly zone named anything on a random network 1, with 1 group of infantry and 2 groups of vehicles."] call BRM_FMK_DAC_fnc_new;
};
