// https://github.com/broma-arma/BromA-A3-Framework-Mark3/wiki/Plugins#dac-plugin

#ifdef PARAMS
//#define SKILL 3
#else
[
	{ // code
		[trg1, "Create an activated normal default friendly zone named anything on a random network 1, with 1 group of infantry and 2 groups of vehicles."] call BRM_FMK_DAC_fnc_new;
	}
]
#endif
