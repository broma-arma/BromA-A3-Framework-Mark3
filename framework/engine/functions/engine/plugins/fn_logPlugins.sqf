/*
================================================================================

NAME:
    BRM_fnc_logPlugins

AUTHOR(s):
    Nife

DESCRIPTION:
    Reads and logs all plugins based on their meta-data attributes.

PARAMETERS:
    Nothing.

USAGE:
    [] call BRM_fnc_logPlugins

RETURNS:
    Nothing.

================================================================================
*/

#define LOADED_PLUGINS (missionConfigFile >> "CfgPlugins")
framework_version = call compile preprocessFile "framework\version.txt";

ENGINE_plugins = [];
usedPlugins = [];

plugins_loaded = false;

for "_i" from 0 to ((count LOADED_PLUGINS) - 1) do {
    private ["_plugin"];
    
    _plugin = configName(LOADED_PLUGINS select _i);

    usedPlugins pushBack _plugin;

    ENGINE_plugins pushBack (LOADED_PLUGINS select _i);
};

plugins_loaded = true;

FRAMEWORK_DIARY = "framework_diary";
player createDiarySubject [FRAMEWORK_DIARY,"Framework"];

_logPlugins = [];
{
    _path = (missionConfigFile >> "CfgPlugins" >> configName(_x));
    _name = getText( _path >> "name");
    _version = str(getNumber( _path >> "version"));
    _authors = (getArray( _path >> "authors"));
    _authors = [_authors] call BRM_fnc_verboseArray;
    _description = getText( _path >> "description");

    _logPlugins set [count _logPlugins, format[
        "<execute expression='hint
        ""%1 v%3\nby %2\n\n%4""
        '>[?]</execute> %1 v%3 by %2.", _name, _authors, _version, _description]];
} forEach ENGINE_plugins;

reverse _logPlugins;

_logPlugins spawn {
    waitUntil {!isNil "framework_init_time"};
    { player createDiaryRecord [FRAMEWORK_DIARY, ["Framework", _x]] } forEach _this;
    player createDiaryRecord [FRAMEWORK_DIARY, ["Framework", "<br/>These are the plugins currently being utilized in this mission: </br>"]];

    player createDiaryRecord [FRAMEWORK_DIARY, ["Framework", "======================================"]];
    player createDiaryRecord [FRAMEWORK_DIARY, ["Framework", format ["Initialized in %1 seconds.", framework_init_time]]];
    player createDiaryRecord [FRAMEWORK_DIARY, ["Framework", format ["BromA Framework MK 3 - version %1", framework_version]]];
    player createDiaryRecord [FRAMEWORK_DIARY, ["Framework", "<br/>======================================"]];
};