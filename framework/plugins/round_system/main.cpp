
#ifdef BRM_PLUGIN_META
	class round_system
	{
		name = "Round System";
		version = 1;
		authors[] = {"Nife"};
		conflict_plugins[] = {"spawn_protection", "f_casualties_cap", "commander_lock"};
		description = "This plugin manages rounds for TvT/COTvT missions.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif

#ifdef BRM_PARAMS_TIME
	#include "Parameters.cpp"
#endif