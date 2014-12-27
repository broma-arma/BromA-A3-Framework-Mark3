FRAMEWORK_DIARY = "framework_diary";
player createDiarySubject [FRAMEWORK_DIARY,"Framework"];

[ENGINE_postinits] call BRM_fnc_loadPlugins;

[ENGINE_plugins] call BRM_fnc_logPlugins;