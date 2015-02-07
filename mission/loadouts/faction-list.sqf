switch (toUpper(_faction)) do {
    
    case "RACS": { 
        #include "factions\racs.sqf" 
    };
    
    case "SLA": { 
        #include "factions\sla.sqf" 
    };
    
    case "JIHADISTS": { 
        #include "factions\jihadists.sqf" 
    };
    
    case "ANA": { 
        #include "factions\ana.sqf" 
    };
    
    case "US-VIETNAM": { 
        #include "factions\us-vietnam.sqf" 
    };
    
    case "RUC": { 
        #include "factions\ruc.sqf" 
    };
    
    case "BRITS-70": { 
        #include "factions\brits70.sqf" 
    };
    
    case "PMC": { 
        #include "factions\pmc.sqf" 
    };

    case "DEFAULT": { 
        #include "factions\default.sqf" 
    };  
};