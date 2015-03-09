    
    class bar01 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };

    //======================================================================
    class bar_hc {
    
    title = "HEADLESS CLIENT ======================";

    values[] = {0}; texts[] = {""}; default = 0; };
    //======================================================================
    
    class bar001 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };
    
    class p_enable_hc
    {
        title = "Enable Headless Client";
        values[] = {0,1};
        texts[] = {"Disabled","Enabled"};
        default = 0;
        code = "param_hc_enabled = %1";
    };    

    class bar02 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };

    //======================================================================
    class bar_dateweather {
    
    title = "DATE AND WEATHER ======================";

    values[] = {0}; texts[] = {""}; default = 0; };
    //======================================================================

    class bar03 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };

    class p_time_of_day
    {
        title = "Time";
        values[] = {0,1,2,3,4,5,6,7,8};
        texts[] = {"Dawn","Early morning","Morning","Noon","Afternoon","Evening","Dusk","Night","Random"};
        default = 4;
        code = "param_time_of_day = %1";
    };
    
    class p_weather
    {
        title = "Weather";
        values[] = {0,1,2,3,4,5,6,7,8,9,10,11};
        texts[] = {"Clear (Calm)","Clear (Light Winds)","Clear (Strong Winds)","Overcast (Calm)","Overcast (Light Winds)","Overcast (Strong Winds)","Rain (Light Winds)","Rain (Strong Winds)","Storm","Light Fog","Heavy Fog","Random"};
        default = 0;
        code = "param_weather = %1";
    };

    class bar04 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };

    //======================================================================
    class bar_time {

    title = "TIME AND MISSION CONSTRAINTS =======================";

    values[] = {0}; texts[] = {""}; default = 0; };
    //======================================================================        

    class bar05 { title = ""; values[] = {0}; texts[] = {""}; default = 0; };

    class p_time_limit
    {
        title = "Time Limit";
        values[] = {0,1,2,3,4,5,6,7,8};
        texts[] = {"No limit","3 hours","2 hours","1 hour","45 minutes", "30 minutes", "15 minutes", "10 minutes", "1 minute"};
        default = 0;
        code = "param_time_limit = %1";
    };
    
    class p_time_accel
    {
        title = "Time acceleration";
        values[] = {0,1,2,3,4};
        texts[] = {"1x","2x","5x","10x","100x"};
        default = 0;
        code = "param_time_accel = %1";
    };    
    
    class p_setup_time
    {
        title = "Setup Time";
        values[] = {0,1,2,3,4};
        texts[] = {"15 seconds","1 minute","3 minutes","5 minutes","10 minutes"};
        default = 0;
        code = "param_setup_time = %1";
    };
    
    class p_spawn_protection_time
    {
        title = "Spawn protection duration";
        values[] = {0,1,2,3,4};
        texts[] = {"Disabled", "1 minute", "15 minutes", "30 minutes", "Infinite"};
        default = 4;
        code = "param_spawn_protection_time = %1";
    };
    
    class p_dead_civies
    {
        title = "Tolerance with civilian deaths";
        values[] = {0,1,2,3};
        texts[] = {"Disabled","Low","Medium","High"};
        default = 0;
        code = "param_dead_civies = %1";
    };     

    class bar06 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };

    //======================================================================
    class bar_player {

    title = "PLAYER SETTINGS =======================";

    values[] = {0}; texts[] = {""}; default = 0; };
    //======================================================================

    class bar07 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };
       
    class p_cas_cap
    {
        title = "Casualty Cap";
        values[] = {0,1,2,3};
        texts[] = {"80%","90%","95%","100%"};
        default = 3;
        code = "param_cas_cap = %1";
    };
    
    class p_revive_time
    {
        title = "Bleedout time (seconds)";
        values[] = {0,1,2,3};
        texts[] = {"10","120","300","600"};
        default = 2;
        code = "param_revive_time = %1";
    };    
    
    class p_player_lives
    {
        title = "Player lives";
        values[] = {0,1,2,3};
        texts[] = {"1","3","5","10"};
        default = 1;
        code = "param_player_lives = %1";
    };
    
    class p_allow_respawn
    {
        title = "Allow respawning";
        values[] = {0,1};
        texts[] = {"Disabled", "Enabled"};
        default = 0;
        code = "param_allow_respawn = %1";
    };     

    class p_allow_tp_veh
    {
        title = "Third person enabled";
        values[] = {0,1,2};
        texts[] = {"Disabled","Enabled","Drivers/Commanders only"};
        default = 2;
        code = "param_allow_tp_veh = %1";
    };         

    class bar08 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };

    //======================================================================
    class bar_ai {

    title = "AI SETTINGS ========================";

    values[] = {0}; texts[] = {""}; default = 0; };
    //======================================================================

    class bar09 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };

    class p_ai_level
    {
        title = "DAC AI Skill";
        values[] = {0,1,2,3,4};
        texts[] = {"Disabled","Very Low","Low","Medium","High"};
        default = 4;
        code = "param_dac_ai_level = %1";
    };