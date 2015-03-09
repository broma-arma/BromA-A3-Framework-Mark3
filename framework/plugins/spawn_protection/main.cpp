class spawn_protection
{
	name = "Spawn protection";
	version = 1;
	authors[] = {"Br.","Nife"};	
	description = "Creates a protection zone around the insertion point, which can last forever or as long as the mission paramters determine, ensuring neither players or friendly vehicles can take damage while within.";
	conditions[] = {"mission_settings","mission_params_read"};
	postinit = "postinit.sqf";
	user = "client";
};