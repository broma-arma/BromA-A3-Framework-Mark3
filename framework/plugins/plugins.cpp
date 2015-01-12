
/*
	Title: Module List
	Author(s): Everyone
	Description:
		The place where modules are listed, included,
		and loaded into the framework.
	Syntax:
		#include "module_name\config.cpp"
	Notes:
		1. You may comment-out modules to disable them:
			//#include "module_name\config.cpp"
		2. When adding a new module, you must add a new
		include-line here to load it into the framework.
		3. Module configurations can be found within the
		module folder as "settings.cpp".
		4. Unless you're a developer, do not alter the
		"config.cpp" files within the module folders.
*/

//#include "dac_plugin\main.cpp"
#include "agm_plugin\main.cpp"
#include "respawn_system\main.cpp"
#include "map_cover\main.cpp"
#include "team_roster\main.cpp"
#include "team_kill\main.cpp"
#include "loading_screen\main.cpp"
#include "ao_limit\main.cpp"
#include "mission_maker_teleport\main.cpp"