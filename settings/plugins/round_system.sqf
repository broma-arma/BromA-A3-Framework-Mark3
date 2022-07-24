// https://github.com/broma-arma/BromA-A3-Framework-Mark3/wiki/Plugins#round-system

#ifdef PARAMS
//#define ROUNDS 3
//#define TIME 15
#else
[
	10, // area
	10, // prep
	15, // cooldown
	[1, 5, 15, 30], // alert
	"SCORE", // winner
	"NOTIFICATION", // notification
	true, // score
	[ // condition
		{ BRM_RoundSystem_conditionA }, // A
		{ BRM_RoundSystem_conditionB }, // B
		{ BRM_RoundSystem_conditionC } // C
	],
	"The round has ended in a draw!", // draw
	[ // win
		"%1 have won the round!", // A
		"%1 have won the round!", // B
		"%1 have won the round!" // C
	]
]
#endif
