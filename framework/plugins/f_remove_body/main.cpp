
#ifdef BRM_PLUGIN_META
	class f_remove_body
	{
		name = "Automatic body removal";
		authors[] = {"Headspace", "Wolfenswan", "Raedor", "Fer"};
		version = 1;
		description = "Ensures dead units will have their bodies removed after a certain amount of time, granted they are apart players by a certain distance.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif