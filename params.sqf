    
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
    
    #define BRM_PARAMS_TIME
        #include "framework\plugins\plugins.cpp"
    #undef BRM_PARAMS_TIME

    class bar06 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };

    //======================================================================
    class bar_player {

    title = "PLAYER SETTINGS =======================";

    values[] = {0}; texts[] = {""}; default = 0; };
    //======================================================================

    class bar07 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };

    #define BRM_PARAMS_PLAYER
        #include "framework\plugins\plugins.cpp"
    #undef BRM_PARAMS_PLAYER

    class bar08 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };

    //======================================================================
    class bar_ai {

    title = "AI SETTINGS ========================";

    values[] = {0}; texts[] = {""}; default = 0; };
    //======================================================================

    class bar09 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };
    
    #define BRM_PARAMS_AI
        #include "framework\plugins\plugins.cpp"
    #undef BRM_PARAMS_AI