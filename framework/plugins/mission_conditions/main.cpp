
#ifdef BRM_PLUGIN_META
	class mission_conditions {};
#endif

#ifdef BRM_PARAMS_CONDITIONS
	#include "Parameters.cpp"
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif