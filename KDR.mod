TITLE K-DR channel from Compte
: The delayed rectifier IK = gK*n^4*(V - VK) has a maximal conductance gK = 10.5 mS/cm2 and 
: its inactivation kinetics are set by alpha_n = 0.01(V + 34)/[1 - exp(-(V + 34)/10)] 
: and beta_n = 0.125 exp[-(V + 44)/25]. 

NEURON {
	SUFFIX KDR
        USEION k WRITE ik
        RANGE n_inf, n, OP, a, b, gK
}

PARAMETER {
        v (mV)
        ek = -100 (mV)  
        gK = 10.5e-3 (S/cm2)
}

ASSIGNED {
	ik (mA/cm2)
        alpha_n
        beta_n
        n_inf
        a 
        b 
        OP 
}

STATE {n}

INITIAL {
        rates(v) 
        n = n_inf
}

BREAKPOINT { 
        SOLVE states METHOD derivimplicit         
        OP = n^4
        ik = gK*(n^4)*(v-ek)  
}

DERIVATIVE states { 
        rates(v)     
        n' = (a*(1.0-n))-(b*n)
        : for n'=0: n=a/(a+b)     
}

PROCEDURE rates(v) { :callable from hoc
        alpha_n = 4.*0.01*(v+34)/(1.-exp(-0.1*(v+34.)))   
        a = alpha_n
        beta_n = 4.*0.125*exp(-0.04*(v+44.))    
        b = beta_n     
        n_inf = a/(a+b) 
}


