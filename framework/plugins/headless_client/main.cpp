
#ifdef BRM_PLUGIN_META
	class headless_client {};
#endif

#ifdef BRM_PARAMS_AI
	#include "Parameters.cpp"
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif