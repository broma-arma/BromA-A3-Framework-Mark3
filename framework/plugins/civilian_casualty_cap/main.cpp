class civilian_casualty_cap
{
	name = "Civilian casualty cap";
	version = 1;
	authors[] = {"Nife"};
	description = "Punishes players for killing a parameter determined amount of civilians, compatible with both COOP and TvTs.";
	conditions[] = {"mission_settings","mission_params_read"};
	postinit = "postinit.sqf";
	user = "server";
};