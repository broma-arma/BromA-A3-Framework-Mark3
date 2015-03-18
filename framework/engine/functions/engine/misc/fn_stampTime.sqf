/*
================================================================================

NAME:
    BRM_fnc_stampTime
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Synchronizes time on the server.

PARAMETERS:
    None.
    
USAGE:
    [] spawn BRM_fnc_stampTime
    
RETURNS:
    Nothing.

================================================================================
*/

if (isServer) then {
    while {true} do {
        current_server_time = date; publicVariable "current_server_time";
        current_server_fog = fog; publicVariable "current_server_fog";
        current_server_rain = rain; publicVariable "current_server_rain";
        current_server_overcast = overcast; publicVariable "current_server_overcast";
        current_server_rainbow = rainbow; publicVariable "current_server_rainbow";
        current_server_windstr = windstr; publicVariable "current_server_windstr";
        current_server_windforce = wind; publicVariable "current_server_windforce";
        current_server_waves = waves; publicVariable "current_server_waves";
        ["LOCAL", "LOG", format ["SERVER TIME STAMP @ %9: DATE: %1 | FOG: %2 | RAIN: %3 | OVERCAST %4 | RAINBOW: %5 | WIND STRENGTH: %6 | WIND FORCE: %7 | WAVES: %8",current_server_time,current_server_fog,current_server_rain,current_server_overcast,current_server_rainbow,current_server_windstr,current_server_windforce,current_server_waves,time]] call BRM_fnc_doLog;
        sleep 600;        
    };
};