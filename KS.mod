TITLE KS current from Compte
: The non-inactivating K+-channel is modeled as in (Wang 1999a) but with no inactivation variable: 
: iKS = gKS*m(v-ek). It has a maximal conductanceg KS = 0.576 mS/cm2 and an activation controlled 
: by m_inf = 1/[1 + exp(-(V + 34)/6.5)] and tau_m = 8/[exp(-(V + 55)/30) + exp((V + 55)/30)].

NEURON { 
	SUFFIX KS  
	USEION k WRITE ik 
	RANGE gKS, m_inf, tau_m, m, ik
} 
 
PARAMETER { 
	v (mV) 
	celsius = 30 (degC)  
	ek = -100 (mV) 
	gKS = 0.576e-3 (S/cm2)
} 

ASSIGNED {
	ik (mA/cm2)
	m_inf
	tau_m
} 

STATE {m}

INITIAL {
        rates(v) 
        m = m_inf
}

BREAKPOINT {
	SOLVE states METHOD derivimplicit 
	ik = gKS*m*(v+100) 
}

DERIVATIVE states {     
	rates(v) 
        m' = (m_inf - m)/tau_m 
}

PROCEDURE rates(v (mV)) { :callable from hoc
	m_inf = 1/(1 + exp(-(v + 34)/6.5))
	tau_m = 8/(exp(-(v + 55)/30) + exp((v + 55)/30))
}
