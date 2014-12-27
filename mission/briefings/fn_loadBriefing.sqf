// ====================================================================================
// BRIEFING GOES ON HERE
//[] execVM CUSTOM_FILES_PATH+"credits.sqf";

switch (side player) do
{
case WEST:
{
diag_log "== PLAYER: ASSIGNING WEST BRIEFING ===================================";
#include "briefing-west.sqf";
};
case EAST:
{
diag_log "== PLAYER: ASSIGNING EAST BRIEFING ===================================";
#include "briefing-east.sqf";
};
case RESISTANCE:
{
diag_log "== PLAYER: ASSIGNING INDEPENDENT BRIEFING ============================";
#include "briefing-ind.sqf";
};
case CIVILIAN:
{
diag_log "== PLAYER: ASSIGNING CIVILIAN BRIEFING ===================================";    
#include "briefing-civ.sqf";
};
};