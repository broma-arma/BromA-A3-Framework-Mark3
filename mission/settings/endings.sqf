private ["_winningSides", "_losingSides", "_title", "_reason", "_showStats", "_endNumber"];

switch (_this select 0) do {
	case "victory": { // ENDING FOR WHEN THE PLAYERS WIN A COOP MISSION
		_winningSides = [side_a_side];
		_losingSides = [side_b_side, side_c_side];
		_showStats = true;
		_title = "Mission completed!";
		_reason = "%1 have completed all their objectives!";
		_endNumber = 1;
	};

	case "defeat": { // ENDING FOR WHEN THE PLAYERS LOSE A COOP MISSION
		_winningSides = [side_b_side, side_c_side];
		_losingSides = [side_a_side];
		_showStats = true;
		_title = "Mission failed.";
		_reason = "%2 failed the mission.";
		_endNumber = 2;
	};

	case "tvt_end": { // GENERIC TVT ENDING, AUTOMATICALLY DECIDES THE WINNER BASED ON KILLS
		_winningSides = [];
		_losingSides = [];
		_showStats = true;
		_title = "A team has been defeated.";
		_reason = "%1 achieved %3 victory over %2.";
		_endNumber = 2;
	};

	case "side_a_victory": { // SIDE_A TVT VICTORY
		_winningSides = [side_a_side];
		_losingSides = [side_b_side, side_c_side];
		_showStats = true;
		_title = "Mission over.";
		_reason = "%1 won the mission and defeated %2.";
		_endNumber = 3;
	};

	case "side_b_victory": { // SIDE_B TVT VICTORY
		_winningSides = [side_b_side];
		_losingSides = [side_a_side, side_c_side];
		_showStats = true;
		_title = "Mission over.";
		_reason = "%1 won the mission and defeated %2.";
		_endNumber = 3;
	};

	case "side_c_victory": { // SIDE_C TVT VICTORY
		_winningSides = [side_c_side];
		_losingSides = [side_b_side, side_a_side];
		_showStats = true;
		_title = "Mission over.";
		_reason = "%1 won the mission and defeated %2.";
		_endNumber = 3;
	};

	case "side_a_defeat": { // SIDE_A TVT DEFEAT
		_winningSides = [side_b_side, side_c_side];
		_losingSides = [side_a_side];
		_showStats = true;
		_title = "Mission over.";
		_reason = "%2 failed their objectives.";
		_endNumber = 3;
	};

	case "side_b_defeat": { // SIDE_B TVT DEFEAT
		_winningSides = [side_a_side, side_c_side];
		_losingSides = [side_b_side];
		_showStats = true;
		_title = "Mission over.";
		_reason = "%2 failed their objectives.";
		_endNumber = 3;
	};

	case "side_c_defeat": { // SIDE_C TVT DEFEAT
		_winningSides = [side_b_side, side_a_side];
		_losingSides = [side_c_side];
		_showStats = true;
		_title = "Mission over.";
		_reason = "%2 failed their objectives.";
		_endNumber = 3;
	};

	case "custom": { // CUSTOM ENDING
		_winningSides = [side_a_side, side_b_side, side_c_side];
		_losingSides = [side_a_side, side_b_side, side_c_side];
		_showStats = true;
		_title = "The mission is over, maybe?";
		_reason = "%1 defeated %2.";
		_endNumber = 1;
	};
};

if !(mission_enable_side_c) then {
	_winningSides = _winningSides - [side_c_side];
	_losingSides = _losingSides - [side_c_side];
};
mission_ending_details = [_winningSides, _losingSides, _showStats, _title, _reason, _endNumber];
publicVariable "mission_ending_details";
