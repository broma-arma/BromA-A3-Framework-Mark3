class p_player_lives
{
	title = "Player lives";
	values[] = {0,1,2,3};
	texts[] = {"1","3","5","10"};
	default = 1;
	code = "param_player_lives = %1";
};

class p_allow_respawn
{
	title = "Allow respawning";
	values[] = {0,1};
	texts[] = {"Disabled", "Enabled"};
	default = 0;
	code = "param_allow_respawn = %1";
};