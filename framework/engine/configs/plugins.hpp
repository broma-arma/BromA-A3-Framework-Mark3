#include "..\..\..\mission\plugins.hpp"

#ifdef HEADLESS_CLIENT
#undef HEADLESS_CLIENT
#include "..\..\plugins\headless_client.hpp"
#endif

#ifdef MISSION_CONDITIONS
#undef MISSION_CONDITIONS
#include "..\..\plugins\mission_conditions.hpp"
#endif

#ifdef ACE3_PLUGIN
#undef ACE3_PLUGIN
#include "..\..\plugins\ace3_plugin.hpp"
#endif

#ifdef RESPAWN_SYSTEM
#undef RESPAWN_SYSTEM
#include "..\..\plugins\respawn_system.hpp"
#endif

#ifdef DAC_PLUGIN
#undef DAC_PLUGIN
#include "..\..\plugins\dac_plugin.hpp"
#endif

#ifdef TIME_ACCEL
#undef TIME_ACCEL
#include "..\..\plugins\time_accel.hpp"
#endif

#ifdef VANILLA_SPECTATOR
#undef VANILLA_SPECTATOR
#include "..\..\plugins\vanilla_spectator.hpp"
#endif

#ifdef TFAR_PLUGIN
#undef TFAR_PLUGIN
#include "..\..\plugins\tfar_plugin.hpp"
#endif

#ifdef ACRE2_PLUGIN
#undef ACRE2_PLUGIN
#include "..\..\plugins\acre2_plugin.hpp"
#endif

#ifdef SPAWN_AI
#undef SPAWN_AI
#include "..\..\plugins\spawn_ai.hpp"
#endif

#ifdef BLOCK_TP
#undef BLOCK_TP
#include "..\..\plugins\block_tp.hpp"
#endif

#ifdef F_EVADE_ESCAPE
#undef F_EVADE_ESCAPE
#include "..\..\plugins\f_evade_escape.hpp"
#endif

#ifdef F_REMOVE_BODY
#undef F_REMOVE_BODY
#include "..\..\plugins\f_remove_body.hpp"
#endif

#ifdef SPAWN_PROTECTION
#undef SPAWN_PROTECTION
#include "..\..\plugins\spawn_protection.hpp"
#endif

#ifdef MAP_COVER
#undef MAP_COVER
#include "..\..\plugins\map_cover.hpp"
#endif

#ifdef SETUP_ZONE
#undef SETUP_ZONE
#include "..\..\plugins\setup_zone.hpp"
#endif

#ifdef CH_VIEW_DISTANCE
#undef CH_VIEW_DISTANCE
#include "..\..\plugins\ch_view_distance.hpp"
#endif

#ifdef CIVILIAN_CASUALTY_CAP
#undef CIVILIAN_CASUALTY_CAP
#include "..\..\plugins\civilian_casualty_cap.hpp"
#endif

#ifdef TIME_LIMIT
#undef TIME_LIMIT
#include "..\..\plugins\time_limit.hpp"
#endif

#ifdef F_CASUALTIES_CAP
#undef F_CASUALTIES_CAP
#include "..\..\plugins\f_casualties_cap.hpp"
#endif

#ifdef PREVENT_RESLOT
#undef PREVENT_RESLOT
#include "..\..\plugins\prevent_reslot.hpp"
#endif

#ifdef SYNC_STATUS
#undef SYNC_STATUS
#include "..\..\plugins\sync_status.hpp"
#endif

#ifdef FRIENDLY_FIRE
#undef FRIENDLY_FIRE
#include "..\..\plugins\friendly_fire.hpp"
#endif

#ifdef AO_LIMIT
#undef AO_LIMIT
#include "..\..\plugins\ao_limit.hpp"
#endif

#ifdef TEAM_ROSTER
#undef TEAM_ROSTER
#include "..\..\plugins\team_roster.hpp"
#endif

#ifdef JIP_TELEPORT
#undef JIP_TELEPORT
#include "..\..\plugins\jip_teleport.hpp"
#endif

#ifdef COMMANDER_LOCK
#undef COMMANDER_LOCK
#include "..\..\plugins\commander_lock.hpp"
#endif

#ifdef RADIOFREQ
#undef RADIOFREQ
#include "..\..\plugins\radiofreq.hpp"
#endif

#ifdef MISSION_MAKER_TOOLS
#undef MISSION_MAKER_TOOLS
#include "..\..\plugins\mission_maker_tools.hpp"
#endif

#ifdef LOADING_SCREEN
#undef LOADING_SCREEN
#include "..\..\plugins\loading_screen.hpp"
#endif

#ifdef INTROS
#undef INTROS
#include "..\..\plugins\intros.hpp"
#endif

#ifdef PLANK_BUILDING
#undef PLANK_BUILDING
#include "..\..\plugins\plank_building.hpp"
#endif

#ifdef ROUND_SYSTEM
#undef ROUND_SYSTEM
#include "..\..\plugins\round_system.hpp"
#endif

#ifdef ACE3_SPECTATOR
#undef ACE3_SPECTATOR
#include "..\..\plugins\ace3_spectator.hpp"
#endif
