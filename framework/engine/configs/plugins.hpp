#include "..\..\..\mission\plugins.hpp"

#ifdef HEADLESS_CLIENT
#include "..\..\plugins\headless_client\main.hpp"
#endif

#ifdef MISSION_CONDITIONS
#include "..\..\plugins\mission_conditions\main.hpp"
#endif

#ifdef ACE3_PLUGIN
#include "..\..\plugins\ace3_plugin\main.hpp"
#endif

#ifdef RESPAWN_SYSTEM
#include "..\..\plugins\respawn_system\main.hpp"
#endif

#ifdef DAC_PLUGIN
#include "..\..\plugins\dac_plugin\main.hpp"
#endif

#ifdef TIME_ACCEL
#include "..\..\plugins\time_accel\main.hpp"
#endif

#ifdef VANILLA_SPECTATOR
#include "..\..\plugins\vanilla_spectator\main.hpp"
#endif

#ifdef TFAR_PLUGIN
#include "..\..\plugins\tfar_plugin\main.hpp"
#endif

#ifdef ACRE2_PLUGIN
#include "..\..\plugins\acre2_plugin\main.hpp"
#endif

#ifdef SPAWN_AI
#include "..\..\plugins\spawn_ai\main.hpp"
#endif

#ifdef BLOCK_TP
#include "..\..\plugins\block_tp\main.hpp"
#endif

#ifdef F_EVADE_ESCAPE
#include "..\..\plugins\f_evade_escape\main.hpp"
#endif

#ifdef F_REMOVE_BODY
#include "..\..\plugins\f_remove_body\main.hpp"
#endif

#ifdef SPAWN_PROTECTION
#include "..\..\plugins\spawn_protection\main.hpp"
#endif

#ifdef MAP_COVER
#include "..\..\plugins\map_cover\main.hpp"
#endif

#ifdef SETUP_ZONE
#include "..\..\plugins\setup_zone\main.hpp"
#endif

#ifdef CH_VIEW_DISTANCE
#include "..\..\plugins\ch_view_distance\main.hpp"
#endif

#ifdef CIVILIAN_CASUALTY_CAP
#include "..\..\plugins\civilian_casualty_cap\main.hpp"
#endif

#ifdef TIME_LIMIT
#include "..\..\plugins\time_limit\main.hpp"
#endif

#ifdef F_CASUALTIES_CAP
#include "..\..\plugins\f_casualties_cap\main.hpp"
#endif

#ifdef PREVENT_RESLOT
#include "..\..\plugins\prevent_reslot\main.hpp"
#endif

#ifdef SYNC_STATUS
#include "..\..\plugins\sync_status\main.hpp"
#endif

#ifdef FRIENDLY_FIRE
#include "..\..\plugins\friendly_fire\main.hpp"
#endif

#ifdef AO_LIMIT
#include "..\..\plugins\ao_limit\main.hpp"
#endif

#ifdef TEAM_ROSTER
#include "..\..\plugins\team_roster\main.hpp"
#endif

#ifdef JIP_TELEPORT
#include "..\..\plugins\jip_teleport\main.hpp"
#endif

#ifdef COMMANDER_LOCK
#include "..\..\plugins\commander_lock\main.hpp"
#endif

#ifdef RADIOFREQ
#include "..\..\plugins\radiofreq\main.hpp"
#endif

#ifdef MISSION_MAKER_TOOLS
#include "..\..\plugins\mission_maker_tools\main.hpp"
#endif

#ifdef LOADING_SCREEN
#include "..\..\plugins\loading_screen\main.hpp"
#endif

#ifdef INTROS
#include "..\..\plugins\intros\main.hpp"
#endif

#ifdef PLANK_BUILDING
#include "..\..\plugins\plank_building\main.hpp"
#endif

#ifdef ROUND_SYSTEM
#include "..\..\plugins\round_system\main.hpp"
#endif

#ifdef ACE3_SPECTATOR
#include "..\..\plugins\ace3_spectator\main.hpp"
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
