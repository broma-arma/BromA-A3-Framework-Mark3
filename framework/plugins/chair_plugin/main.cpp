
#ifdef BRM_PLUGIN_META
	class chair_plugin
	{
		name = "Chair Plugin";
		version = 1;
		authors[] = {"Nife","MacRae"};
		description = "Lets you carry a chair around and sit on it.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif