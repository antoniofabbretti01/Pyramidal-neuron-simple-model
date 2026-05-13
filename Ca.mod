TITLE Ca++ channel from Compte
: The high-threshold Ca2+ channel ICa = gCa*m_inf^2*(V - VCa) has gCa = 0.43 mS/cm2 
: and is instantaneously activated at very depolarized voltages, thus making it effectively 
: a very transient current. The voltage dependency is given by m_inf = 1/[1 + exp(-(V + 20)/9)].

NEURON { 
        SUFFIX Ca  
        USEION ca WRITE ica
        RANGE gCa, m_inf, ica
}

PARAMETER {
        v (mV)
        eca = 120 (mV)
        gCa = 0.43e-3 (S/cm2)
}

ASSIGNED { 
        m_inf
        ica 
}

BREAKPOINT { 
        m_inf = 1/(1 + exp(-(v + 20)/9))
        ica = gCa*m_inf^2*(v-eca) 
}
