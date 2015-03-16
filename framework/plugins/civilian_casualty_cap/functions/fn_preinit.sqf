#include "includes\settings.sqf";

if (isNil "hostile_civilians") then { hostile_civilians = [] };

if (isNil "dead_civilians_side_a" ) then { dead_civilians_side_a = 0 };
if (isNil "dead_civilians_side_b" ) then { dead_civilians_side_b = 0 };
if (isNil "dead_civilians_side_c" ) then { dead_civilians_side_c = 0 };