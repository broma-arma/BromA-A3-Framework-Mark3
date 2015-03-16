class BRM_SetupZone
{
	class init {
		file = "framework\plugins\setup_zone\functions";
		class setParams {postInit = 1;};
		class postinit {postInit = 1;};
	};
	class Functions {
		file = "framework\plugins\setup_zone\functions";
		class setupZone {};
		class registerZone {};
	};
};