#ifdef BRM_PLUGIN_META
	class headless_client
	{
		name = "Headless Client";
		version = 1;
		authors[] = {"Naught","Nife"};	
		description = "Suite of functions made to facilitate the usage of the Headless Client and its environment variables.";
	};
#endif

#ifdef BRM_PARAMS_AI
	#include "Parameters.cpp"
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif