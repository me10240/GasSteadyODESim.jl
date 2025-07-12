using GasSteadyODESim
using JSON
file = "./data/elpaso/"
eos_var = :ideal
ss = initialize_simulator(file, eos=eos_var, case_name="steady", case_types=[:bc], initial_guess_filename="exact_sol.json")

# using IterativeSolvers
# solver_return = run_simulator!(ss, linsolve=(x, A, b) -> copyto!(x, gmres(A, b,  maxiter = 7000) ) )
solver_return = run_simulator!(ss)


println(solver_return.status)
println(ref(ss, :node, 1, "withdrawal") * nominal_values(ss, :mass_flow))


#============== Save solution data for use =============================#

filename = "./data/elpaso/exact_sol.json"
open(filename, "w") do f 
        JSON.print(f, ss.sol, 2)
end

#=======================================================================#




 

