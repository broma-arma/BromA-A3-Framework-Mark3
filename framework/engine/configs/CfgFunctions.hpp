// ============================================================================
//                                                                             |
//     Initializes all main Framework functions, including inits and API.      |
//                                                                             |
// ============================================================================

class BRM {
	class plugins {
		file = "framework\engine\functions\plugins";
		class logPlugins { postInit = 1; };
		class warnConflict { postInit = 1; };
	};
	class init {
		file = "framework\engine\functions\init";
		class loadSettings { preInit = 1; };
		class initVariables { preInit = 1; };
		class engine_pre { preInit = 1; };
	};
	class unit {
		file = "framework\engine\functions\unit";
		class defineGroups { postInit = 1; };
		class createPlayerVehicles { postInit = 1; };
	};
	class tasks {
		file = "framework\engine\functions\tasks";
		class readExtraction { postInit = 1; };
	};
	class events {
		file = "framework\engine\events";
		class initPlayer { postInit = 1; };
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class initAI {};
		class onAIKilled {};
	};
	class briefing {
		file = "framework\engine\functions\briefing";
		class loadBriefing { postInit = 1; };
	};
	class loadout {
		file = "framework\engine\functions\loadout";
		class assignLoadout {};
		class assignCargo {};
		class getLoadoutProperty {};
	};
};

#define BRM_PLUGIN_FUNCTIONS
	#include "..\..\plugins\plugins.hpp"
#undef BRM_PLUGIN_FUNCTIONS

class BRM_endLoading {
	class Functions {
		file = "framework\engine\functions\init";
		class endLoading { postInit = 1; };
	};
};
