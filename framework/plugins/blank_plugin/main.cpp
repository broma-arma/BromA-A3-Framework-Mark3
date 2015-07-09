
#ifdef BRM_PLUGIN_META
	class blank_plugin
	{
		name = "Blank Plugin";
		version = 1;
		authors[] = {""};
		description = "The world is your oyster.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif

#ifdef BRM_PLUGIN_PARAMETERS
	#include "Parameters.cpp"
#endif

#ifdef BRM_PLUGIN_DIALOGS
	#include "dialogs\header.hpp"
#endif