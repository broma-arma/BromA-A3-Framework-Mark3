FRAMEWORK_DIARY = "framework_diary";
player createDiarySubject [FRAMEWORK_DIARY,"Framework"];

_logPlugins = [];
{
    _path = (missionConfigFile >> "CfgPlugins" >> configName(_x));
    _name = getText( _path >> "name");
    _version = str(getNumber( _path >> "version"));
    _authors = str(getArray( _path >> "authors"));
    
    _logPlugins set [count _logPlugins, format["NAME: %1 <br/>AUTHOR(S): %2 <br/>VERSION: %3", _name, _authors, _version]];        
} forEach (_this select 0);

{
    player createDiaryRecord [FRAMEWORK_DIARY, ["Loaded plugins", _x]];
} forEach _logPlugins;