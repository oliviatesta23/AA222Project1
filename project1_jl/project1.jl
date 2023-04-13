#=
        project1.jl -- This is where the magic happens!
    All of your code must either live in this file, or be `include`d here.
=#
#=
    If you want to use packages, please do so up here.
    Note that you may use any packages in the julia standard library
    (i.e. ones that ship with the julia language) as well as Statistics
    (since we use it in the backend already anyway)
=#
# Example:
# using LinearAlgebra
#=
    If you're going to include files, please do so up here. Note that they
    must be saved in project1_jl and you must use the relative path
    (not the absolute path) of the file in the include statement.

    [Good]  include("somefile.jl")
    [Bad]   include("/pathto/project1_jl/somefile.jl")
=#
# Example
# include("myfile.jl")

"""
    optimize(f, g, x0, n, prob)

Arguments:
    - `f`: Function to be optimized
    - `g`: Gradient function for `f`
    - `x0`: (Vector) Initial position to start from
    - `n`: (Int) Number of evaluations allowed. Remember `g` costs twice of `f`
    - `prob`: (String) Name of the problem. So you can use a different strategy for each problem. E.g. "simple1", "secret2", etc.

Returns:
    - The location of the minimum
"""
include(joinpath("project1_jl", "helpers.jl"))
include(joinpath("project1_jl", "project1.jl"))

function optimize(f, g, x0, n, prob) 
    # f is function, g is gradient, x0 is initial point, n is number of times to call function, prob is sample number (tune based on problem)
    # calling function = 1 function call
    # call gradition = 2 function calls
    # x_best = x0
    if prob == "simple1"
        xhistory, fhistory = bad_optimizer(f, g, x0, n, 0.1)
    elseif prob == "simple2"
        xhistory, fhistory = bad_optimizer(f, g, x0, n, 0.1)
    else
        xhistory, fhistory =  bad_optimizer(f, g, x0, n, 0.5)
    end
    xbest = xhistory(argmin(fhistory))
    return x_best
end

function bad_optimizer(f, g, x0, n, step_size) # dont use this in project
    xhistory = [x0]
    fhistory = [f(x0)]

    # Iterate through algorithm
    for i = 1:n-1 #n-1 calls function to the left
        xnext = xhistory[end] + step_size*ones(length(x0)) #fucntion called before * step size and vector of 1
        # AGAIN: dont submit this, just for formating
        push!(xhistory, xnext) # stores the value generated in the x histroy vectory
        push!(fhistory, f(xnext)) # stores the value generated in the F histroy vectory
    end

    return xhistory, fhistory
end