class f_cas_cap
{
	class init {
		file = "framework\plugins\f_casualties_cap\functions";
		class setParams {postInit = 1;};
		class postinit {postInit = 1;};
	};
	class Functions {
		file = "framework\plugins\f_casualties_cap\functions";
		class CasualtiesCapCheck {};
	};
};