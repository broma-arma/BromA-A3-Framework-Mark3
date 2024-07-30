class BRM_Round_System {
	class init {
		file = "framework\plugins\round_system\functions";
		class setParams { postInit = 1; };
		class preInit { preInit = 1; };
		class postInit { postInit = 1; };
	};

	class general {
		file = "framework\plugins\round_system\functions";
		class beginMatch { postInit = 1; };
	};
};
