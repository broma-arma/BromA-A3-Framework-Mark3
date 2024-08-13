class bar_ai { title = "AI SETTINGS"; values[] = {0}; texts[] = {""}; default = 0; };
#define BRM_PARAMS_AI
	#include "framework\plugins\plugins.hpp"
#undef BRM_PARAMS_AI
class bar_ai_sep { title = ""; values[] = {0}; texts[] = {""}; default = 0; };

class bar_conditions { title = "MISSION CONDITIONS"; values[] = {0}; texts[] = {""}; default = 0; };
#define BRM_PARAMS_CONDITIONS
	#include "framework\plugins\plugins.hpp"
#undef BRM_PARAMS_CONDITIONS
class bar_conditions_sep { title = ""; values[] = {0}; texts[] = {""}; default = 0; };

class bar_time { title = "TIME AND MISSION CONSTRAINTS"; values[] = {0}; texts[] = {""}; default = 0; };
#define BRM_PARAMS_TIME
	#include "framework\plugins\plugins.hpp"
#undef BRM_PARAMS_TIME
class bar_time_sep { title = ""; values[] = {0}; texts[] = {""}; default = 0; };

class bar_player { title = "PLAYER SETTINGS"; values[] = {0}; texts[] = {""}; default = 0; };
#define BRM_PARAMS_PLAYER
	#include "framework\plugins\plugins.hpp"
#undef BRM_PARAMS_PLAYER
class bar_player_sep { title = ""; values[] = {0}; texts[] = {""}; default = 0; };
