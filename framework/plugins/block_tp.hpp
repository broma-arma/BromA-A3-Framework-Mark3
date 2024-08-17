#ifdef BRM_PLUGIN_META
	class block_tp {
		functionTag = "BlockThirdPerson";
		params = "[[""p_allow_tp_veh"", 2]]";
	};
#endif

#ifdef BRM_PARAMS_PLAYER
	class p_allow_tp_veh {
		title = "Third person";
		values[] = {        0,         1,                    2};
		texts[] = {"Disabled", "Enabled", "Drivers/Commanders"};
		default = 2;
	};
#endif
