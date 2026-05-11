TITLE Ih channel from Hill
: The non specific "funny" current Ih = gH*m*(V - Vh) has a maximal conductance gH = 0.0115e-3 S/cm2 
: and its activation kinetics is set by m_inf = 1./(1.+exp((V-Vhalf)/slope)) 
: while its time dependecy is set by tau_m = 1./(exp(-14.59-0.086*V) + exp(-1.87+0.0701*V))
: with Vhalf = -75 mV.

NEURON {
	SUFFIX Ih
	NONSPECIFIC_CURRENT ih
        RANGE gH, Vhalf, eh
        RANGE m_inf, tau_m, slope
}

PARAMETER {
	v (mV)
        eh = -45 (mV)        
	celsius (degC)
	gH = 0.0115e-3 (S/cm2) 
        Vhalf = -75.0 (mV)
        slope = 5.5
}

ASSIGNED {
	ih (mA/cm2)
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
	ih = gH*m*(v-eh)
}

DERIVATIVE states {     
        rate(v)
        m' =  (m_inf - m)/tau_m
}

PROCEDURE rate(v (mV)) { 
        m_inf = 1./(1.+exp((v-Vhalf)/slope))
        tau_m = 1./(exp(-14.59-0.086*v) + exp(-1.87+0.0701*v)) 
}
