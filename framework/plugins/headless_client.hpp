#ifdef BRM_PLUGIN_META
	class headless_client {
		functionTag = "HC";
		params = "[[""p_enable_hc"", 2]]";
	};
#endif

#ifdef BRM_PARAMS_AI
class p_enable_hc {
	title = "Headless Client";
	values[] = {        0,         1,      2};
	texts[] = {"Disabled", "Enabled", "Auto"};
	default = 2;
};
#endif
