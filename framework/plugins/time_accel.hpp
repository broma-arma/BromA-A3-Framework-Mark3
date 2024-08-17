#ifdef BRM_PLUGIN_META
	class time_accel {
		functionTag = "TimeAcceleration";
		params = "[[""p_time_accel"", 1]]";
	};
#endif

#ifdef BRM_PARAMS_TIME
	class p_time_accel {
		title = "Time acceleration";
		values[] = {  0,    1,    2,    5,    10,    100};
		texts[] = {"0x", "1x", "2x", "5x", "10x", "100x"};
		default = 1;
	};
#endif
