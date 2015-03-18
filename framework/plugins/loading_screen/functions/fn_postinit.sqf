if ((!isMultiplayer)||(!hasInterface)) exitWith {};

0 spawn {
    // Credits to Cephei for the improvement idea.

    //==============================================================================
    // Here we declare what text will be shown to the player when the game is loading.

    _loadingScreen =
        "Please wait in order to allow the game to load properly.";
    //==============================================================================

    #include "includes\settings.sqf"

    player spawn { player action ["SwitchWeapon", vehicle player, vehicle player, 99] };

    _fps = round(diag_fps);

    while {(_fps < _reqFPS)&&!(_timeout == 0)} do {
      titletext [_loadingScreen, "BLACK FADED",0];
      sleep 1;
      _fps = round(diag_fps);
      _timeout = _timeout - 1;
    };
    sleep 1;

    titleText ["", "PLAIN"];

    loading_screen_finished = true;
};