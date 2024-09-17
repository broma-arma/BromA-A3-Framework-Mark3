// Use this file to call any functions or scripts that spawn AI units.
// Only the AI Controller (Server or Headless Client) will execute this file.

[dacZone_1, "Create an activated normal default friendly zone named zone1 on network 1, with 1 group of infantry and 2 groups of vehicles."] call BRM_FMK_DAC_fnc_new;

// DAC Zone Examples
//   Enemy zone:
//[dacZone_1, "Create an activated normal default enemy zone named anything on network random, with 1 squad of infantry."] call BRM_FMK_DAC_fnc_new;
//   Combined arms enemy zone:
//[dacZone_1, "Create an activated normal default enemy zone named anything on network random, with 2 squads of infantry, 2 fire-teams of vehicles and 1 group of armor."] call BRM_FMK_DAC_fnc_new;

// DAC Camp Examples
//   Camp supporting a network:
//[c1, "Create 1 normal default friendly camp named anything on network 2, with 25 respawns of infantry."] call BRM_FMK_DAC_fnc_new;
//   Camp supporting a named zone:
//[c1, "Create 1 normal default friendly camp named anything on a random network, with 25 respawns of infantry supporting zone1."] call BRM_FMK_DAC_fnc_new;
//   Camp supporting both, with extra zones:
//[c1, "Create 3 normal default friendly camps named anything on network 2, with 25 respawns of infantry supporting zone1, zone2 and zone3."] call BRM_FMK_DAC_fnc_new;
