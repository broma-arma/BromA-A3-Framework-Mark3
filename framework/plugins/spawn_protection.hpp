#ifdef BRM_PLUGIN_META
	class spawn_protection {
		functionTag = "SpawnProtection";
		params = "[[""p_spawn_protection_time"", -1]]";
	};
#endif

#ifdef BRM_PARAMS_TIME
	class p_spawn_protection_time {
		title = "Spawn protection duration";
		values[] = {        0,          1,           15,           30,         -1};
		texts[] = {"Disabled", "1 minute", "15 minutes", "30 minutes", "Infinite"};
		default = -1;
	};
#endif
