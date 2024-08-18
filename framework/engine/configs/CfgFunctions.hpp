class BRM {
	class init {
		file = "framework\engine\functions\init";
		class preInit { preInit = 1; };
		class postInit { postInit = 1; };

		class loadSettings {};
		class loadBriefing {};
		class endLoading {};
	};
	class ending {
		file = "framework\engine\functions\ending";
		class getEnding {};
	};
	class events {
		file = "framework\engine\functions\events";
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class initAI {};
		class onAIKilled {};
	};
	class loadout {
		file = "framework\engine\functions\loadout";
		class assignLoadout {};
		class assignCargo {};
		class getLoadoutProperty {};
	};
};

class BRM_HC {
	class init {
		file = "framework\engine\functions\plugins\headless_client";
		class setParams {};
	};
};

class BRM_MissionConditions {
	class init {
		file = "framework\engine\functions\plugins\mission_conditions";
		class setParams {};
	};
};

class BRM_DAC {
	class init {
		file = "framework\engine\functions\plugins\dac_plugin";
		class postInit {};
	};
};

class BRM_Round_System {
	class init {
		file = "framework\engine\functions\plugins\round_system";
		class postInit {};
	};
};

class BRM_PlankBuilding {
	class init {
		file = "framework\engine\functions\plugins\plank_building";
		class postInit {};
	};
};
