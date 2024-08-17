// Framework ending config, see https://github.com/broma-arma/BromA-A3-Framework-Mark3/wiki/Ending-System

// Reason
//   %1 - Winners
//   %2 - Losers
//   %3 - Win margin

class victory { // Ending for when the players win a coop mission
	title = "Mission completed!";
	reason = "%1 have completed all their objectives!";
	winningSides[] = {"a"};
	losingSides[] = {"b", "c"};
};

class defeat { // Ending for when the players lose a coop mission
	title = "Mission failed.";
	reason = "%2 failed the mission.";
	winningSides[] = {"b", "c"};
	losingSides[] = {"a"};
};

class tvt_end { // Generic tvt ending, automatically decides the winner based on deaths
	title = "A team has been defeated.";
	reason = "%1 achieved %3 victory over %2.";
	winningSides[] = {};
	losingSides[] = {};
};

class side_a_victory { // Side A TvT Victory
	title = "Mission over.";
	reason = "%1 won the mission and defeated %2.";
	winningSides[] = {"a"};
	losingSides[] = {"b", "c"};
};

class side_b_victory: side_a_victory { // Side B TvT Victory
	winningSides[] = {"b"};
	losingSides[] = {"a", "c"};
};

class side_c_victory: side_a_victory { // Side C TvT Victory
	winningSides[] = {"c"};
	losingSides[] = {"a", "b"};
};

class side_a_defeat: side_a_victory { // Side A TvT Defeat
	reason = "%2 failed their objectives.";
	winningSides[] = {"b", "c"};
	losingSides[] = {"a"};
};

class side_b_defeat: side_a_defeat { // Side B TvT Defeat
	winningSides[] = {"a", "c"};
	losingSides[] = {"b"};
};

class side_c_defeat: side_a_defeat { // Side C TvT Defeat
	winningSides[] = {"a", "b"};
	losingSides[] = {"c"};
};
