/*
================================================================================

NAME:
    BRM_fnc_warnConflict

AUTHOR(s):
    Nife

DESCRIPTION:
    Finds if any plugins declared in the plugin's "conflict_plugins"
    are enabled, and then displays a warning to the user.

PARAMETERS:
    None.

USAGE:
    [] call BRM_fnc_warnConflict;

RETURNS:
    Plugins with conflicts. [framework_plugin_conflicts](ARRAY)

================================================================================
*/

framework_plugin_conflicts = [];

{
    private["_errors"];

    _path = (missionConfigFile >> "CfgPlugins" >> configName(_x));
    _name = getText( _path >> "name");
    _version = str(getNumber( _path >> "version"));
    _conflictPlugins = getArray(_path >> "conflict_plugins");

    _errors = [format["The plugin %1(v%2) has a conflicted with some currently enabled Plugins. Please disable the following:", _name, _version]];

    { if (_x in usedPlugins) then { _errors pushBack _x } } forEach _conflictPlugins;

    if (count _errors > 1) then {
        framework_plugin_conflicts pushBack _name;

        _errors spawn {
            sleep (random(1)+0.5);
            "FRAMEWORK PLUGIN CONFLICT:" hintC _this;
        };
    };
} forEach ENGINE_plugins;