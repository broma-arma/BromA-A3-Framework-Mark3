class BRM_TimeLimit
{
	class init {
		file = "framework\plugins\time_limit\functions";
		class setParams {postInit = 1;};	
		class postinit {postInit = 1;};
	};

	class Functions {
		file = "framework\plugins\time_limit\functions";
		class addTime {};
		class removeTime {};
	};
}; 