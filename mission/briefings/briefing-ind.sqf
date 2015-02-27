// =============================================================================
// Briefings go here!
// don't forget to add a "<br/"> every time you want to break a line down.
// =============================================================================

if (!_autoRadio) then {
    _radioFreqs = 
    "
    Alpha - ch.1<br/>
    Bravo - ch.2<br/>
    Charlie - ch.3<br/>
    Delta - ch.4<br/>
    Zero - ch.9<br/>
    ";
};

_radioText = format [ 
"
-------------------------------------------------------------- <br/>
=== <font color='#fad425'>SHORT RANGE</font color> ===<br/><br/>
<font color='#fad425'>Infantry:</font color><br/>
<br/>
%1
--------------------------------------------------------------<br/>
=== <font color='#fad425'>LONG RANGE</font color> ===<br/><br/>
<font color='#fad425'>Infantry:</font color><br/>
<br/>
Main command net: ch.1<br/>

", _radioFreqs];

player createDiaryRecord ["Diary",["

Radio information and Callsigns

",_radioText]];

// =============================================================================
player createDiaryRecord ["Diary",["

Enemy Forces
",
// =============================================================================
"

Here you describe to the players what sort of intelligence is available about the enemy.
Be sensitive enough  not to reveal too much or too little.

"]];
// =============================================================================

// =============================================================================
player createDiaryRecord ["Diary",["

Support
",
// =============================================================================
"

List all the support available for the mission:<br/><br/>
- x vehicles.<br/>
- x weapons team.<br/>
- x CAS support.<br/>
- x mortar support.<br/>

"]];
// =============================================================================

// =============================================================================
player createDiaryRecord ["Diary",["

Mission
",
// =============================================================================
"

Describe here what are the players supposed to accomplish in the mission,
with as much clarity and brevity as possible.<br/>
<br/>
In this case, <marker name='objmk'>we have to capture this place over here.</marker>

"]];
// =============================================================================

// =============================================================================
player createDiaryRecord ["Diary",["

Situation
",
// =============================================================================
"

What led to the current situation? Who is attacking who?<br/>
<br/>
This section is more related to the lore of the mission if anything, so get creative.

"]];
// =============================================================================