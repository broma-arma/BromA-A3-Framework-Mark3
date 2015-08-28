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
    
    case "USARMY": {
	#include "factions\usarmy.sqf"
    };
    
    case "MARINES": {
        #include "factions\marines.sqf"
    };   
    
    case "VDV": {
        #include "factions\vdv.sqf"
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
    
    case "FINNS": { 
        #include "factions\finns.sqf" 
    };  
    
    case "CSAT": { 
        #include "factions\csat.sqf" 
    };  

    case "NATO": { 
        #include "factions\nato.sqf" 
    }; 
    
    case "AAF": { 
        #include "factions\aaf.sqf" 
    };
    
    case "FIA": { 
        #include "factions\fia.sqf" 
    };    
    
    case "AHKMA-PMC": { 
        #include "factions\ahkma-pmc.sqf" 
    };
    
    case "SPRG": {
        #include "factions\sprg-report.sqf" 
    };
    
    case "NORSF": { 
        #include "factions\norsf.sqf" 
    };
    
    case "MOLATION": { 
        #include "factions\molatian.sqf" 
    };
	
    case "UN": { 
        #include "factions\un.sqf" 
    };
    
    case "TKARMY": { 
        #include "factions\tkarmy.sqf" 
    };
    
    case "RUSSIA": { 
        #include "factions\russia.sqf" 
    };
	
    case "CDF": { 
        #include "factions\cdf.sqf" 
    };
	
    case "BAF": { 
        #include "factions\baf.sqf" 
    };

    case "DEFAULT": { 
        #include "factions\template.sqf" 
    };
    
    default { 
        #include "factions\template.sqf" 
    };
};
