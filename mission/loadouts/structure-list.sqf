switch (_factionStructure) do {
	case "TEMPLATE": {
		#include "structures\template.sqf"
	};

	default { _frameworkStructure = true; };
};
