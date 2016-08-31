
local _G = _G
local F, C, L = unpack(Aurora)


C.themes["Blizzard_OrderHallUI"] = function()

local b = OrderHallCommandBar
b:UnregisterAllEvents()
b:HookScript("OnShow", b.Hide)
b:Hide()

end