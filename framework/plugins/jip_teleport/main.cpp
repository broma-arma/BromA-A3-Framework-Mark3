class jip_teleport
{
	name = "JIP teleport";
	version = 1;
	authors[] = {"columdrum","Nife"};
	description = "Teleports JIPs to their nearest living team-member.";
	conditions[] = {"(mission_game_mode == 'coop')", "(player_is_jip)", "(time > 1)"};
	postinit = "postinit.sqf";
	user = "client";
};