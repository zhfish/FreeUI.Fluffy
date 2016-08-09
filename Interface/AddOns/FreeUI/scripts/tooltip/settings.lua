local F, C, L = unpack(select(2, ...))
if C.tooltip.enable == false then return end
local ADDON_NAME, ns = ...

ns.cfg_override = {
	-- override the settings in freebTip.lua
	point = C.tooltip.position,
	--scale = 1.15,
	--font = "Interface\\AddOns\\SharedMedia_MyMedia\\font\\calibri.ttf",
}
