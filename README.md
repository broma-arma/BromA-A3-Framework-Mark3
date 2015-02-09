<p align="center">
  <a href="https://github.com/Neefay/BromA-A3-Framework-Mark3">
   <img src="http://puu.sh/eDbHl/2cd8db6b43.png" alt="BromA Framework">
  </a>
   <br/><br/>
  <a href="https://github.com/Neefay/BromA-A3-Framework-Mark3/commits/master">
    <img src="https://img.shields.io/badge/build-00032-orange.svg" alt="Current version">
  </a>
</p>

The **BromA Framework** is a community effort made by the BromA group in order to establish a standard shared across all missions - which could then be customized by the content maker.

Since this could only be made thanks to shared scripts, missions and all sorts of knowledge, this project is entirely open-source and interested users are free to play with it as much as they want.

Also keeping up with good practices, most functionality is modular and therefore optional to the user: adding and disabling plugins from the mission is extremely easy.

### FEATURES
*	Well organized and context-agnostic.
*	Plugin system makes sharing functionality super easy.
*	Tasks system which is very flexible and simple to understand.
*	AGM, TFAR and DAC are fully integrated.
*	Team killing warning.
*	Teleporting for the mission maker.
*	Simple loading screen to avoid desync at mission start.
*	Limit player movement to the AO.
*	Team Roster.
*	Respawn system with tickets and respawn waves.
*	Casualty Cap and Body Removal, taken from the F3 Framework with given credits.
*	Commander Lock which makes weapons cold.
*	Mission time limit.
*	Setup Zone for TvTs.
*	Spawn protection.
*	Casualty cap for civilians.
*	JIPs can teleport to their squadmates when joining.
*	Very effective loadout system.
*	Cargo made simple.

The framework is as context agnostic as possible, meaning you can just change one value and your mission will change from a COOP into a TVT or even a COTVT - everything is already pre-configured to be flexible and as little as possible assumptions are made about the mission itself.

### TO DO:
-
*	- [ ] BUG: "param_setup_time" not published over network.
*	- [ ] BUG: ALL parameters are fucked and not being broadcast over network, double check.
*	- [ ] BUG: "mission_spawn_protection_time" not published over network.
*	- [ ] BUG: Radio freq plugin reads the wrong groups. GEE I WONDER WHAT IS THE ISSUE HERE?!?!?!??!
*	- [ ] BUG: Unit's group not published over network - God, I just LOVE debugging locality issues!
*	- [ ] TEST EVERYTHING WITH OTHER PLAYERS. Enough new features for now.
*	- [X] Work a system for containers/vehicles.
*	- [ ] Add default pre-placed units.
*	- [X] Declare all units as objNulls.
*	- [ ] Add a general plugins settings file.
*	- [X] Make sure DAC can spawn unit with default gear.
*	- [X] Better way to control player loadouts - switch case for all factions.
*	- [X] Make a new loadout style with less redundancy.
*	- [X] Bring back the old way with _primaryrifles etc.
*	- [ ] Work all current loadouts to have proper variables.
*	- [ ] Add all the proper endings.
*	- [X] Make a script to generate callsigns and radios freqs based on the mission groups.
*	- [X] Delegate unit alias to the server / JIPs initialize their own groups afterwards.
*	- [X] Look into ditching the group unitInit and use only the unit's name.
*	- [ ] Fix the ending screen.
*	- [ ] Comment and document everything.

### What then?

I am very commited to document and explain the usability process of this framework so that even the most clueless user can pick it up and get cracking in a few hours at most - expect a wiki with all the API and functions, and definitely video tutorials since I'm a video learner myself.
