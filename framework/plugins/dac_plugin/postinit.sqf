
waitUntil{!isNil "DAC_STRPlayers"};
waitUntil{(mission_AI_controller)};

#include "settings.sqf"

_center = createCenter sideLogic; _group = createGroup _center;
DAC_module = _group createUnit ["DAC_Source_Extern", [0,0,0],[], 1,"NONE"];
publicVariable "DAC_module";

["ALL","CHAT", format ["%1 is managing DAC.", mission_AI_controller_name]] call BRM_fnc_doLog;