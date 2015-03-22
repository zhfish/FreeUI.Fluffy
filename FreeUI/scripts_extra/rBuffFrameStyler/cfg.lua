
  -- // rBuffFrameStyler
  -- // zork - 2012

  -----------------------------
  -- INIT
  -----------------------------

  --get the addon namespace
  local addon, ns = ...
  local cfg = CreateFrame("Frame")
  ns.cfg = cfg

  -----------------------------
  -- CONFIG
  -----------------------------

cfg.debuff = true

cfg.buffframe = {
    scale           = 1,
    pos             = { a1 = "TOPRIGHT", af = "Minimap", a2 = "TOPLEFT", x = -10, y = -34 },
    rowSpacing      = 1,
    colSpacing      = 1,
    buffsPerRow     = 12,
    gap             = 10, --gap in pixel between buff and debuff
}

 cfg.tempenchant = {
    scale           = 1,
    pos             = {a1 = "BOTTOMRIGHT", af = "Minimap", a2 = "BOTTOMLEFT", x = -10, y = -18},
    colSpacing      = 1,
  }

cfg.duration = {
    pos             = { a1 = "TOPLEFT", x = 0, y = -2 },
  }

  cfg.count = {
    pos             = { a1 = "BOTTOMRIGHT", x = 0, y = 2 },
  }

  cfg.font = "Interface\\AddOns\\FreeUI\\Media\\pixel.ttf"
  cfg.fontsize = 8
