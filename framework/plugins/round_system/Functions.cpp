class BRM_Round_System
{

	class init {
		file = "framework\plugins\round_system\functions";
		class preInit {preInit = 1;};
		class setParams {postInit = 1;};
		class postInit {postInit = 1;};
	};
	
	class general {
		file = "framework\plugins\round_system\functions";
		class beginMatch {postInit = 1;};
	};
	
	class server {
		file = "framework\plugins\round_system\functions\server";
		class roundEnd {};
		class roundHandleResults {};
		class resetRoundVariables {};
		class roundStart {};
		class checkRoundEnd {};
		class setMatchVariables {};
		class CasualtiesCapCheck {};			
	};
	
	class player {
		file = "framework\plugins\round_system\functions\player";
		class roundEndPlayer {};
		class roundStartPlayer {};
		class displayWinner {};
		class moveToRespawn {};
		class registerZone {};
		class setupZone {};
	};
}; 