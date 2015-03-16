
#ifdef BRM_PLUGIN_META
	class time_accel
	{
		name = "Time Acceleration";
		version = 1;
		authors[] = {"Nife"};
		description = "Accelerates time as determined by mission parameters.";
	};
#endif

#ifdef BRM_PARAMS_TIME
	#include "Parameters.cpp"
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif