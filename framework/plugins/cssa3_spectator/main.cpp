
#ifdef BRM_PLUGIN_META
	class cssa3_spectator
	{
		name = "CSSA3 Spectator";
		version = 1;
		authors[] = {"Cyrokrypto"};
		conflict_plugins[] = {"ace3_spectator"};
		description = "Whenever players are declared to be dead by either the appropriate Respawn Plugin or whatever else, the Spectator Mode will begin until they are respawned.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif

#ifdef BRM_PLUGIN_DIALOGS
	#include "header.hpp"
#endif