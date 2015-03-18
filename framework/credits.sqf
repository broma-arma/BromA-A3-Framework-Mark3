
// ============================================================================
//  These are the default credits to everyone who contributed in order to make |
//                        this framework complete.                             |
//                                                                             |
//        I sincerely urge you not to remove this from your mission.           |
//                                                                             |
//              And most importantly, don't forget to add your name            |
//                        and mission version below!                           |
// ============================================================================

mission_author_name = [mission_author_name] call BRM_fnc_verboseArray;

player createDiaryRecord ["Diary", ["Credits","
current mission " + mission_author_name + " made by " + mission_version + ".
<br/>
<br/>
<img image='framework\engine\assets\images\framework-logo.paa' width='512' height='128'/><br/>
Made possible using the BromA Framework, assembled by the BromA Mission Making Team @ http://bro.ma.
- all credits given to their respective creators."]];