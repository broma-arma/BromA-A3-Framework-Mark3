/*
	Author: Cyrokrypto

	Description:
	- Finds Object assigned to currently selected Listbox index. (lbData)

	Parameter(s):
	None

	Returns:
	NOTHING
*/

{
	if ((lbData [79124, lbCurSel 79124]) == (str _x)) exitWith {
		CSSA3_spectatedUnit = _x;
		[objNull] spawn CSSA3_fnc_changeView;
	};
} count CSSA3_spectatableUnits;