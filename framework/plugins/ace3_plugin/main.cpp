
#ifdef BRM_PLUGIN_META
	class ace3_plugin
	{
		name = "ACE3 Plugin";
		version = 1;
		authors[] = {"Nife"};	
		description = "Allows for the easy configuration for the ACE3 mod settings, including Medical system and other modules.";
	};
#endif

#ifdef BRM_PARAMS_PLAYER
	#include "Parameters.cpp"
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif