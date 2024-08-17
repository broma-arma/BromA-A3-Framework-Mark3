#ifdef BRM_PLUGIN_META
	class dac_plugin {
		functionTag = "DAC";
		params = "[[""p_ai_level"", 2]]";
	};
#endif

#ifdef BRM_PARAMS_AI
	class p_ai_level {
		title = "DAC AI Skill";
		values[] = {        0,       1,        2,      3};
		texts[] = {"Very Easy", "Easy", "Normal", "Hard"};
		default = 2;
	};
#endif
