
-- Layout for rActionBar

local F, C, L = unpack(select(2, ...))

if not C.actionbars.enable then return end

-----------------------------
-- Variables
-----------------------------

local A, L = ...

-----------------------------
-- Fader
-----------------------------

local fader_1 = {
  fadeInAlpha = 1,
  fadeInDuration = 0.3,
  fadeInSmooth = "OUT",
  fadeOutAlpha = 0.3,
  fadeOutDuration = 0.9,
  fadeOutSmooth = "OUT",
}

local fader_2 = {
  fadeInAlpha = 1,
  fadeInDuration = 0.3,
  fadeInSmooth = "OUT",
  fadeOutAlpha = 0,
  fadeOutDuration = 0.9,
  fadeOutSmooth = "OUT",
}

-----------------------------
-- BagBar
-----------------------------

local bagbar = {
  framePoint      = { "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -5, 5 },
  frameScale      = 1,
  framePadding    = 5,
  buttonWidth     = 32,
  buttonHeight    = 32,
  buttonMargin    = 2,
  numCols         = 6, --number of buttons per column
  startPoint      = "BOTTOMRIGHT", --start postion of first button: BOTTOMLEFT, TOPLEFT, TOPRIGHT, BOTTOMRIGHT
  fader           = fader,
  frameVisibility = "hide"
}
--create
rActionBar:CreateBagBar(A, bagbar)

-----------------------------
-- MicroMenuBar
-----------------------------

local micromenubar = {
  framePoint      = { "TOP", UIParent, "TOP", 0, 0 },
  frameScale      = 0.8,
  framePadding    = 5,
  buttonWidth     = 28,
  buttonHeight    = 58,
  buttonMargin    = 0,
  numCols         = 12,
  startPoint      = "BOTTOMLEFT",
  fader           = fader,
  frameVisibility = "hide"
}
--create
rActionBar:CreateMicroMenuBar(A, micromenubar)

-----------------------------
-- Bar1
-----------------------------

local bar1 = {
  framePoint      = { "BOTTOM", UIParent, "BOTTOM", 0, 6 },
  frameScale      = 1,
  framePadding    = 0,
  buttonWidth     = 30,
  buttonHeight    = 30,
  buttonMargin    = 4,
  numCols         = 12,
  startPoint      = "BOTTOMLEFT",
  fader           = nil,
}
--create
rActionBar:CreateActionBar1(A, bar1)

-----------------------------
-- Bar2
-----------------------------

local bar2 = {
  framePoint      = { "BOTTOM", A.."Bar1", "TOP", 0, 0 },
  frameScale      = 1,
  framePadding    = 4,
  buttonWidth     = 30,
  buttonHeight    = 30,
  buttonMargin    = 4,
  numCols         = 12,
  startPoint      = "BOTTOMLEFT",
  fader           = nil,
}
--create
rActionBar:CreateActionBar2(A, bar2)

-----------------------------
-- Bar3
-----------------------------

local bar3 = {
  framePoint      = { "BOTTOM", A.."Bar2", "TOP", 0, 0 },
  frameScale      = 1,
  framePadding    = 0,
  buttonWidth     = 30,
  buttonHeight    = 30,
  buttonMargin    = 4,
  numCols         = 12,
  startPoint      = "BOTTOMLEFT",
  fader           = nil,
}
--create
rActionBar:CreateActionBar3(A, bar3)

-----------------------------
-- Bar4
-----------------------------

local bar4 = {
  framePoint      = { "RIGHT", UIParent, "RIGHT", 0, -200 },
  frameScale      = 1,
  framePadding    = 4,
  buttonWidth     = 26,
  buttonHeight    = 26,
  buttonMargin    = 4,
  numCols         = 1,
  startPoint      = "TOPRIGHT",
  fader           = fader_1,
}
--create
rActionBar:CreateActionBar4(A, bar4)

-----------------------------
-- Bar5
-----------------------------

local bar5 = {
  framePoint      = { "RIGHT", A.."Bar4", "LEFT", 0, 0 },
  frameScale      = 1,
  framePadding    = 0,
  buttonWidth     = 26,
  buttonHeight    = 26,
  buttonMargin    = 4,
  numCols         = 1,
  startPoint      = "TOPRIGHT",
  fader           = fader_1,
}
--create
rActionBar:CreateActionBar5(A, bar5)

-----------------------------
-- StanceBar
-----------------------------

local stancebar = {
  framePoint      = { "BOTTOM", A.."Bar3", "TOP", 0, 0 },
  frameScale      = 1,
  framePadding    = 5,
  buttonWidth     = 32,
  buttonHeight    = 32,
  buttonMargin    = 5,
  numCols         = 12,
  startPoint      = "BOTTOMLEFT",
  fader           = nil,
}
--create
rActionBar:CreateStanceBar(A, stancebar)

-----------------------------
-- PetBar
-----------------------------

--petbar
local petbar = {
  framePoint      = { "BOTTOM", A.."Bar2", "TOP", 0, 0 },
  frameScale      = 1,
  framePadding    = 2,
  buttonWidth     = 24,
  buttonHeight    = 24,
  buttonMargin    = 4,
  numCols         = 12,
  startPoint      = "BOTTOMLEFT",
  fader           = fader_2,
}
--create
rActionBar:CreatePetBar(A, petbar)

-----------------------------
-- ExtraBar
-----------------------------

local extrabar = {
  framePoint      = { "BOTTOM", UIParent, "BOTTOM", 0, 250 },
  frameScale      = 1,
  framePadding    = 4,
  buttonWidth     = 44,
  buttonHeight    = 44,
  buttonMargin    = 4,
  numCols         = 1,
  startPoint      = "BOTTOMLEFT",
  fader           = nil,
}
--create
rActionBar:CreateExtraBar(A, extrabar)

-----------------------------
-- VehicleExitBar
-----------------------------

local vehicleexitbar = {
  framePoint      = { "BOTTOMLEFT", A.."Bar1", "BOTTOMRIGHT", 5, 0 },
  frameScale      = 1,
  framePadding    = 4,
  buttonWidth     = 32,
  buttonHeight    = 32,
  buttonMargin    = 4,
  numCols         = 1,
  startPoint      = "BOTTOMLEFT",
  fader           = nil,
}
--create
rActionBar:CreateVehicleExitBar(A, vehicleexitbar)

-----------------------------
-- PossessExitBar
-----------------------------

local possessexitbar = vehicleexitbar
possessexitbar.frameVisibility = nil --need to reset the value that is given to vehicleexitbar
--create
rActionBar:CreatePossessExitBar(A, possessexitbar)