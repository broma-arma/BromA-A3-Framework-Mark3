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
    
    case "CHEDAKI": {
        #include "factions\chedaki.sqf"
    };
    
    case "MARINESWDL": {
        #include "factions\marinewdl.sqf"
    };    
    
    case "IONPMC": {
        #include "factions\ionpmc.sqf"
    };    
    
    case "TKMILITIA": {
        #include "factions\tkmilitia.sqf"
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