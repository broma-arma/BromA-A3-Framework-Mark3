class p_allow_respawn {
	title = "Instant respawn";
	values[] = {        0,         1};
	texts[] = {"Disabled", "Enabled"};
	default = 0;
};

class p_player_lives {
	title = "Instant respawn lives";
	values[] = { 1,   3,   5,   10};
	texts[] = {"1", "3", "5", "10"};
	default = 3;
};

class p_respawn_objective {
	title = "Respawns per completed objective";
	values[] = { 0,   3,   5,   10,         -1};
	texts[] = {"0", "3", "5", "10", "Everyone"};
	default = -1;
};
