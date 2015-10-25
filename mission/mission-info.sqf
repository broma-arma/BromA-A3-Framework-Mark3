
// ============================================================================
//                                                                             |
//       Edit this file with the relevant information about your mission.      |
//                                                                             |
// ============================================================================

class Header {

// Mission type. ===============================================================

// https://community.bistudio.com/wiki/Multiplayer_Game_Types
gameType = coop;

// You can ignore these.
minPlayers = 2;
maxPlayers = 50;
};
// Mission and Author's name, loading description and loading picture. =========

onLoadName = "MISSION NAME";
author = "MISSION MAKER";
onLoadMission = "Powered by BromA Framework Mark 3 for ArmA 3";
loadScreen = "mission\images\loading-screen.jpg";

// Disables certain radio channels in the mission. =============================

disableChannels[]={0,1,2};

/* 0 = Global
   1 = Side
   2 = Command
   3 = Group
   4 = Vehicle
   5 = Direct
   6 = System */

// I don't recommend messing with these. =======================================

respawn = "BASE";
respawnDialog = 0;
respawnTemplates[] = {"Base"};
respawndelay = 4;
disabledAI = 1;
enableDebugConsole = 1;
saving = 0;

// =============================================================================