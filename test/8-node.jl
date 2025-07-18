

@testset "test 8 node ideal run" begin
    file = "./data/8-node/"
    ss = initialize_simulator(file, eos=:ideal, initial_guess_filename="")
    solver_return = run_simulator!(ss)

    @show solver_return.stats
    @test solver_return.status == physical_solution
    @test ref(ss, :node, 1, "withdrawal") * nominal_values(ss, :mass_flow) ≈ -275.00 atol = 1e-2
    exact_sol = GasSteadyODESim._parse_json(file * "exact_sol_ideal.json")
    _check_correctness(ss.sol, exact_sol)


end

@testset "test 8 node simple CNGA run" begin
    file = "./data/8-node/"
    ss = initialize_simulator(file, eos=:simple_cnga, initial_guess_filename="")
    solver_return = run_simulator!(ss)

    @show solver_return.stats
    @test solver_return.status == physical_solution
    @test ref(ss, :node, 1, "withdrawal") * nominal_values(ss, :mass_flow) ≈ -275.00 atol = 1e-2
    exact_sol = GasSteadyODESim._parse_json(file * "exact_sol_simple_cnga.json")
    _check_correctness(ss.sol, exact_sol)
end


@testset "test 8 node full CNGA run" begin
    file = "./data/8-node/"
    ss = initialize_simulator(file, eos=:full_cnga, initial_guess_filename="")
    solver_return = run_simulator!(ss)

    @show solver_return.stats
    @test solver_return.status == physical_solution
    @test ref(ss, :node, 1, "withdrawal") * nominal_values(ss, :mass_flow) ≈ -275.00 atol = 1e-2
    exact_sol = GasSteadyODESim._parse_json(file * "exact_sol_full_cnga.json")
    _check_correctness(ss.sol, exact_sol)
end
