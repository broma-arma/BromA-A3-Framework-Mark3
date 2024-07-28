
#ifdef BRM_PLUGIN_META
	class blank_plugin
	{
		name = "Blank Plugin";
		version = 1;
		authors[] = {""};
		description = "Hello world!";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.hpp"
#endif

#ifdef BRM_PLUGIN_PARAMETERS
	#include "Parameters.hpp"
#endif

#ifdef BRM_PLUGIN_DIALOGS
	#include "dialogs\header.hpp"
#endif