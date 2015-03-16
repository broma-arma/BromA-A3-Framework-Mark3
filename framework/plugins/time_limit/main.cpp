
#ifdef BRM_PLUGIN_META
	class time_limit
	{
		name = "Time limit";
		version = 1;
		authors[] = {"Nife"};
		description = "Ends the mission after a parameter set amount of time has passed, and based on mission settings alerts the player on relevant times to the mission maker.";
	};
#endif

#ifdef BRM_PARAMS_TIME
	#include "Parameters.cpp"
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif