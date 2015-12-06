
// ============================================================================
//                                                                             |
//         Use this script to call any functions or further scripts            |
//         in order to create and spawn AI units into your mission.            |
//                                                                             |
//     Keep in mind that only the AI Controller (server or HC) should run      |
//                                these scripts.                               |
//                                                                             |
//        A few DAC zones and camps have already been configured below.        |
//                                                                             |
// ============================================================================

waitUntil{(mission_AI_controller)};

if ("spawn_ai" in usedPlugins) then { waitUntil{(!isNil "BRM_SpawnAI_fnc_infantry")};


};

if ("dac_plugin" in usedPlugins) then { waitUntil{(!isNil "BRM_DAC_fnc_new")};

    [trg1, "Create an activated normal default enemy zone named zone1 on network 1, with 1 group of infantry."] spawn BRM_DAC_fnc_new;

    /* ================================================

    EXAMPLES OF AI ZONES:

    Easy enemies:
    [trg1, "Create an activated easy default enemy zone named anything on network random, with 1 squad of infantry."] spawn BRM_DAC_fnc_new;

    Difficult enemies with combined arms:
    [trg2, "Create an activated hard default enemy zone named anything on network random, with 2 squads of infantry, 2 fire-teams of vehicles and 1 group of armor."] spawn BRM_DAC_fnc_new;

    Named zone assigned to a network:
    [trg3, "Create an activated normal default friendly zone named NamedZone1 on network 2, with 2 squads of vehicles."] spawn BRM_DAC_fnc_new;

    Making camps:
    [trg1, "Create 1 normal default friendly camp named anything on a random network, with 25 respawns of infantry supporting NamedZone1."] spawn BRM_DAC_fnc_new;

    Camps supporting a network:
    [c1, "Create 1 normal default friendly camp named anything on network 2, with 25 respawns of infantry."] spawn BRM_DAC_fnc_new;

    Camps supporting both with extra zones:
    [c1, "Create 3 normal default friendly camps named anything on network 2, with 25 respawns of infantry supporting NamedZone1, NamedZone2 and NamedZone3."] spawn BRM_DAC_fnc_new;

    =================================================== */

};
