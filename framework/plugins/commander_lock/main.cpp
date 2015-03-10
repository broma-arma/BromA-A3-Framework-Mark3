class commander_lock
{
	name = "Commander Lock";
	version = 1;
	authors[] = {"Nife"};
	description = "Forbids players from firing weapons or entering vehicles until the mission Commander gives the all-clear. Compatible with TvT with up to three sides, where all COs need to be ready in order for the mission to begin.";
	conditions[] = {"mission_params_read"};
	postinit = "postinit.sqf";
	user = "all";
};