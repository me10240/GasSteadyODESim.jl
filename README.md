# GasSteadyODESim.jl 

This package implements algorithms that are used to solve the steady state gas flow problem for a pipeline network with ideal and non-ideal equations of state. The governing equation for each pipe in the network is an ODE that  includes effect of convective acceleration (inertia) and gravity due to elevation or incline of the pipe. 
``GasSteadyODESim.jl`` is not a registered Julia package. Hence installation of the package should be done as follows:

```julia 
using Pkg
Pkg.add("https://github.com/me10240/GasSteadyODESim.jl.git")
```

For the API usage, users are referred to the ``test/`` and the ``examples/`` directories.