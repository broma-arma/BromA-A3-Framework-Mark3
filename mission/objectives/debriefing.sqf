
// ============================================================================
//                                                                             |
//           Include all endings related to your mission here.                 |
//                                                                             |
// ============================================================================

#define GROUPLOGO "mission\images\group-logo.paa"
#define CREDITS "Thank you for playing.<br/><br/>Made with the BromA Framework A3."

class victory 
{
    title = "MISSION OVER";
    subtitle = "All objectives accomplished - good job.";
    description = CREDITS;
    picture = GROUPLOGO;
};

class defeat
{
    title = "MISSION FAILED";
    subtitle = "You have failed your objectives.";
    description = CREDITS;
    picture = GROUPLOGO;
};

class tvt_end
{
    title = "MISSION OVER";
    subtitle = "A team is no longer combat effective.";
    description = CREDITS;
    picture = GROUPLOGO;
};

class custom
{
    title = "MISSION OVER";
    subtitle = "TEST";
    description = CREDITS;
    picture = GROUPLOGO;
};