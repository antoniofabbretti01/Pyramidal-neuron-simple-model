Here a simple model of an excitatory pyramidal neuron taken from the paper of Dalla Porta et al. 2025 (https://physoc.onlinelibrary.wiley.com/doi/full/10.1113/JP287616),
which is an extension of a previous model by Compte et al. 2002 (https://journals.physiology.org/doi/full/10.1152/jn.00845.2002),
and transposed from C++ language to the Neuron Python language. As in the original work, the neuron has only a somatic and a dendritic compartment.

The ionic currents in the soma are: leakage current (IL), sodium current (INa), delayed rectifier potassium current (IKDR), A-type K+ current (IKA), non-inactivating slow K+ current (IKS), 
Na+ dependent K+ current (IKNa), and the non-inactivating and non-rectifying K+ current (IM); while the ionic currents in the dendrite are: leakage current (IL), high-threshold Ca2+ (ICa), 
non-inactivating hyperpolarization-activated current (Ih), persistent Na+ current (INaP), anomalous rectifier K+ current (IKAR) and the Ca2+-dependent K+ current (IKCa).
Moreover the model comprises a Na+/K+ pump in the soma and a Ca++ pump in the dendrite.

Before running the python code, the .mod files must be compiled clicking on the file make.bat.
The .mod files cointains the dynamic equations of the mechanism (ionic channels and pumps) inserted in the membrane of the neuron model.

The python code generates:
- Membrane potential time course
- Na+ channel kinetics (as an example)
- [Na+]i and [Ca++]i time courses
- Current/frequency plot
