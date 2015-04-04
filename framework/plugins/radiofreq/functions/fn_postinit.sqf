if (!isServer) exitWith {};

0 spawn {

mission_valid_groups = [];
mission_valid_groups_name = [];

mission_valid_groups_BLU = [];
mission_valid_groups_OP = [];
mission_valid_groups_IND = [];
mission_valid_groups_CIV = [];

mission_valid_groups_name_BLU = [];
mission_valid_groups_name_OP = [];
mission_valid_groups_name_IND = [];
mission_valid_groups_name_CIV = [];

mission_used_freqs = [];

_validSides = [west, east, resistance, civilian];

{
    private["_groupIndex"];
    
    _leader = objNull;
    { if (isFormationLeader _x) then { _leader = _x } } forEach (units _x);
    _side = (side _leader);
    _leaderstr = str _leader;    
    _groupIndex = 0;
    if (isNull _leader) then { _groupIndex = 0 } else {
        _groupIndex = ([_leaderstr, "_"] call CBA_fnc_split);
        if (count _groupIndex >= 3) then { _groupIndex = _groupIndex select 2 } else { _groupIndex = "0" };
        _groupIndex = parseNumber _groupIndex;
    };
    
    _groupID = groupID _x;
    _groupName = ([_groupID, " "] call CBA_fnc_split) select 0;
    
    if !(_groupName in mission_valid_groups_name) then {
        
        mission_valid_groups_name pushBack _groupName;
        
        _newFreq = [30,512] call BIS_fnc_randomInt;
        mission_used_freqs pushBack _newFreq;
        
        while{!(_newFreq in mission_used_freqs)} do {
            _newFreq = [30,512] call BIS_fnc_randomInt;
        };
        
        _pushName = [_groupName, _newFreq, _side];
        
        switch (true) do {
            case(_side == WEST): { mission_valid_groups_name_BLU pushBack _pushName };
            case(_side == EAST): { mission_valid_groups_name_OP pushBack _pushName };
            case(_side == RESISTANCE): { mission_valid_groups_name_IND pushBack _pushName };
            case(_side == CIVILIAN): { mission_valid_groups_name_CIV pushBack _pushName};
        };        
    };
    
    _push = [_groupID, _side];
    
    if ((!(_push in mission_valid_groups)) && (_side in _validSides) && (_groupIndex > 0) && (isPlayer _leader)) then {
        
        mission_valid_groups pushBack _push;
        publicVariable "mission_valid_groups";

        switch (true) do {
            case(_side == WEST): { mission_valid_groups_BLU pushBack (_push + [(count mission_valid_groups_BLU) + 1]) };
            case(_side == EAST): { mission_valid_groups_OP pushBack (_push + [(count mission_valid_groups_OP) + 1]) };
            case(_side == RESISTANCE): { mission_valid_groups_IND pushBack (_push + [(count mission_valid_groups_IND) + 1]) };
            case(_side == CIVILIAN): { mission_valid_groups_CIV pushBack (_push + [(count mission_valid_groups_CIV) + 1]) };
        };
    };
} forEach allGroups;

publicVariable "mission_valid_groups_name_BLU";
publicVariable "mission_valid_groups_name_OP";
publicVariable "mission_valid_groups_name_IND";
publicVariable "mission_valid_groups_name_CIV";

publicVariable "mission_valid_groups_BLU";
publicVariable "mission_valid_groups_OP";
publicVariable "mission_valid_groups_IND";
publicVariable "mission_valid_groups_CIV";

_formatChannel = {
    _groups = _this;
    _ret = "";
    {
        _add = format ["%1 - ch. %2<br/>",(_x select 0),(_x select 2)];
        _ret = _ret + _add;
    } forEach _groups;
    _ret
};

_formatFreq = {
    _groups = _this;
    _ret = "";
    {
        _add = format ["%1 - FREQ: %2<br/>",(_x select 0),(_x select 1)];
        _ret = _ret + _add;
    } forEach _groups;
    _ret
};

mission_radiochannels_add_BLU = mission_valid_groups_name_BLU call _formatFreq; publicVariable "mission_radiochannels_add_BLU";
mission_radiochannels_add_OP = mission_valid_groups_name_OP call _formatFreq; publicVariable "mission_radiochannels_add_OP";
mission_radiochannels_add_IND = mission_valid_groups_name_IND call _formatFreq; publicVariable "mission_radiochannels_add_IND";
mission_radiochannels_add_CIV = mission_valid_groups_name_CIV call _formatFreq; publicVariable "mission_radiochannels_add_CIV";

mission_radiochannels_BLU = mission_valid_groups_BLU call _formatChannel; publicVariable "mission_radiochannels_BLU";
mission_radiochannels_OP = mission_valid_groups_OP call _formatChannel; publicVariable "mission_radiochannels_OP";
mission_radiochannels_IND = mission_valid_groups_IND call _formatChannel; publicVariable "mission_radiochannels_IND";
mission_radiochannels_CIV = mission_valid_groups_CIV call _formatChannel; publicVariable "mission_radiochannels_CIV";

};