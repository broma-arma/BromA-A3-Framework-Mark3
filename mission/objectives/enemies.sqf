waitUntil{(mission_AI_controller)};

if ("dac_plugin" in usedPlugins) then { waitUntil{(!isNil "BRM_DAC_fnc_new")};
    
    [trg1, "Create an activated normal default friendly zone named whatever, with few infantry."] spawn BRM_DAC_fnc_new;
//  [trg_2, "Create an activated easy default enemy zone named zone2, with few infantry."] spawn BRM_fnc_DAC;
//  [trg_3, "Create an automatic normal default friendly zone named zone3, with few infantry."] spawn BRM_fnc_DAC;
//  [z1, "Create 3 normal default friendly camps named anything, with 25 respawns of infantry supporting zone2, zone3 and zone4."] spawn BRM_fnc_DAC;
};