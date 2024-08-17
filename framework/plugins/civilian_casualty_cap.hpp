#ifdef BRM_PLUGIN_META
	class civilian_casualty_cap {
		functionTag = "CivilianCasualtyCap";
		params = "[[""p_dead_civies"", -1]]";
	};
#endif

#ifdef BRM_PARAMS_TIME
	class p_dead_civies {
		title = "Civilian death limit";
		values[] = {       -1,   1,   2,   3,   4,   5,   15,   30,   50,   100};
		texts[] = {"Disabled", "1", "2", "3", "4", "5", "15", "30", "50", "100"};
		default = -1;
	};
#endif
