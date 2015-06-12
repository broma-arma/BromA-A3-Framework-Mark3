
if (!isServer) exitWith {};
if !((isClass(configFile>>"CfgPatches">>"ALIVE_MAIN"))) exitWith {};

_center = createCenter sideLogic;
_group = createGroup _center;

_module = _group createUnit ["ALiVE_require", [0,0,0],[],0.5,"NONE"];
_module setVariable ["ALiVE_DISABLEADMINACTIONS", false];
_module setVariable ["ALiVE_DISABLEMARKERS", false];
_module setVariable ["ALiVE_DISABLESAVE", "true"];
_module setVariable ["ALiVE_GC_INDIVIDUALTYPES", ""];
_module setVariable ["ALiVE_GC_INTERVAL", 0];
_module setVariable ["ALiVE_GC_THRESHHOLD", 100];
_module setVariable ["ALiVE_Versioning", 1];
_module setVariable ["debug", false];

if (mission_alive_db) then {
    _module = _group createUnit ["ALiVE_sys_data", [0,0,0],[],0.5,"NONE"];
    _module setVariable ["customPerfMonCode", "[['entities',150],['vehicles',300],['agents',450],['allDead',600],['objects',750],['triggers',900]]"];
    _module setVariable ["disableAAR", "false"];
    _module setVariable ["disablePerf", "false"];
    _module setVariable ["disablePerfMon", "false"];
    _module setVariable ["disableStats", "false"];
    _module setVariable ["saveDateTime", "true"];
    _module setVariable ["source", "CouchDB"];
};