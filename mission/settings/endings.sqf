// https://github.com/broma-arma/BromA-A3-Framework-Mark3/wiki/Ending-System

private ["_winningSides", "_losingSides", "_showStats", "_title", "_reason", "_endNumber"];

switch (_this select 0) do {
	case "victory": { // Win in a COOP mission.
		_winningSides = [side_a_side];
		_losingSides = [side_b_side, side_c_side];
		_showStats = true;
		_title = "Mission completed!";
		_reason = "%1 have completed all their objectives!";
		_endNumber = 1;
	};

	case "defeat": { // Lose in a COOP mission.
		_winningSides = [side_b_side, side_c_side];
		_losingSides = [side_a_side];
		_showStats = true;
		_title = "Mission failed.";
		_reason = "%2 failed the mission.";
		_endNumber = 2;
	};

	case "tvt_end": { // Generic win/lose in a TVT mission. Winner is determined from the amount of kills.
		_winningSides = [];
		_losingSides = [];
		_showStats = true;
		_title = "A team has been defeated.";
		_reason = "%1 achieved %3 victory over %2.";
		_endNumber = 2;
	};

	case "side_a_victory": { // SIDE_A win in a TVT mission.
		_winningSides = [side_a_side];
		_losingSides = [side_b_side, side_c_side];
		_showStats = true;
		_title = "Mission over.";
		_reason = "%1 won the mission and defeated %2.";
		_endNumber = 3;
	};

	case "side_b_victory": { // SIDE_B win in a TVT mission.
		_winningSides = [side_b_side];
		_losingSides = [side_a_side, side_c_side];
		_showStats = true;
		_title = "Mission over.";
		_reason = "%1 won the mission and defeated %2.";
		_endNumber = 3;
	};

	case "side_c_victory": { // SIDE_C win in a TVT mission.
		_winningSides = [side_c_side];
		_losingSides = [side_b_side, side_a_side];
		_showStats = true;
		_title = "Mission over.";
		_reason = "%1 won the mission and defeated %2.";
		_endNumber = 3;
	};

	case "side_a_defeat": { // SIDE_A lose in a TVT mission.
		_winningSides = [side_b_side, side_c_side];
		_losingSides = [side_a_side];
		_showStats = true;
		_title = "Mission over.";
		_reason = "%2 failed their objectives.";
		_endNumber = 3;
	};

	case "side_b_defeat": { // SIDE_B lose in a TVT mission.
		_winningSides = [side_a_side, side_c_side];
		_losingSides = [side_b_side];
		_showStats = true;
		_title = "Mission over.";
		_reason = "%2 failed their objectives.";
		_endNumber = 3;
	};

	case "side_c_defeat": { // SIDE_C lose in a TVT mission.
		_winningSides = [side_b_side, side_a_side];
		_losingSides = [side_c_side];
		_showStats = true;
		_title = "Mission over.";
		_reason = "%2 failed their objectives.";
		_endNumber = 3;
	};

	case "custom": { // Custom ending in a TVT mission.
		_winningSides = [side_a_side, side_b_side, side_c_side];
		_losingSides = [side_a_side, side_b_side, side_c_side];
		_showStats = true;
		_title = "The mission is over, maybe?";
		_reason = "%1 defeated %2.";
		_endNumber = 1;
	};
};
