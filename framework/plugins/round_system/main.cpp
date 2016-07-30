
#ifdef BRM_PLUGIN_META
	class round_system {};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif

#ifdef BRM_PARAMS_TIME
	#include "Parameters.cpp"
#endif