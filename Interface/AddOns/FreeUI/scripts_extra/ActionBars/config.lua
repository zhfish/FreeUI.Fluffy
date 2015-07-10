
-- // rActionBarStyler
-- // zork - 2012

-----------------------------
-- INIT
-----------------------------

--get the addon namespace
local cfg = CreateFrame("Frame")
local addon, ns = ...
ns.cfg = cfg

-----------------------------
-- CONFIG
-----------------------------

--use "/rabs" to see the command list

cfg.font = "Interface\\Addons\\FreeUI\\Media\\pixel.ttf"
cfg.hotkeys = true
cfg.macroname = true

cfg.bars = {
    --BAR 1
    bar1 = {
        enable          = true, --enable module
        scale           = 1,
        padding         = 1, --frame padding
        buttons         = {
            size            = 28,
            margin          = 4,
        },
        pos             = { a1 = "BOTTOM", a2 = "BOTTOM", af = "UIParent", x = 0, y = 14 },
        userplaced      = {
            enable          = false,
        },
        mouseover       = {
            enable          = false,
            fadeIn          = {time = 0.4, alpha = 1},
            fadeOut         = {time = 0.3, alpha = 0},
        },
        combat          = { --fade the bar in/out in combat/out of combat
        enable          = false,
        fadeIn          = {time = 0.4, alpha = 1},
        fadeOut         = {time = 5, alpha = 0},
    },
},
--OVERRIDE BAR (vehicle ui)
overridebar = { --the new vehicle and override bar
enable          = true, --enable module
scale           = 1,
padding         = 2, --frame padding
buttons         = {
    size            = 34,
    margin          = 4,
},
pos             = { a1 = "BOTTOM", a2 = "BOTTOM", af = "UIParent", x = 0, y = 22 },
userplaced      = {
    enable          = false,
},
mouseover       = {
    enable          = false,
    fadeIn          = {time = 0.4, alpha = 1},
    fadeOut         = {time = 0.3, alpha = 0.2},
},
combat          = { --fade the bar in/out in combat/out of combat
enable          = false,
fadeIn          = {time = 0.4, alpha = 1},
fadeOut         = {time = 0.3, alpha = 0.2},
},
},
--BAR 2
bar2 = {
    enable          = true, --enable module
    scale           = 1,
    padding         = 1, --frame padding
    buttons         = {
        size            = 28,
        margin          = 4,
    },
    pos             = { a1 = "BOTTOM", a2 = "BOTTOM", af = "UIParent", x = 0, y = 46 },
    userplaced      = {
        enable          = false,
    },
    mouseover       = {
        enable          = false,
        fadeIn          = {time = 0.4, alpha = 1},
        fadeOut         = {time = 0.3, alpha = 0.2},
    },
    combat          = { --fade the bar in/out in combat/out of combat
    enable          = false,
    fadeIn          = {time = 0.4, alpha = 1},
    fadeOut         = {time = 0.3, alpha = 0.2},
},
},
--BAR 3
bar3 = {
    enable          = true, --enable module
    layout2         = false,
    scale           = 1,
    padding         = 1, --frame padding
    buttons         = {
        size            = 28,
        margin          = 4,
    },
    pos             = { a1 = "BOTTOM", a2 = "BOTTOM", af = "UIParent", x = 0, y = 78  },
    pos_layout2     = { a1 = "BOTTOMLEFT", a2 = "BOTTOMRIGHT", af = "rABS_MainMenuBar", x = 0, y = 0  },
    userplaced      = {
        enable          = true,
    },
    mouseover       = {
        enable          = false,
        fadeIn          = {time = 0.4, alpha = 1},
        fadeOut         = {time = 0.3, alpha = 0},
    },
    combat          = { --fade the bar in/out in combat/out of combat
    enable          = false,
    fadeIn          = {time = 0.4, alpha = 1},
    fadeOut         = {time = 0.3, alpha = 0.2},
},
},
--BAR 4
bar4 = {
    enable          = true, --enable module
    scale           = 1,
    padding         = 1, --frame padding
    buttons         = {
        size            = 24,
        margin          = 4,
    },
    pos             = { a1 = "RIGHT", a2 = "RIGHT", af = "UIParent", x = -6, y = 0 },
    userplaced      = {
        enable          = false,
    },
    mouseover       = {
        enable          = false,
        fadeIn          = {time = 0.4, alpha = 1},
        fadeOut         = {time = 0.3, alpha = 0.2},
    },
    combat          = { --fade the bar in/out in combat/out of combat
    enable          = false,
    fadeIn          = {time = 0.4, alpha = 1},
    fadeOut         = {time = 5, alpha = 0},
},
},
--BAR 5
bar5 = {
    enable          = true, --enable module
    scale           = 1,
    padding         = 1, --frame padding
    buttons         = {
        size            = 24,
        margin          = 4,
    },
    pos             = { a1 = "LEFT", a2 = "LEFT", af = "UIParent", x = 2, y = 20 },
    userplaced      = {
        enable          = false,
    },
    mouseover       = {
        enable          = false,
        fadeIn          = {time = 0.4, alpha = 1},
        fadeOut         = {time = 0.3, alpha = 0},
    },
    combat          = { --fade the bar in/out in combat/out of combat
    enable          = false,
    fadeIn          = {time = 0.4, alpha = 1},
    fadeOut         = {time = 5, alpha = 0},
},
},
--PETBAR
petbar = {
    enable          = true, --enable module
    show            = true, --true/false
    scale           = 1,
    padding         = 2, --frame padding
    buttons         = {
        size            = 32,
        margin          = 1,
    },
    pos             = { a1 = "BOTTOM", a2 = "BOTTOM", af = "UIParent", x = 0, y = 114 },
    userplaced      = {
        enable          = false,
    },
    mouseover       = {
        enable          = false,
        fadeIn          = {time = 0.4, alpha = 1},
        fadeOut         = {time = 0.3, alpha = 0},
    },
    combat          = { --fade the bar in/out in combat/out of combat
    enable          = false,
    fadeIn          = {time = 0.4, alpha = 1},
    fadeOut         = {time = 0.3, alpha = 0.2},
},
},
--STANCE- + POSSESSBAR
stancebar = {
    enable          = true, --enable module
    show            = true, --true/false
    scale           = 1,
    padding         = 2, --frame padding
    buttons         = {
        size            = 30,
        margin          = 0,
    },
    pos             = { a1 = "BOTTOM", a2 = "BOTTOM", af = "UIParent", x = -30, y = 114 },
    userplaced      = {
        enable          = true,
    },
    mouseover       = {
        enable          = false,
        fadeIn          = {time = 0.4, alpha = 1},
        fadeOut         = {time = 0.3, alpha = 0.4},
    },
    combat          = { --fade the bar in/out in combat/out of combat
    enable          = false,
    fadeIn          = {time = 0.4, alpha = 1},
    fadeOut         = {time = 0.3, alpha = 0.2},
},
},
--EXTRABAR
extrabar = {
    enable          = true, --enable module
    scale           = 1,
    padding         = 10, --frame padding
    buttons         = {
        size            = 56,
        margin          = 5,
    },
    pos             = { a1 = "TOP", a2 = "TOP", af = "UIParent", x = 0, y = -250 },
    userplaced      = {
        enable          = false,
    },
    mouseover       = {
        enable          = false,
        fadeIn          = {time = 0.4, alpha = 1},
        fadeOut         = {time = 0.3, alpha = 0.2},
    },
},
--VEHICLE EXIT (no vehicleui)
leave_vehicle = {
    enable          = false, --enable module
    scale           = 1,
    padding         = 2, --frame padding
    buttons         = {
        size            = 28,
        margin          = 0,
    },
    pos             = { a1 = "BOTTOM", a2 = "BOTTOM", af = "UIParent", x = 159, y = 22 },
    userplaced      = {
        enable          = false,
    },
    mouseover       = {
        enable          = false,
        fadeIn          = {time = 0.4, alpha = 1},
        fadeOut         = {time = 0.3, alpha = 0.2},
    },
},
--MICROMENU
micromenu = {
    enable          = true, --enable module
    show            = false, --true/false
    scale           = 1,
    padding         = 2, --frame padding
    pos             = { a1 = "TOP", a2 = "TOP", af = "UIParent", x = 0, y = 25 },
    userplaced      = {
        enable          = false,
    },
    mouseover       = {
        enable          = false,
        fadeIn          = {time = 0.4, alpha = 1},
        fadeOut         = {time = 0.3, alpha = 0},
    },
},
--BAGS
bags = {
    enable          = true, --enable module
    show            = false, --true/false
    scale           = 0.82,
    padding         = 15, --frame padding
    pos             = { a1 = "BOTTOMRIGHT", a2 = "BOTTOMRIGHT", af = "UIParent", x = -0, y = 0 },
    userplaced      = {
        enable          = true,
    },
    mouseover       = {
        enable          = true,
        fadeIn          = {time = 0.4, alpha = 1},
        fadeOut         = {time = 0.3, alpha = 0},
    },
},
}

-----------------------------
-- CHARSPECIFIC REWRITES
-----------------------------

local playername, _ = UnitName('player')

if playername == 'Dostoyevsky' or playername == 'Turgenev' or playername == 'Solor' or playername == 'Cyrtia' then
    cfg.bars.bar3.layout2 = true
    cfg.bars.bar4.pos = { a1 = "RIGHT", a2 = "RIGHT", af = "UIParent", x = -4, y = -140 }
    cfg.bars.bar5.pos = { a1 = "RIGHT", a2 = "RIGHT", af = "UIParent", x = -30, y = -140 }
    cfg.bars.petbar.buttons.size = 28
    cfg.bars.petbar.pos = { a1 = "BOTTOM", a2 = "BOTTOM", af = "UIParent", x = 0, y = 82 }
    cfg.bars.petbar.mouseover.enable = true
    cfg.bars.stancebar.show = false
end


