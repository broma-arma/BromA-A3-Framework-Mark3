// Debriefing config, see https://community.bistudio.com/wiki/Arma_3:_Debriefing#Debriefing

class victory {
	title = "MISSION OVER";
	subtitle = "All objectives accomplished - good job.";
	description = "Thank you for playing.<br/><br/>Made with the BromA Framework MK 4.";
	picture = "\broma_framework\assets\images\group-logo.paa";
};

class defeat: victory {
	title = "MISSION FAILED";
	subtitle = "You have failed your objectives.";
};

class tvt_end: victory {
	subtitle = "A team is no longer combat effective.";
};
