module RoME

using
  IncrementalInference,
  Graphs,
  KernelDensityEstimate,
  Distributions,
  Colors,
  Gadfly

export
  initfg,
  measureMeanDist,
  predictBodyBR,
  getLastPose2D,
  odomKDE,
  initFactorGraph!,
  addOdoFG!,
  newLandm!,
  addBRFG!,
  addMMBRFG!,
  addAutoLandmBR!,
  projNewLandm!,
  malahanobisBR,

  # helper functions
  getLastLandm2D,
  getLastPose2D,
  getNextLbl,

  # some transform functions
  cart2pol,
  pol2cart,

  # Feature tracking code
  Feature,
  initTrackersFrom,
  propAllTrackers!,
  measUpdateTrackers!,
  assocMeasWFeats!,

  # Some vizualization tools
  plotLsrScanFeats,
  drawFeatTrackers,
  saveImgSeq,
  lsrBR



include("BayesTracker.jl")
include("RobotViz.jl")
include("RobotUtils.jl")
include("SimulationUtils.jl")

end