# BromA Framework 3 Mark 3

The document below is just for myself and to keep me organized, it's a bit confusing so don't take it as is.

## 1. WHY
The purpose of this rewrite of the framework is to bring it to the same standards other frameworks are on, taking advantage of ArmA 3 and new scripts made for it. Also a huge reason is to make it follow a modular and scalable format, where users can write their own plugins which other users can use.

## 2. HOW
By abstracting separate scripts into separate folders and functions into an API which are all pre-compiled, removing or adding functionalities to the framework becomes very easy.

## 3. FEATURES
	- [x] Loading screen
	- [x] Cover AO Map (plugin)
	- [ ] Assigns loadouts to areas (API)
	- [ ] Player lives (parameter engine)
	- [x] Team kill (plugin)
	- [x] Create markers (API)
	- [ ] Unit garrison (API)
	- [ ] Zeus functions (API)
	- [ ] AI can hear TFAR/ACRE (plugin)
	- [ ] Teleport JIPs (plugin)
	- [ ] Debug values (core)
	- [x] Remove all units' items (API)
	- [x] Platoon roster (plugin)
	- [ ] Syncronize weather with server and clients (core)
	- [ ] Spectator script (plugin)
	- [ ] Added spectators (plugin)
	
4. NEEDS TO BE REWRITTEN
-
	- [ ] Make players register their IDs in the server and keep a tab
	- [ ] Abstract all plugins using defines and postinits
	- [ ] Make objectives happen not in the editor as triggers, but rather as spawned checks for the objective
	
	- [ ] API will be loaded using cfgFunctions, plugins will be used with a custom class for better metadata support
	- [ ] Smaller network footprint, leave some variable declarations that are client-side up to the client
	
5. CHANGELOG
-
	- [x] Think of a task management system
	- [x] Loadouts are important
		- [ ] Work a system for containers/vehicles, should be easy
	- [x] Think of a folder structure
	- [ ] Smarter way of assigning parameters
	- [x] Introduce endings
	- [x] Fix the way tasks work
	
	- [ ] Finish the AGM plugin, hook it to parameters
	- [x] Start working on the DAC plugin
		- [ ] Make native functions and abstract settings into a separate file
		- [ ] Parameters as well
		- [ ] IMPORTANT: functions to create zones using only reference markers
