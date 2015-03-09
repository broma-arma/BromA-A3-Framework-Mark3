
// https://community.bistudio.com/wiki/Multiplayer_Game_Types
gameType = COOP;

minPlayers = 2;
maxPlayers = 50;

onLoadName = "MISSION NAME";
author = "MISSION MAKER";
onLoadMission = "Made with the Broma Framework A3";
loadScreen = "mission\images\loading-screen.jpg";
onLoadMissionTime = 0;

respawn = "BASE";
respawnDialog = 0;
respawnTemplates[] = {"Base"};
respawndelay = 4;
disabledAI = 1;
enableDebugConsole = 1;
saving = 0;

disableChannels[]={0,1,2};

/* 0 = Global
   1 = Side
   2 = Command
   3 = Group
   4 = Vehicle
   5 = Direct
   6 = System */