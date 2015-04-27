class BRM_RespawnSystem
{

	class init {
		file = "framework\plugins\respawn_system\functions";
		class preInit {preInit = 1;};
		class setParams {postInit = 1;};
		class postinit {postInit = 1;};
	};
	
	class Functions {
		file = "framework\plugins\respawn_system\functions";
		class removeFromMission {};
		class onRespawn {};
		class getLives {};
		class setLives {};
		class callRespawn {};
		class callRespawnSide {};
		class killPlayer {};
	};
};