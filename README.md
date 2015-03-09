<p align="center">
  <a href="https://github.com/Neefay/BromA-A3-Framework-Mark3">
   <img src="http://puu.sh/eDbHl/2cd8db6b43.png" alt="BromA Framework">
  </a>
   <br/><br/>
  <a href="https://github.com/Neefay/BromA-A3-Framework-Mark3/commits/master">
    <img src="https://img.shields.io/badge/build-000354-orange.svg" alt="Current version">
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
*	- [X] BUG: HC isn't working anymore, AGAIN. Sometimes it works, sometimes it gives a DAC WP generation failure. IT'S A MYSTERY!
*	- [X] """FIXED""" this feature for the 348327428995th time.
*	- [X] JIP BUG: Groups and units aren't loaded correctly upon joining.
*	- [X] JIP BUG: Respawn plugin not working for JIPs.
*	- [X] JIP BUG: If you JIP as a certain group, you will not get your correct loadout.
*	- [X] BUG: Parameters orders are inverted, my fault.
*	- [X] BUG: If two units join the same automatically named group, they will be called *.
*	- [?] BUG: JIPs won't be able to fire even after the lock has been lifted.
*	- [X] Platoon Roster main group names isn't working for the server(?)/singleplayer(?)
*	- [X] BUG: Optional objectives aren't completed: they must be CANCELED, only obligatory are FAILED.
*	- [X] Commander lock needs to be finished to account for TVT.
*	- [X] Add a general plugins settings file.
*	- [X] Fix the ending screen.
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
*	- [X] Work all current loadouts to have proper variables: Loadouts still need Crewmen, Snipers and Pilots and maybe other things.
*	- [X] There are a bunch of new pre-set units, maybe add them DAC default units with vehicles included.
*	- [X] Fix the view distance script with a version without the missing font.
*	- [X] Make an intro file with several different intros.
*	- [X] Plugins declare their post/preinits as scriptNames, based off their config names.
*	- [X] BUG: Framework is now hanging on Dedicated because of something, might be the Commander Lock, I dunno.
*	- [X] Final improvements to DAC so that works with camps, difficulty settings and other factions.
*	- [X] Easy way for players to execute custom scripts.
*	- [X] Ask Knite to make DAC configs for units based on difficulty.
*	- [X] Decide on a good squad structure.
*	- [X] Add all new classes to the existing loadouts.
*	- [X] Add default pre-placed units.
*	- [X] Add all the proper endings.
*	- [X] Fix the way endings work.
*	- [X] Add a counter for player kills, with side MVPs and personal kills.
*	- [X] Finish the ending screen.
*	- [X] Scoring is not working 100%.
*	- [X] Fix HC enabled messages.
*	- [X] Improve the ending screen.
*	- [X] Mission details like mission maker and name.
*	- [X] Simpler way of making zones.
*	- [X] Fix OPFOR/IND callsigns.
*	- [X] Configure vehicles with loadouts
*	- [X] Make a list of names and surnames divided by background and assign them to the units.
*	- [ ] Work on a new framework logo.
*	- [ ] Design a list of things every mission needs.
*	- [ ] Comment and document everything.

NEED HELP TO TEST:

*	- [ ] Test casualty cap for TvTs.
*	- [ ] Test Team Kill messages.
*	- [ ] Test if percentage verbose is working is intended.
*	- [ ] Test JIP score.
*	- [X] Nothing for now.

### What then?

I am very commited to document and explain the usability process of this framework so that even the most clueless user can pick it up and get cracking in a few hours at most - expect a wiki with all the API and functions, and definitely video tutorials since I'm a video learner myself.
