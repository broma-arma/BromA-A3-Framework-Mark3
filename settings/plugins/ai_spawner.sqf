// https://github.com/broma-arma/BromA-A3-Framework-Mark3/wiki/Plugins#ai-spawner

#ifndef PARAMS
[
	true, // aiDeathSounds: enable ai death sounds
	true, // aiInfiniteAmmo: ai ammo will be reset after they reload
	[ // aiSettingsAllMap: settings to apply to editor placed units
		false, // caching
		true, // death sounds
		true, // infinite ammo
		true, // garbage collector
		true // debug markers
	],
	650, // cleanUpPlayerRadius: distance where after the spawner is deactive, will not delete units if players are near
	1500, // stalkMaximumDistance: maximum distance where stalking group will be deleted if no player are around
	[ // garbageCollector: dead bodies removel settings
		90, // time delete body no players around
		50, // distance to keep body with players nearby
		180 // maximum time to remove bodies (even if players are around)
	],
	[ // garbageCollectorVehicle: dead bodies removel settings
		120, // time delete wreck no players around
		100, // distance to keep wreck with players nearby
		210 // maximum time to remove wreck (even if players are around)
	],
	650, // infantryCacheDistance: General infantry caching distance
	1000, // vehicleCacheDistance: General vehicle caching distance

	[ // spawnerSettings: Spawner Settings
		/*
			1- ID
			2- Settings Array
				1- cleanup ai after spawner is deactivated,
				2- distance where units will not spawn to avoid spawning on top of players
				3- disable LAMBS
				4- disable suppresion, autocombat, make ai keep moving charge position
				5- caching
				6- caching radius 1-infantry 2-vehicles
				7- AI Skills setting
		*/
		["DEFAULT", [true, 150, false, false, true, [500, 1000], "REGULAR"]]
	],

	[ // waypointSettings: Waypoint Settings
		/*
			1- ID
			2- Settings Array
				1- Waypoint Radius
				2- Waypoint Search Radius (only for attack)
				3- Waypoint Behaviour
				4- Waypoint Combat Mode
				5- Waypoint formation
				6- Waypoint Speed
				7- Waypoint Code
				8- Waypoint Timeout [min,mid,max]
		*/
		["SAFE", [10, 150, "SAFE", "YELLOW", "FILE", "LIMITED", "", [0, 0, 0]]],
		["AWARE", [50, 150, "AWARE", "RED", "WEDGE", "FULL", "", [0, 0, 0]]]
	],

	[ // groupTypes: Group Types
		/*
			Group Types
			1- ID
			2- Classname of units or array to choose random (for infantry use vanilla units)

			WARNING! Use NATO classnames for west zones, CSAT classnames for east zones and AAF classnames for indenpendent zones;
			Just change the first letter for infantry -> O - Opfor, B- Blufor, I- Independent
		*/
		["Infantry Squad", ["O_Soldier_SL_F", "O_Soldier_F", "O_soldier_M_F", "O_Soldier_AR_F", "O_medic_F", "O_Soldier_LAT_F", "O_Soldier_TL_F", "O_Soldier_F"]],
		["Infantry Team", ["O_Soldier_TL_F", "O_Soldier_F", ["O_soldier_M_F", "O_Soldier_AR_F", "O_Soldier_LAT_F"], "O_Soldier_TL_F"]],
		["Cars", ["O_LSV_02_armed_F"]],
		["APCs", ["O_APC_Tracked_02_cannon_F"]],
		["Tanks", ["O_MBT_04_cannon_F"]],
		["Heli", ["O_Heli_Attack_02_dynamicLoadout_F"]],
		["Jet", ["O_Plane_CAS_02_dynamicLoadout_F"]]
	],

	[ // aiSkills: AI Skills
		["REGULAR", [
			["general",           1],
			["aimingAccuracy", 0.70],
			["aimingShake",    0.75],
			["aimingSpeed",       1],
			["endurance",         1],
			["spotDistance",   0.85],
			["spotTime",          1],
			["courage",           1],
			["reloadSpeed",       1],
			["commanding",        1]
		]]
	],

	[ // aiSpawners: AI Spawners
		// --- DEFENSE SPAWNER ---
		/*
		[
			"defense",                              // type
			"Defense Spawner",                      // id
			east,                                   // side
			"CSAT",                                 // loadout
			"DEFAULT",                              // spawner settings
			aiSpawner_defense_1,                    // trigger
			[                                       // Groups
				[
					"Infantry Team",                // Group Type
					2,                              // count
					"SAFE",                         // Waypoint Settings
					10                              // Waypoint Count
				],
				["Cars",2,"SAFE",5]
			],
			[                                       // camps
				[
					aiSpawner_defense_camp_1,       // position
					"Infantry Team",                // group type
					5,                              // spawn count
					5,                              // spawn delay
					200                             // distance to inactivate if players near
				]
			],
			[                                      // conditions, 1- start  2- end
				{(true)},
				{(false)}
			],
			[
				"",                                 // start event
				"",                                 // end event
				"",                                 // each wave event
				""                                  // waypoint on complete event
			]
		],
		*/
		// --- ATTACK SPAWNER ---
		/*
		[
			"attack",                               // type
			"Attack Spawner",                       // id
			east,                                   // side
			"CSAT",                                 // loadout
			"DEFAULT",                              // spawner settings
			aiSpawner_attack_1,                     // attack position
			[
				[
					"Tanks",                            // Group Type
					3,                                  // count
					"AWARE"                             // Waypoint Settings
				]
			],
			[
				[                                   // spawn positions
					"aiSpawner_attack_spawn_1",
					"aiSpawner_attack_spawn_2"
				],
				0,                                  // delay before start
				5                                   // delay each wave
			],
			[
				{(true)},                           // start condition
				{(false)}                           // end condition
			],
			[
				"",                                 // start event
				"",                                 // end event
				"",                                 // each wave event
				""                                  // waypoint on complete event
			]
		],
		*/
		// --- STALK SPAWNER ---
		/*
		[
			"stalk",                                // type
			"Stalk Spawner",                        // id
			east,                                   // side
			"CSAT",                                 // loadout
			"DEFAULT",                              // spawner settings
			aiSpawner_stalk_1,                     // attack position
			[
				[
					"Infantry Team",                            // Group Type
					1,                                  // count
					"AWARE"                             // Waypoint Settings
				]
			],
			[
				1000,                               // spawn radius around the target
				0,                                  // delay before start
				5                                   // delay each wave
			],
			[
				{(true)},                           // start condition
				{(false)}                           // end condition
			],
			[
				"",                                 // start event
				"",                                 // end event
				"",                                 // each wave event
				""                                  // waypoint on complete event
			]
		]
		*/
	]
]
#endif
