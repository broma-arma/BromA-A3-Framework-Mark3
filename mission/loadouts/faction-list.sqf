switch (toUpper(_faction)) do {
    
    case "RACS": { 
        #include "factions\racs.sqf" 
    };
    
    case "SLA": { 
        #include "factions\sla.sqf" 
    };
    
    case "MUJAHIDEEN": { 
        #include "factions\mujahideen.sqf" 
    };
    
    case "ANA": { 
        #include "factions\ana.sqf" 
    };
    
    case "AHKMA-PMC": { 
        #include "factions\ahkma-pmc.sqf" 
    };
    
    case "SPRG": {
        #include "factions\sprg-report.sqf" 
    };

    case "DEFAULT": { 
        #include "factions\template.sqf" 
    };
    
    default { 
        #include "factions\template.sqf" 
    };
};