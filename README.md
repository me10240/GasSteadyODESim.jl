This package implements algorithms that are used to solve the steady state gas flow problem for a pipeline network with ideal and non-ideal equations of state. The governing equation for each pipe in the network is an ODE that  includes effect of convective acceleration (inertia) and gravity due to elevation or incline of the pipe. 
``GasSteadyODESim.jl`` is not a registered Julia package. Hence installation of the package should be done as follows:

```julia 
using Pkg
Pkg.add("https://github.com/me10240/GasSteadyODESim.jl.git")
```

For the API usage, users are referred to the ``test/`` and the ``examples/`` directories.

## Note
This package is related to but distinct from the following package ``GasSteadySim.jl`` ([link](https://github.com/kaarthiksundar/GasSteadySim.jl.git)). 
The package ``GasSteadySim.jl`` considers a system of nonlinear algebraic equations to solve the steady state gas flow problem for a pipeline network whereas  ``GasSteadyODESim.jl`` here solves a system of ODEs corresponding to pipes in the network coupled with a system of (non)linear algebraic equations.  
Under the special case that inertial effects and gravity are neglected, a first integral corresponding to the ODE for the pipe can be obtained, which is a nonlinear algebraic equation. This is the case considered in ``GasSteadySim``.