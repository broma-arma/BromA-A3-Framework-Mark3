class time_limit
{
	name = "Time limit";
	version = 1;
	authors[] = {"Nife"};
	description = "Ends the mission after a parameter set amount of time has passed, and based on mission settings alerts the player on relevant times to the mission maker.";
	conditions[] = {"mission_settings","mission_params_read"};
	postinit = "postinit.sqf";
	user = "server";
};