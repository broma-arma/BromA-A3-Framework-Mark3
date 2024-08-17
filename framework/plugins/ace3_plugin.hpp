#ifdef BRM_PLUGIN_META
	class ace3_plugin {
		functionTag = "ACE3";
		params = "[nil, nil, [""p_ace3_second_chances"", -1], [""p_ace3_everyone_medic"", 0]]";
	};
#endif

#ifdef BRM_PARAMS_PLAYER
	class p_ace3_second_chances {
		title = "Second chances";
		values[] = {        0,   1,   3,   5,         -1};
		texts[] = {"Disabled", "1", "3", "5", "Infinite"};
		default = 3;
	};

	class p_ace3_everyone_medic {
		title = "Everyone medic";
		values[] = {        0,         1};
		texts[] = {"Disabled", "Enabled"};
		default = 0;
	};
#endif
