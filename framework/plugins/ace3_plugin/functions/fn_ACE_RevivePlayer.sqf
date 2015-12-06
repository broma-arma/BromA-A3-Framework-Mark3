/*
================================================================================

NAME:
   BRM_ACE3_fnc_ACE_RevivePlayer
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Revives a unit's ACE parameters.
    
PARAMETERS:
    0 - Player (OBJECT)

USAGE:
    [player] spawn BRM_ACE3_fnc_ACE_RevivePlayer;
    
RETURNS:
    Nothing.

================================================================================
*/

_unit = _this select 0;



_unit switchMove "";
_unit setVariable ["ACE_medical_pain", 0, true];
_unit setVariable ["ACE_medical_morphine", 0, true];
_unit setVariable ["ACE_medical_bloodVolume", 100, true];
_unit setVariable ["ACE_medical_tourniquets", [0,0,0,0,0,0], true];
_unit setVariable ["ACE_medical_openWounds", [], true];
_unit setVariable ["ACE_medical_bandagedWounds", [], true];
_unit setVariable ["ACE_medical_internalWounds", [], true];
_unit setVariable ["ACE_medical_lastUniqueWoundID", 1, true];
_unit setVariable ["ACE_medical_heartRate", 80];
_unit setVariable ["ACE_medical_heartRateAdjustments", []];
_unit setVariable ["ACE_medical_bloodPressure", [80, 120]];
_unit setVariable ["ACE_medical_peripheralResistance", 100];
_unit setVariable ["ACE_medical_fractures", [], true];
_unit setVariable ["ACE_medical_triageLevel", 0, true];
_unit setVariable ["ACE_medical_triageCard", [], true];
_unit setVariable ["ACE_medical_salineIVVolume", 0, true];
_unit setVariable ["ACE_medical_plasmaIVVolume", 0, true];
_unit setVariable ["ACE_medical_bloodIVVolume", 0, true];
_unit setVariable ["ACE_medical_bodyPartStatus", [0,0,0,0,0,0], true];
_unit setVariable ["ACE_medical_airwayStatus", 100];
_unit setVariable ["ACE_medical_airwayOccluded", false];
_unit setVariable ["ACE_medical_airwayCollapsed", false];
_unit setVariable ["ACE_medical_addedToUnitLoop", false, true];
_unit setVariable ["ACE_medical_inCardiacArrest", false, true];
_unit setVariable ["ACE_isUnconscious", false, true];
_unit setVariable ["ACE_medical_hasLostBlood", 0, true];
_unit setVariable ["ACE_medical_isBleeding", false, true];
_unit setVariable ["ACE_medical_hasPain", false, true];
_unit setVariable ["ACE_medical_painSuppress", 0, true];
_parts = ["hitHead","hitBody","hitHands","hitLegs"];
{_unit setHitPointDamage [_x, 0]}count _parts;
