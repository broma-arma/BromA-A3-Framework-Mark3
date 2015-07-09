#ifdef BRM_PLUGIN_META
	class block_tp
	{
		name = "Block third-person";
		version = 1;
		authors[] = {"Nife"};	
		description = "Simple script meant to stop players from using third person mode if they do not meet certain conditions. (Being a vehicle driver/commander)";
	};
#endif

#ifdef BRM_PARAMS_PLAYER
	#include "Parameters.cpp"
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif