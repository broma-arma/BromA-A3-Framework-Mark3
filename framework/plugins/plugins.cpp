
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

#include "headless_client\main.cpp"
#include "dac_plugin\main.cpp"
#include "agm_plugin\main.cpp"
#include "tfar_plugin\main.cpp"
#include "respawn_system\main.cpp"
#include "auto_radio_freq\main.cpp"
#include "cssa3_spectator\main.cpp"
#include "block_tp\main.cpp"
#include "time_accel\main.cpp"
//#include "f_casualties_cap\main.cpp"
#include "f_remove_body\main.cpp"
#include "map_cover\main.cpp"
#include "spawn_protection\main.cpp"
#include "setup_zone\main.cpp"
#include "jip_teleport\main.cpp"
#include "ch_view_distance\main.cpp"
#include "commander_lock\main.cpp"
#include "civilian_casualty_cap\main.cpp"
#include "time_limit\main.cpp"
#include "team_roster\main.cpp"
#include "team_kill\main.cpp"
#include "loading_screen\main.cpp"
#include "ao_limit\main.cpp"
#include "mission_maker_tools\main.cpp"