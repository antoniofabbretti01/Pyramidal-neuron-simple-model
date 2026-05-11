TITLE Fast Na current from Compte
: The sodium current INa = gNa*m_inf^3*h*(V - VNa) has a maximum conductance of gNa = 50 mS/cm2, 
: its rapid activation variable is replaced by its steady-state m_inf = alpha_m/(alpha_m + beta_m) 
: with alpha_m = 0.1(V + 33)/[1 - exp(-(V + 33)/10)] and beta_m = 4 exp(-(V+ 53.7)/12) and 
: the inactivation variable has alpha_h = 0.07 exp(-(V + 50)/10) and beta_h = 1/[1 + exp(-(V + 20)/10)]. 

NEURON { 
	SUFFIX Na 
	USEION na WRITE ina 
	RANGE gNa, ina, m_inf, h, alpha_h, beta_h, alpha_m, beta_m, OP, h_inf
} 
  
PARAMETER { 
	v (mV) 
	celsius = 30 (degC)  
	ena = 55 (mV)   
	gNa = 50e-3 (S/cm) 
} 

ASSIGNED { 
	ina (mA/cm2)  
	alpha_h (/ms)
	beta_h (/ms)
	alpha_m (/ms)
	beta_m (/ms)
	h_inf
	m_inf
	a 
        b 
        OP
} 
 
STATE {h}

INITIAL {
	rates(v)
	h = h_inf	 
}

BREAKPOINT {  
	SOLVE states METHOD derivimplicit
        OP = (m_inf^3)*h
	ina = gNa*(m_inf^3)*h*(v-ena) 	 
} 
  
DERIVATIVE states {  
	rates(v)   
	h' = (a*(1.0-h))-(b*h)
	: for h'=0: h=a/(a+b) 
}

PROCEDURE rates(v) {  
	alpha_h = 4.*0.07*exp(-0.1*(v+50.))
	a = alpha_h
	beta_h = 4.*1./(1.+exp(-0.1*(v+20.)))
	b = beta_h 
        h_inf = alpha_h/(alpha_h + beta_h)
	alpha_m = 4.*0.1*(v+33.)/(1.-exp(-0.1*(v+33.)))
        beta_m = 4.*4.*exp(-0.0833*(v+53.7))
	m_inf = alpha_m/(alpha_m + beta_m)
}

