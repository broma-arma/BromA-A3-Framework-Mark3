
// ============================================================================
//                                                                             |
//     Initializes all main Framework functions, including inits and API.      |
//                                                                             |
// ============================================================================

class BRM {
    class plugins {
        file = "framework\engine\functions\engine\plugins";
        class logPlugins{postInit = 1;};
        class warnConflict {postInit = 1;};
    };
    class init {
        file = "framework\engine\functions\engine\init";
        class doLog{};
        class setParams{preInit = 1;};
        class loadSettings{preInit = 1;};
        class initVariables{preInit = 1;};
        class engine_pre{preInit = 1;};
    };
    class unit {
        file = "framework\engine\functions\engine\unit";
        class handleScore{};
        class removeJIP{};
        class setAlias{};
        class setGrpIDGlobal;
        class setHitFace{};
        class defineGroups{postInit = 1;};
    };
    class misc {
        file = "framework\engine\functions\engine\misc";
        class getSpawnPoint{};
        class stampTime{};
        class syncTime{};
        class getSideInfo{};
    };
    class ending {
        file = "framework\engine\functions\engine\ending";
        class callEnding{};
        class endingScreen{};
        class endingGetStats{};
        class endingGetContext{};
    };
    class tasks {
        file = "framework\engine\functions\engine\tasks";
        class newTask{};
        class setTask{};
        class checkTasks{};
        class readExtraction{postInit = 1;};
    };
    class events {
        file = "framework\engine\events";
        class initPlayer{postInit = 1;};
        class initSpectator{};
        class onPlayerKilled{};
        class onPlayerRespawn{};
        class initAI{};
        class onAIKilled{};
    };
    class briefing {
        file = "mission\briefings";
        class loadBriefing{postInit = 1;};
    };
    class api {
        file = "framework\engine\functions\api";
        class newMarkerArea{};
        class newMarkerIcon{};
        class stripItems{};
        class weaponAway{};
        class garrisonUnits{};
        class showText{};
        class colorToHex{};
        class verboseArray{};
        class addIfNew{};
        class unitFromName{};
        class callCodeArea{};
        class setGear{};
        class getGear{};
        class playGlobal{};
    };
    class api_zeus {
        file = "framework\engine\functions\api\zeus";
        class z_setAll{};
        class z_setMode{};
        class z_setSkill{};
        class z_setLoadout{};
    };
    class loadout {
        file = "mission\loadouts";
        class assignLoadout{};
        class assignCargo{};
    };
};