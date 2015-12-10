
#ifdef BRM_PLUGIN_META
	class ace3_spectator
	{
		name = "ACE3 Spectator plugin";
		version = 1;
		authors[] = {"Nife"};	
		conflict_plugins[] = {"cssa3_spectator"};
		description = "Manages some stuff about the spectator system.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif