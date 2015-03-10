class team_roster
{
	name = "Team Roster";
	version = 1;
	authors[] = {"Nife"};
	description = "Creates a handy list of all friendly units separated by group name and position.";
	conditions[] = {"mission_groups_init"};
	postinit = "postinit.sqf";
	user = "all";
};