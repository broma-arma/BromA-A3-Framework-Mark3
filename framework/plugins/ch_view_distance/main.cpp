
#ifdef BRM_PLUGIN_META
	class ch_view_distance
	{
		name = "View distance changer";
		version = 1;
		authors[] = {"Champ-1"};	
		description = "Allows for the player to change his view/object draw distance. Default key is U.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif

#ifdef BRM_PLUGIN_DIALOGS
	#include "dialogs\dialog.hpp"
#endif