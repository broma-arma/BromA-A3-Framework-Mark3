
#ifdef BRM_PLUGIN_META
	class radiofreq
	{
		name = "Radio channel generator";
		version = 1;
		authors[] = {"Nife"};
		description = "Generates radio channels and frequencies based on what groups are active in the mission.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif