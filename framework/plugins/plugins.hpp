#include "..\..\mission\plugins.hpp"

#ifdef HEADLESS_CLIENT
#include "headless_client\main.hpp"
#endif

#ifdef MISSION_CONDITIONS
#include "mission_conditions\main.hpp"
#endif

#ifdef ACE3_PLUGIN
#include "ace3_plugin\main.hpp"
#endif

#ifdef RESPAWN_SYSTEM
#include "respawn_system\main.hpp"
#endif

#ifdef DAC_PLUGIN
#include "dac_plugin\main.hpp"
#endif

#ifdef TIME_ACCEL
#include "time_accel\main.hpp"
#endif

#ifdef VANILLA_SPECTATOR
#include "vanilla_spectator\main.hpp"
#endif

#ifdef TFAR_PLUGIN
#include "tfar_plugin\main.hpp"
#endif

#ifdef ACRE2_PLUGIN
#include "acre2_plugin\main.hpp"
#endif

#ifdef SPAWN_AI
#include "spawn_ai\main.hpp"
#endif

#ifdef BLOCK_TP
#include "block_tp\main.hpp"
#endif

#ifdef F_EVADE_ESCAPE
#include "f_evade_escape\main.hpp"
#endif

#ifdef F_REMOVE_BODY
#include "f_remove_body\main.hpp"
#endif

#ifdef SPAWN_PROTECTION
#include "spawn_protection\main.hpp"
#endif

#ifdef MAP_COVER
#include "map_cover\main.hpp"
#endif

#ifdef SETUP_ZONE
#include "setup_zone\main.hpp"
#endif

#ifdef CH_VIEW_DISTANCE
#include "ch_view_distance\main.hpp"
#endif

#ifdef CIVILIAN_CASUALTY_CAP
#include "civilian_casualty_cap\main.hpp"
#endif

#ifdef TIME_LIMIT
#include "time_limit\main.hpp"
#endif

#ifdef F_CASUALTIES_CAP
#include "f_casualties_cap\main.hpp"
#endif

#ifdef PREVENT_RESLOT
#include "prevent_reslot\main.hpp"
#endif

#ifdef SYNC_STATUS
#include "sync_status\main.hpp"
#endif

#ifdef FRIENDLY_FIRE
#include "friendly_fire\main.hpp"
#endif

#ifdef AO_LIMIT
#include "ao_limit\main.hpp"
#endif

#ifdef TEAM_ROSTER
#include "team_roster\main.hpp"
#endif

#ifdef JIP_TELEPORT
#include "jip_teleport\main.hpp"
#endif

#ifdef COMMANDER_LOCK
#include "commander_lock\main.hpp"
#endif

#ifdef RADIOFREQ
#include "radiofreq\main.hpp"
#endif

#ifdef MISSION_MAKER_TOOLS
#include "mission_maker_tools\main.hpp"
#endif

#ifdef LOADING_SCREEN
#include "loading_screen\main.hpp"
#endif

#ifdef INTROS
#include "intros\main.hpp"
#endif

#ifdef PLANK_BUILDING
#include "plank_building\main.hpp"
#endif

#ifdef ROUND_SYSTEM
#include "round_system\main.hpp"
#endif

#ifdef ACE3_SPECTATOR
#include "ace3_spectator\main.hpp"
#endif

#undef HEADLESS_CLIENT
#undef MISSION_CONDITIONS
#undef ACE3_PLUGIN
#undef RESPAWN_SYSTEM
#undef DAC_PLUGIN
#undef TIME_ACCEL
#undef VANILLA_SPECTATOR
#undef TFAR_PLUGIN
#undef ACRE2_PLUGIN
#undef SPAWN_AI
#undef BLOCK_TP
#undef F_EVADE_ESCAPE
#undef F_REMOVE_BODY
#undef SPAWN_PROTECTION
#undef MAP_COVER
#undef SETUP_ZONE
#undef CH_VIEW_DISTANCE
#undef CIVILIAN_CASUALTY_CAP
#undef TIME_LIMIT
#undef F_CASUALTIES_CAP
#undef PREVENT_RESLOT
#undef SYNC_STATUS
#undef FRIENDLY_FIRE
#undef AO_LIMIT
#undef TEAM_ROSTER
#undef JIP_TELEPORT
#undef COMMANDER_LOCK
#undef RADIOFREQ
#undef MISSION_MAKER_TOOLS
#undef LOADING_SCREEN
#undef INTROS
#undef PLANK_BUILDING
#undef ROUND_SYSTEM
#undef ACE3_SPECTATOR
