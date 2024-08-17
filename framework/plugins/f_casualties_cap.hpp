#ifdef BRM_PLUGIN_META
	class f_casualties_cap {
		functionTag = "f_cas_cap";
		params = "[[""p_cas_cap"", -1]]";
	};
#endif

#ifdef BRM_PARAMS_TIME
class p_cas_cap {
	title = "Casualty Cap";
	values[] = {       -1,    80,    90,    95,    100};
	texts[] = {"Disabled", "80%", "90%", "95%", "100%"};
	default = -1;
};

#endif
