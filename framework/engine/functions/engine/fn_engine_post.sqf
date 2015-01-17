[ENGINE_postinits] call BRM_fnc_startPlugins;

[ENGINE_plugins] call BRM_fnc_logPlugins;

player sidechat format ["BROMA FRAMEWORK INITIALIZED SUCCESSFULLY IN %1 SECONDS.",(diag_tickTime-startTime)];