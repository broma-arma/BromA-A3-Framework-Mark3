class time_accel
{
	name = "Time Acceleration";
	version = 1;
	authors[] = {"Nife"};
	description = "Creates a module that accelerates time as determined by mission paramters.";
	conditions[] = {"(time > 0.1)"};
	postinit = "postinit.sqf";
	user = "server";
};