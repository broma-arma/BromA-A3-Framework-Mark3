
params["_reason","_color"];

switch (round_end_notification) do {
    case "NOTIFICATION": { [_color,[_reason]] call BIS_fnc_showNotification };
    case "HINT": { hint _reason };
};

if (round_display_score) then {

    _msg = format ["
    <t size='1.3' color='%1'>%2: %3 points</t><br/>
    <t size='1.3' color='%4'>%5: %6 points</t><br/>
    ", [side_a_color] call BRM_fnc_colorToHex, side_a_name, match_points_a, [side_b_color] call BRM_fnc_colorToHex, side_b_name, match_points_b];

    if (mission_enable_side_c) then {
        _msg = _msg + format ["<t size='1.3' color='%1'>%2: %3 points</t><br/>",
        [side_c_color] call BRM_fnc_colorToHex, side_c_name, match_points_c];
    };

    if ((match_points_a == BRM_round_system_rounds_needed-1)||
       (match_points_b == BRM_round_system_rounds_needed-1)||
       (match_points_c == BRM_round_system_rounds_needed-1)) then {
           _msg = _msg + "<br/><t size='1.3'>MATCH POINT!</t><br/>";
       };

    [-1, {[_this,-1,-1,5,1] call BIS_fnc_dynamicText}, _msg] call CBA_fnc_globalExecute;
};