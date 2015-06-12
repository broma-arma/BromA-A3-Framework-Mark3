
#ifdef BRM_PLUGIN_META
	class alive_db
	{
		name = "ALIVE DB Connection";
		version = 1;
		authors[] = {"Nife"};
		description = "This plugin allows ALIVE to connect to your mission and send the relevant data to the War Room.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif

#ifdef BRM_PARAMS_PLAYER
	#include "Parameters.cpp"
#endif