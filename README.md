<p align="center">
  <a href="https://github.com/Neefay/BromA-A3-Framework-Mark3">
   <img src="http://puu.sh/eDbHl/2cd8db6b43.png" alt="BromA Framework">
  </a>
   <br/><br/>
  <a href="https://github.com/Neefay/BromA-A3-Framework-Mark3/commits/master">
    <img src="https://img.shields.io/badge/build-00033-orange.svg" alt="Current version">
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

### TO DO (priority order):
-
*	- [ ] BUG: HC isn't working anymore, AGAIN. Sometimes it works, sometimes it gives a DAC WP generation failure. IT'S A MYSTERY!
		- Make sure HC loads before anything else.
*	- [ ] JIP BUG: Groups and units aren't loaded correctly upon joining.
*	- [X] JIP BUG: Respawn plugin not working for JIPs.
*	- [X] JIP BUG: If you JIP as a certain group, you will not get your correct loadout.
*	- [X] BUG: Parameters orders are inverted, my fault.
*	- [ ] BUG: If two units join the same automatically named group, they will be called *.
*	- [ ] Add default pre-placed units.
*	- [ ] Add a general plugins settings file.
*	- [ ] Add all the proper endings.
*	- [ ] Fix the ending screen.
*	- [ ] Work all current loadouts to have proper variables.
		- [X] Loadouts still need Crewmen, Snipers and Pilots and maybe other things.
*	- [X] There are a bunch of new pre-set units, maybe add them DAC default units with vehicles included.		
*	- [ ] Rewrite the casualty cap to account for units, acquired from inputted groups.
*	- [X] Make it so all relevant groups are declared for each side, maybe as blu/op/ind_mainunits?
*	- [X] BUG: ALL parameters are fucked and not being broadcast over network, double check.
*	- [X] BUG: Radio freq plugin reads the wrong groups. GEE I WONDER WHAT IS THE ISSUE HERE?!?!?!??!
*	- [X] BUG: Unit's group not published over network - God, I just LOVE debugging locality issues!
*	- [X] JIP BUG: Apparently everything freezes upon JIPing? Really messed up, gotta investigate with another player.
*	- [X] Work a system for containers/vehicles.
*	- [X] Declare all units as objNulls.
*	- [X] Make sure DAC can spawn unit with default gear.
*	- [X] Better way to control player loadouts - switch case for all factions.
*	- [X] Make a new loadout style with less redundancy.
*	- [X] Bring back the old way with _primaryrifles etc.
*	- [X] Make a script to generate callsigns and radios freqs based on the mission groups.
*	- [X] Delegate unit alias to the server / JIPs initialize their own groups afterwards.
*	- [X] Look into ditching the group unitInit and use only the unit's name.
*	- [ ] Comment and document everything.

NEED HELP TO TEST:

*	- [X] Nothing for now.

### What then?

I am very commited to document and explain the usability process of this framework so that even the most clueless user can pick it up and get cracking in a few hours at most - expect a wiki with all the API and functions, and definitely video tutorials since I'm a video learner myself.
