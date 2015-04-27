if ((!isMultiplayer)||(!hasInterface)) exitWith { intro_cutscene_over = true; };

if ((player_is_jip)||(player_is_spectator)) exitWith { intro_cutscene_over = true; };

intro_cutscene_over = false;

0 spawn {
    
_play = true;

if (isNil "intro_cutscene") then { intro_cutscene = "ESTABLISHING" };

if ("loading_screen" in usedPlugins) then {
    waitUntil{!isNil "loading_screen_finished" };
} else { sleep 0.1 };

if ("respawn_system" in usedPlugins) then {
    waitUntil{!isNil "player_current_lives" };
    if (player_current_lives == 0) then { _play = false };
};

if (!_play) exitWith { intro_cutscene_over = true };

_posPlayer = [getpos player select 0, getpos player select 1, getpos player select 2];

switch (intro_cutscene) do {
    #include "includes\intros.sqf"
};

intro_cutscene_over = true;

};