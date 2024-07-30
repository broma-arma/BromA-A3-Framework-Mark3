// ============================================================================
//                                                                             |
//     Initializes all main Framework functions, including inits and API.      |
//                                                                             |
// ============================================================================

class BRM {
	class plugins {
		file = "framework\engine\functions\engine\plugins";
		class logPlugins { postInit = 1; };
		class warnConflict { postInit = 1; };
	};
	class init {
		file = "framework\engine\functions\engine\init";
		class loadSettings { preInit = 1; };
		class initVariables { preInit = 1; };
		class engine_pre { preInit = 1; };
	};
	class unit {
		file = "framework\engine\functions\engine\unit";
		class defineGroups { postInit = 1; };
		class createPlayerVehicles { postInit = 1; };
	};
	class ending {
		file = "framework\engine\functions\engine\ending";
		class callEnding {};
	};
	class tasks {
		file = "framework\engine\functions\engine\tasks";
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
		file = "mission\briefings";
		class loadBriefing { postInit = 1; };
	};
	class loadout {
		file = "mission\loadouts";
		class assignLoadout {};
		class assignCargo {};
		class getLoadoutProperty {};
	};
};
