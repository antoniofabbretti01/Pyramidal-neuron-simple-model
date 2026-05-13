TITLE IM channel from McCormick
: The non-inactivating and non-rectifying K+ current IM = gM*m*(V - VK) has a maximal conductance gM = 0.083 mS/cm2  
: and its activation kinetics is set by m_inf = 1./(1.+exp(-0.1*(V-Vhalf)))
: while its time dependecy is set by tau_m = 1000.0/(3.3*(exp(0.05*(V-Vhalf))+exp(-0.05*(V-Vhalf))))
: with Vhalf = -35 mV.

NEURON {
	SUFFIX IM
        USEION k WRITE ik
        RANGE gM, Vhalf, m_inf, m, tau_m
}

PARAMETER {
        v (mV)
        ek = -100 (mV)        
	celsius (degC)
        gM = 0.083e-3 (S/cm2)
        Vhalf = -35.0 (mV)
}

ASSIGNED {
	ik (mA/cm2)
        m_inf      
        tau_m
}

STATE {m}

INITIAL {
	rate(v)
	m = m_inf
}

BREAKPOINT {
	SOLVE states METHOD cnexp
	ik = gM*m*(v-ek) 
}

DERIVATIVE states {         
        rate(v)
        m' = (m_inf - m)/tau_m
}

PROCEDURE rate(v (mV)) { 
        m_inf = 1./(1.+exp(-0.1*(v-Vhalf)))
        tau_m = 1000.0/(3.3*(exp(0.05*(v-Vhalf))+exp(-0.05*(v-Vhalf))))
}

