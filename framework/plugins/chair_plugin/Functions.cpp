class BRM_ChairPlugin
{
	class init {
		file = "framework\plugins\chair_plugin\functions";
		class preInit {preInit = 1;};
		class postInit {postInit = 1;};		
	};
	class Functions {
		file = "framework\plugins\chair_plugin\functions";
		class initChair {};
		class chairSitDown {};
		class chairStandUp {};
		class chairPickUp {};
		class chairDeploy {};
		class canHoldChair {};		
	};
}; 