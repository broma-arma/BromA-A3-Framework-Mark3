#ifdef BRM_PLUGIN_META
	class setup_zone {
		functionTag = "SetupZone";
		params = "[[""p_setup_time"", 0]]";
	};
#endif

#ifdef BRM_PARAMS_TIME
	class p_setup_time {
		title = "Setup time";
		values[] = {          0,          1,           2,           3,            4};
		texts[] = {"15 seconds", "1 minute", "3 minutes", "5 minutes", "10 minutes"};
		default = 0;
	};
#endif
