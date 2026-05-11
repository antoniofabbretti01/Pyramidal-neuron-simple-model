TITLE KAR from Compte
: The inwardly rectifying K+ channel was modeled as in (Stern et al. 1997; Spain et al. 1987) 
: and adjusting the parameters: IAR = gAR*h_inf*(v-ek) activates instantaneously below a low-lying 
: threshold following h_inf = 1/[1 + exp((V + 75)/4)] and it has a maximal conductance gAR = 0.0257 mS/cm2. 

NEURON { 
	SUFFIX KAR 
	USEION k WRITE ik 
	RANGE gKAR, h_inf, ik
} 
 
PARAMETER { 
	v (mV) 
	celsius = 30 (degC)  
	ek = -100 (mV)
	gKAR = 0.0257e-3 (S/cm2)
} 

ASSIGNED {
	ik (mA/cm2)
	h_inf
} 

BREAKPOINT {
	h_inf = 1/(1 + exp((v + 75)/4)) 
	ik = gKAR*h_inf*(v-ek)
}
