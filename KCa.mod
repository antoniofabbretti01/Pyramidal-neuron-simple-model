TITLE KCa channel from Compte
: The Ca2+-dependent K+ channel IKCa = gKCa[Ca2+]/([Ca2+]+KD)(v-ek) (with KD = 30 uM) 
: activates instantaneously in the presence of intracellular calcium [Ca2+], 
: and it has a maximal conductance gKCa = 0.57 mS/cm2. 
: All the mechanisms involving intracellular calcium are taken from Wang (1998). 

NEURON { 
        SUFFIX KCa
        USEION k WRITE ik
        USEION ca READ ica 
        RANGE ik, KD, gKCa, m_inf
        RANGE alphaCa, tau_Ca, cai0, Ad, cai 
}

PARAMETER {
        : Channel parameters
        v (mV)
        ek = -100 (mV)
        KD = 30 (mM)
        gKCa = 0.57e-3 (S/cm2)

        : Pump parameters
        ica (mA/cm2)
        celsius = 30 (degC)
        alphaCa = 5e-3  :(mM/(nA*ms)) 
        tau_Ca = 150 (ms)          
        cai0 = 1e-4 (mM) 
        Ad = 0.035 (mm2) : Area dendrite         
}

ASSIGNED { 
        ik 
        m_inf
}

BREAKPOINT {
        SOLVE conc METHOD derivimplicit 
        m_inf = cai/(cai+KD)
        ik = gKCa*m_inf*(v-ek) 
}



: Ca++ pump equation

STATE {cai (mM)}

INITIAL {cai = cai0}

DERIVATIVE conc {    
    cai' = -alphaCa*Ad*ica*1e4 - cai/tau_Ca 
}
