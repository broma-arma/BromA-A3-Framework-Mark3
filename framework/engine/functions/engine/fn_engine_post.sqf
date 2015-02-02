[ENGINE_postinits] call BRM_fnc_startPlugins;

[ENGINE_plugins] call BRM_fnc_logPlugins;

["LOCAL", "CHAT", format ["BROMA FRAMEWORK INITIALIZED SUCCESSFULLY IN %1 SECONDS.",(diag_tickTime-startTime)]] call BRM_fnc_doLog;

["LOCAL", "LOG", "=========================================================================================================="] call BRM_fnc_doLog;
["LOCAL", "F_LOG", format ["BROMA FRAMEWORK INITIALIZED SUCCESSFULLY IN %1 SECONDS.",(diag_tickTime-startTime)]] call BRM_fnc_doLog;
["LOCAL", "LOG", "=========================================================================================================="] call BRM_fnc_doLog;