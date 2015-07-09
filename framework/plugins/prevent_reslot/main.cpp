
#ifdef BRM_PLUGIN_META
	class prevent_reslot
	{
		name = "Prevent Reslotting";
		version = 1;
		authors[] = {"Nife"};
		description = "As soon enough time has passed, the players current slotted unit will be locked, blocking any attemps to change it.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif