
class p_allow_respawn
{
	title = "Allow respawning";
	values[] = {0,1};
	texts[] = {"Disabled", "Enabled"};
	default = 0;
	code = "param_allow_respawn = %1";
};

class p_player_lives
{
	title = "Player lives";
	values[] = {0,1,2,3};
	texts[] = {"1","3","5","10"};
	default = 1;
	code = "param_player_lives = %1";
};

class p_respawn_objective
{
	title = "Respawns per completed objective";
	values[] = {0,1,2,3,4};
	texts[] = {"0","3","5","10", "Everyone"};
	default = 2;
	code = "param_respawn_objective = %1";
};