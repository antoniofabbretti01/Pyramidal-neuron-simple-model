TITLE Peristent Na channel from Compte
: The persistent sodium channel INaP = gNaP*m_inf^3*(V - VNa) has maximal conductanceg NaP = 0.0686 mS/cm2, 
: it activates instantaneously according to m_inf = 1/[1 + exp(-(V + 55.7)/7.7)] and it does not inactivate. 
: It is borrowed with parameter modification from (Fleidervish et al. 1996).

NEURON { 
	SUFFIX NaP 
	USEION na WRITE ina
	RANGE gNaP, m_inf, OP
} 
 
PARAMETER { 
	v (mV) 
	celsius = 30 (degC)  
	ena = 55 (mV)    
	gNaP = 0.0686e-3 (S/cm2) 
} 

ASSIGNED { 
	ina (mA/cm2)  
	OP
	m_inf
} 
 
BREAKPOINT {  
        m_inf = 1/(1 + exp(-(v + 55.7)/7.7)) 
	ina = gNaP*m_inf^3*(v-ena) 
	OP = m_inf^3
} 
