using GasSteadyODESim
using JSON

file = "./data/yamal-europe/"
eos_var = :simple_cnga
inertial_bool = true
gravity_bool = true
guess_file = "r1.json"
write_bool = false
write_file = "r4.json"

file_name = "$eos_var" * "-inertia-" * "$inertial_bool" * ".csv"
open(file_name, "a") do io
        println(io, " # angle p2 rho2 rho1")
end

ss = initialize_simulator(file, eos=eos_var, initial_guess_filename=guess_file)
for angle = -5 : 5
        ss.ref[:pipe][1]["sin_incline"] = sind(angle)

        solver_return = run_simulator!(ss, method=:trust_region, gravity_bool= gravity_bool, inertial_bool=inertial_bool, iteration_limit=100, collocation_flag=true, show_trace_flag=true, reltol = 1e-3)


        println(solver_return.status)
        # inclination = asind(ss.ref[:pipe][1]["sin_incline"])
        p2 = ss.ref[:node][2]["pressure"] *  ss.nominal_values[:pressure]
        rho2 = ss.ref[:node][2]["density"] * ss.nominal_values[:density]
        rho1 = ss.ref[:node][1]["density"] * ss.nominal_values[:density]


        using DelimitedFiles

        file_name = "$eos_var" * "-inertia-" * "$inertial_bool" * ".csv"
        # Append the data to "my_data.csv" with a comma delimiter
        open(file_name, "a") do io
                println(io, "$angle $p2 $rho2 $rho1")
        end
end
#============== Save solution data for use =============================#
if solver_return.status != nl_solve_failure
        if write_bool
            filename = "./data/yamal-europe/" * write_file
            open(filename, "w") do f 
                JSON.print(f, ss.sol, 2)
            end
        end
        
end
#======================================================================#