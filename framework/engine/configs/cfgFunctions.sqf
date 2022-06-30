
// ============================================================================
//                                                                             |
//     Initializes all main Framework functions, including inits and API.      |
//                                                                             |
// ============================================================================

class BRM {
    class init {
        file = "framework\engine\functions\engine\init";
        class engine_pre{preInit = 1;};
    };
    class events {
        file = "framework\engine\events";
		// TODO Move/Remove these? Have these ever been modified in a mission?
        class onPlayerKilled{};
        class onPlayerRespawn{};
        class onAIKilled{};
    };
};
