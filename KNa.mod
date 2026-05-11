TITLE KNa channel from Compte
: The Na2+-dependent K+ channel IKNa = gKNa*w_inf([Na+])*(V - VK) has a conductanceg KNa = 1.33 mS/cm2 
: and w_inf([Na+]) = 0.37/[1 + (38.7/[Na+])3.5] (Bischoff et al. 1998).

NEURON { 
	SUFFIX KNa 
	USEION k WRITE ik
	USEION na READ ina 
	RANGE ik, w_inf, gKNa, NaCeq
	RANGE NaCeqP, slope, alphaNa, Rpump, nai0, As, Ad, nai 
} 
 
PARAMETER { 
	: Channel parameters	
	v (mV) 
	celsius = 30 (degC) 
	NaCeq = 1e-6 (mM) : Na+ equilibrium concentration 
	slope = 3.5     
        ek = -100 (mV)
	ena = 55 (mV)  
        gKNa = 0.00133 (S/cm2)

        : Pump parameters
	ina (mA/cm2)
        inap (mA/cm2)
        NaCeqP = 9.5 (mM) : Na+ equilibrium concentration 
	alphaNa = 0.01 :(mM/(nA*ms)) 
        Rpump = 0.018 (mM/ms)
        nai0 = 9.5 (mM)
	As = 0.015 (mm2) : Area soma
        Ad = 0.035 (mm2) : Area dendrite
}  

ASSIGNED { 
	ik (mA/cm2) 
	w_inf
} 

BREAKPOINT {
	SOLVE states METHOD derivimplicit 
	w_inf = 0.37/(1 + (38.7/nai)^slope) - 0.37/(1 + (38.7/NaCeq)^slope)
	ik = gKNa*w_inf*(v+100) 
}



: Na+ pump equation

STATE {nai (mM)}

INITIAL {nai = nai0}

DERIVATIVE states { 
    nai' = -alphaNa*(As*ina)*1e4 - Rpump*( (pow(nai,3) / ( pow(nai,3) + pow(15,3) ) ) - ( pow(NaCeqP,3) /( pow(NaCeqP,3) + pow(15,3) )))
}      
