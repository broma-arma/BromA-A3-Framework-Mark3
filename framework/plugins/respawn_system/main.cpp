class respawn_system
{
	name = "Respawn System";
	version = 1;
	authors[] = {"Nife"};
	description = "Manages and keeps track of players lives, ensuring they can respawn for only a finite amount of times, and making sure that once these lives run out they stay dead even upon attempts to reconnect.";
	conditions[] = {};
	preinit = "preinit.sqf";
	user = "all";
};