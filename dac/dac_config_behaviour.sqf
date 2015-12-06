

    //////////////////////////////
    //    Dynamic-AI-Creator    //
    //    Version 3.1b - 2014   //
    //--------------------------//
    //    DAC_Config_Behaviour  //
    //--------------------------//
    //    Script by Silola      //
    //    silola@freenet.de     //
    //////////////////////////////

    private ["_array","_setSkill","_setCombat","_setBehav","_setSpeed","_setForm","_setPatrol","_setSearch","_setFleeing","_setHeliVal","_setPause","_setBldgBeh","_setSupport","_setJoin","_setEmpVeh","_setSupTime","_setHidTime"];

    // =============================================================================
    // Default values you shouldn't worry about.

        _setFleeing = [0,200];
        _setHeliVal = [100,600,1,0];
        _setPause   = [[5,10],[5,10],[5,10],[20,30,5,5],[1,3],[0,0]];
        _setBldgBeh = [5,250,200,600,2];
        _setPatrol  = ["45 + (20 * (skill _leader))","(60 + (random 60)) + ((skill _leader) * 50)"];
        _setSearch  = ["40 + ((skill _leader) * 150)","50 + ((skill _leader) * 50)"];
        _setJoin    = 2;
        _setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,5];
        _setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];
        _setEmpVeh  = [[500,100],[550,100]];

    // =============================================================================

    switch (_this select 0) do
    {
    //-------------------------------------------------------------------------------------------------------------------------
        case 0: // ROOKIES
        {
            //_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
            _setSkill   = [   [0.2,0.2],      [0.2,0.2],    [0.2,0.2],    [0.2,0.2],   [0.2,0.2],  [0.2,0.2], [0.2,0.2],  [0.2,0.2],    [0.2,0.2], [0.2,0.2]];
            _setCombat  = ["green"];
            _setBehav   = ["careless","safe","aware"];
            _setSpeed   = ["limited","normal","full"];
            _setForm    = ["line"];
            _setSupport = [1,0]; //support for other zones
        };
    //-------------------------------------------------------------------------------------------------------------------------
        case 1: // NORMAL
        {
            //_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
            _setSkill   = [   [0.7,0.8],      [0.4,0.5],    [0.4,0.5],    [0.8,0.9],   [0.7,0.8],  [0.6,0.7], [0.8,0.9],  [0.2,0.4],   [0.8,0.9],  [0.7,0.8]];
            _setCombat  = ["green","white","yellow"];
            _setBehav   = ["careless","safe","aware"];
            _setSpeed   = ["limited","normal","full"];
            _setForm    = ["line","vee","column","wedge","stag column","ech left","ech right","file","diamond"];
            _setSupport = [1,0]; //support for other zones
        };
	//-------------------------------------------------------------------------------------------------------------------------
        case 2: // STEALTH, Groups cross open terrain primarily by crawling and with small bounding manoeuvres. In cities groups move as straight as possible to their
		        // waypoint avoiding roads and using every piece of cover available, peeking around corners, 360 cover, bounding manoeuvres. Not recommended for vehicles.

	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [   [0.2,0.3],      [0.3,0.4],    [0.3,0.4],    [0.6,0.8],   [0.3,0.5],  [0.2,0.3], [0.5,0.8],  [0.2,0.4],    [0.6,0.8], [0.4,0.6]];
		_setCombat  = ["red"];
		_setBehav   = ["stealth"];
		_setSpeed   = ["full"];
		_setForm    = ["line","vee","column","wedge","stag column","ech left","ech right","file","diamond"];
		_setPause   = [[2,5],[5,10],[5,10],[20,30,5,5],[1,3],[0,0]];
		_setBldgBeh = [0,1,10,600,2]; //? Disabled building garrisoning to speed up movement.
		_setSupport = [1,0];//support for other zones
		_setEmpVeh  = [[0,100],[150,100]]; //? Disabled empty vehicle usage since it doesnt make sense with the stealth motive.

	};
    //-------------------------------------------------------------------------------------------------------------------------
        case 3: // BASICALLY THE DEATH STAR IN TERMS OF LASERNESS
        {
            //_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
            _setSkill   = [   [0.7,0.8],      [0.7,0.8],    [0.7,0.8],    [0.7,0.8],    [0.5,0.6],   [0.5,0.6], [0.7,0.8], [0.7,0.8],    [0.7,0.8], [0.7,0.8]];
            _setCombat  = ["green","white","yellow"];
            _setBehav   = ["careless","safe","aware"];
            _setSpeed   = ["limited","normal","full"];
            _setForm    = ["line","vee","column","wedge","stag column","ech left","ech right","file","diamond"];
            _setSupport = [1,0]; //support for other zones
        };
    //-------------------------------------------------------------------------------------------------------------------------
            Default {
                                    if(DAC_Basic_Value != 5) then
                                    {
                                            DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value";
                                            hintc "Error: DAC_Config_Behaviour > No valid config number";
                                    };
                                    if(true) exitwith {};
                            };
    };

    _array =        [
                                    _setSkill,_setCombat,_setBehav,_setSpeed,_setForm,_setFleeing,
                                    _setHeliVal,_setPause,_setBldgBeh,_setPatrol,_setSearch,
                                    _setSupport,_setJoin,_setEmpVeh,_setSupTime,_setHidTime
                            ];
    _array

