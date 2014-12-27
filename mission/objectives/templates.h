
#define END_MISSION(reason) \
	([reason] call BRM_fnc_callEnding)

#define AREA_CLEARED(markerName, clearSide, minumum) \
	([markerName, clearSide, minumum] call gl_fnc_areaClear)

#define AREA_OCCUPIED(markerName, occupySide, minumum) \
	([markerName, occupySide, minumum] call gl_fnc_areaOccupied)

#define CASUALTIES_SUSTAINED(checkSide, limit) \
	([checkSide, limit] call gl_fnc_checkCasualties)

#define OBJECT_DESTROYED(object) \
	((isNull object) || {!(alive object)})

#define OBJECT_IN_AREA(object, markerName) \
	([object, markerName] call cba_fnc_inArea)

#define TRIGGER_ACTIVATED(trigger) \
	(triggerActivated _trigger)
	
#define TASKS_STATE(tasks) \
	([tasks] call brm_fnc_tasksState)
