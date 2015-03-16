class BRM_AGM
{
	class init {
		file = "framework\plugins\agm_plugin\functions";
		class setParams {postInit = 1;};	
		class postinit {postInit = 1;};	
	};
	class Functions {
		file = "framework\plugins\agm_plugin\functions";
		class AGM_RevivePlayer {};
	};
}; 