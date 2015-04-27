    
    //=========================================================================
    class bar01 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };
    //========================================================================= 
    
    class bar_missionmods {
 
    title = "CORE MODIFICATIONS ====================";

    values[] = {0}; texts[] = {""}; default = 0; };
    
    //=========================================================================
    class bar02 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };
    //=========================================================================
    
    class p_gameplay_mod
    {
        title = "Gameplay";
        values[] = {0,1,2};
        texts[] = {"Vanilla","AGM","ACE3"};
        default = 1;
        code = "param_gameplay_mod = %1";
    };
    
    class p_radio_mod
    {
        title = "Radio system";
        values[] = {0,1,2};
        texts[] = {"Vanilla","TFAR","ACRE2"};
        default = 1;
        code = "param_radio_mod = %1";
    };    
    
    //=========================================================================
    class bar03 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };
    //=========================================================================
    
    class bar_dateweather {
 
    title = "DATE AND WEATHER ======================";

    values[] = {0}; texts[] = {""}; default = 0; };
    
    //=========================================================================
    class bar04 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };
    //=========================================================================

    class p_time_of_day
    {
        title = "Time";
        values[] = {0,1,2,3,4,5,6,7,8};
        texts[] = {"Dawn","Early morning","Morning","Noon","Afternoon","Evening","Dusk","Night","Random"};
        default = 1;
        code = "param_time_of_day = %1";
    };
    
    class p_weather
    {
        title = "Weather";
        values[] = {0,1,2,3,4,5,6,7,8,9,10,11};
        texts[] = {"Clear (Calm)","Clear (Light Winds)","Clear (Strong Winds)","Overcast (Calm)","Overcast (Light Winds)","Overcast (Strong Winds)","Rain (Light Winds)","Rain (Strong Winds)","Storm","Light Fog","Heavy Fog","Random"};
        default = 1;
        code = "param_weather = %1";
    };

    //=========================================================================
    class bar05 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };
    //=========================================================================
    
    class bar_time {

    title = "TIME AND MISSION CONSTRAINTS =======================";

    values[] = {0}; texts[] = {""}; default = 0; };
    
    //=========================================================================
    class bar06 { title = ""; values[] = {0}; texts[] = {""}; default = 0; };
    //=========================================================================
    
// ============================================================================
//   Includes Plugin parameters pertaining to Time and Constraints.            |
// ============================================================================    
    #define BRM_PARAMS_TIME
        #include "framework\plugins\plugins.cpp"
    #undef BRM_PARAMS_TIME

    //=========================================================================
    class bar07 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };
    //=========================================================================
    class bar_player {

    title = "PLAYER SETTINGS =======================";

    values[] = {0}; texts[] = {""}; default = 0; };
    //=========================================================================
    class bar08 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };
    //=========================================================================

// ============================================================================
//   Includes Plugin parameters pertaining to Players.                         |
// ============================================================================
    #define BRM_PARAMS_PLAYER
        #include "framework\plugins\plugins.cpp"
    #undef BRM_PARAMS_PLAYER

    //=========================================================================
    class bar09 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };
    //=========================================================================
    class bar_ai {

    title = "AI SETTINGS ========================";

    values[] = {0}; texts[] = {""}; default = 0; };
    //=========================================================================
    class bar10 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };
    //=========================================================================
  
// ============================================================================
//   Includes Plugin parameters pertaining to AI.                              |
// ============================================================================
    #define BRM_PARAMS_AI
        #include "framework\plugins\plugins.cpp"
    #undef BRM_PARAMS_AI
    
// ============================================================================

    //=========================================================================
    class bar11 {title = ""; values[] = {0}; texts[] = {""}; default = 0; };
    //=========================================================================