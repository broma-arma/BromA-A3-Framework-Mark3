sleep 2;
_logic =  _this select 0;
_radius = _this select 1;
_time =   _this select 2;
_side =   _this select 3;

_pos = getMarkerPos _logic;
_dir = 0;

if (isServer) then {
  [_time, _side] spawn {
    _time = _this select 0;
    _side = _this select 1;
    
    if ("commander_lock" in usedPlugins) then {
        if (co_lock_tvt_mode) then {
            waitUntil{(co_lock_allSidesReady)};
        } else {
            sleep _time;
        };
    } else {    
        sleep _time;
    };
    
    setup_sides = setup_sides - [_side];
    publicVariable "setup_sides";
  };
};

if (hasInterface) then { // player 

  waitUntil {!isNull player};
  
  if (side player == _side) then {
  
    if (_side in setup_sides) then { // setup
    
      _name = "setup_" + str _side;
      createMarkerLocal [_name, _pos];
      _name setMarkerDirLocal _dir;
      _name setMarkerShapeLocal "RECTANGLE"; 
      _name setMarkerSizeLocal [_radius, _radius];
      _name setMarkerBrushLocal "Border";
      
      if (_side == side_a_side) then { _name setMarkerColorLocal "color"+side_a_color };
      if (_side == side_b_side) then { _name setMarkerColorLocal "color"+side_b_color };
      if (_side == side_c_side) then { _name setMarkerColorLocal "color"+side_c_color };

      _message = "You cannot leave the setup area until the time is over.";
      if ("commander_lock" in usedPlugins) then {
          if (co_lock_tvt_mode) then { _message = "Wait until all sides are ready to start." }
      };
      
      _barrierHandle = [_pos, _radius, _radius, _dir, "rectangle", _message] call BRM_SetupZone_fnc_registerZone;
      
      sleep 5;
      _timetype = "";
      if !("commander_lock" in usedPlugins) then {
          if (_time <= 60) then { _timetype = "seconds" } else { _timetype = "minutes" };
          ["MissionBegins",[(str _time)+" "+_timetype]] call bis_fnc_showNotification;
      } else {
        if (co_lock_tvt_mode) then {
            ["Alert",["The mission will begin when all teams are ready."]] call bis_fnc_showNotification;
        } else {
          if (_time <= 60) then { _timetype = "seconds" } else { _timetype = "minutes" };
          ["MissionBegins",[(str _time)+" "+_timetype]] call bis_fnc_showNotification;        
        };
      };
      
      [_barrierHandle, _name, _side] spawn {
        _barrierHandle = _this select 0;
        _markerName = _this select 1;
        _side = _this select 2;
        
        waitUntil {!(_side in setup_sides)};

        sandi_barrier_barriers set [_barrierHandle, 0];
        deleteMarkerLocal _markerName;
        if ("commander_lock" in usedPlugins) then {
            if !(co_lock_tvt_mode) then {
                ["Alert",["Mission is starting!"]] call bis_fnc_showNotification;
            };
        } else {
            ["Alert",["Mission is starting!"]] call bis_fnc_showNotification;
        };      
      };
    };
  };
};