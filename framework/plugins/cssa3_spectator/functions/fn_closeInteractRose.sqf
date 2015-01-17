/*
	Author: Cyrokrypto

	Description:
	Closes the interact rose when called.

	Parameter(s):
	None

	Returns:
	NOTHING
*/


#define CSSA3_mouseAreaIDC				7910
#define CSSA3_interactMenuGroupIDC		7915

private ["_display"];

disableserialization;
if !(isNil {CSSA3_fnc_DrawLine3D}) then {
	removemissioneventhandler ["draw3d",CSSA3_fnc_DrawLine3D];
	CSSA3_fnc_DrawLine3D = nil;
};

_display = uiNameSpace getVariable 'CSSA3_mainHUD';

//---Make interact rose invisible.
(_display displayCtrl CSSA3_interactMenuGroupIDC) ctrlShow false;

//---Set focus back to mouse area.
ctrlSetFocus (_display displayCtrl CSSA3_mouseAreaIDC);