TITLE Leakage current from Compte
: It is a passive channel with conductance and reversal potential
: gL = 0.0667 +- 0.0067 mS/cm2 and VL = -60.95 +- 0.3 mV 
: (Gaussian-distributed in the population, mean +- SD given).

NEURON { 
        SUFFIX leak 
        NONSPECIFIC_CURRENT iL
        RANGE vL, gL
}

PARAMETER {
        vL = -61  (mV)
        gL = 0.0667e-3 (S/cm2)
}

ASSIGNED { 
        iL
        v (mV) 
}

BREAKPOINT { 
        iL = gL*(v-vL) 
}
