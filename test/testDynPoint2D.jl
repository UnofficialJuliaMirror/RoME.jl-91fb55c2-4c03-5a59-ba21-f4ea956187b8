# test the DynPoint2 functionality

using RoME, Distributions
using Base: Test


# N = 75
fg = initfg()

# add two point locations
v0 = addNode!(fg, :x0, DynPoint2(ut=0))

v1 = addNode!(fg, :x1, DynPoint2(ut=1000_000))

# Prior factor as boundary condition
pp0 = DynPoint2VelocityPrior(MvNormal([zeros(2);10*ones(2)], 0.1*eye(4)))
f0 = addFactor!(fg, [:x0;], pp0)

# conditional likelihood between Dynamic Point2
dp2dp2 = DynPoint2DynPoint2(MvNormal([10*ones(2);zeros(2)], 0.1*eye(4)))
f1 = addFactor!(fg, [:x0;:x1], dp2dp2)

# Graphs.plot(fg.g)
ensureAllInitialized!(fg)




tree = wipeBuildNewTree!(fg)
inferOverTree!(fg, tree)



# using RoMEPlotting,
using KernelDensityEstimate #, KernelDensityEstimatePlotting

# X1 = getVal(fg, :x1)
@show x0 = getKDEMax(getVertKDE(fg, :x0))

@show x1 = getKDEMax(getVertKDE(fg, :x1))





# N = 75
fg = initfg()

# add two point locations
v0 = addNode!(fg, :x0, DynPoint2(ut=0))
v1 = addNode!(fg, :x1, DynPoint2(ut=1000_000))
v2 = addNode!(fg, :x2, DynPoint2(ut=2000_000))


# Prior factor as boundary condition
pp0 = DynPoint2VelocityPrior(MvNormal([zeros(2);10*ones(2)], 0.1*eye(4)))
f0 = addFactor!(fg, [:x0;], pp0)

# conditional likelihood between Dynamic Point2
dp2dp2 = VelPoint2VelPoint2(MvNormal([10*ones(2);zeros(2)], 0.1*eye(4)))
f1 = addFactor!(fg, [:x0;:x1], dp2dp2)

# conditional likelihood between Dynamic Point2
dp2dp2 = VelPoint2VelPoint2(MvNormal([10*ones(2);zeros(2)], 0.1*eye(4)))
f2 = addFactor!(fg, [:x1;:x2], dp2dp2)


# Graphs.plot(fg.g)
ensureAllInitialized!(fg)




tree = wipeBuildNewTree!(fg)
inferOverTree!(fg, tree)



# X1 = getVal(fg, :x1)
@show x0 = getKDEMax(getVertKDE(fg, :x0))

@show x1 = getKDEMax(getVertKDE(fg, :x1))

@show x2 = getKDEMax(getVertKDE(fg, :x2))














#