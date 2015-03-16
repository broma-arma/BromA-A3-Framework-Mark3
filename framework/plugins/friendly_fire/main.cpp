
#ifdef BRM_PLUGIN_META
	class friendly_fire
	{
		name = "Friendly fire";
		version = 1;
		authors[] = {"Nife"};	
		description = "Alerts both the perpetrator and the victim whenever a friendly fire incident takes place.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif