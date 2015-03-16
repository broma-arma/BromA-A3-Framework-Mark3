
#ifdef BRM_PLUGIN_META
	class agm_plugin
	{
		name = "AGM Plugin";
		version = 1;
		authors[] = {"Nife"};	
		description = "Based on parameters and mission settings, configures whatever desired AGM modules, including Medical and respawning system.";
	};
#endif

#ifdef BRM_PARAMS_PLAYER
	#include "Parameters.cpp"
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif