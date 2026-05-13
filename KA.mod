TITLE KA channel from Compte
: The fast A-type K+ channel is as inGolomb and Amitai (1997); IA = gA*m_inf^3*h*(v-ek) 
: has its fast activation variable replaced by its steady-state m_inf = 1/[1 + exp(-(V + 50)/20)] 
: and the inactivation variable is governed by h_inf = 1/[1 + exp((V + 80)/6)] and tau_h = 15 ms. 
: Its maximal conductance is gA = 1 mS/cm2.

NEURON { 
	SUFFIX KA
	USEION k READ ek WRITE ik 
	RANGE gKA, m_inf, h_inf, tau_h, ik, OP
}  
 
PARAMETER { 
	v (mV) 
	celsius = 30 (degC)  
	ek = -100 (mV)
	gKA = 1e-3 (S/cm2)
	tau_h = 15 (ms)
} 

ASSIGNED {
	ik (mA/cm2)
	m_inf
	h_inf
	OP
} 

STATE {h}

INITIAL {
        rates(v) 
	h = h_inf
}

BREAKPOINT {
	SOLVE states METHOD derivimplicit 
        OP = m_inf^3*h
	ik = gKA*m_inf^3*h*(v-ek)
}

DERIVATIVE states {     
	rates(v) 
        h' = (h_inf - h)/tau_h 
}

PROCEDURE rates(v (mV)) { 
        m_inf = 1/(1 + exp(-(v + 50)/20))
	h_inf = 1/(1 + exp((v + 80)/6))
}
