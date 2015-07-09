
#ifdef BRM_PLUGIN_META
	class sync_status
	{
		name = "Synchronize Status";
		version = 1;
		authors[] = {"Nife"};
		description = "Constantly sends your current position and over relevant data to the server, and synchronizes it every time you JIP back into the session.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif