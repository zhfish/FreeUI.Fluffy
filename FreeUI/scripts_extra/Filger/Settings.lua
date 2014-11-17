-- 设置(初次调整 位置,图标大小等, 请对照主楼置顶的标注图)
Filger_Settings = {
	config_mode = false,				-- 开\关测试模式
	max_test_icon = 4,					-- 测试模式下,每组显示最大图标数量
	player_buff_icon = {"TOPLEFT", "oUF_FreePlayer", "BOTTOMLEFT", 0, -10},		-- player's buff
	player_proc_icon = {"BOTTOMLEFT", "oUF_FreePlayer", "TOPLEFT", 0, 20},		-- player's proc
	special_proc_icon = {"BOTTOMRIGHT", "oUF_FreePlayer", "TOPRIGHT", 0, 20},	-- special proc on player
	cooldown = {"TOPLEFT", "oUF_FreePlayer", "BOTTOMLEFT", 0, -50},				-- player's cooldown
	target_debuff_icon = {"BOTTOMLEFT", "oUF_FreeTarget", "TOPLEFT", 0, 20},	-- target's debuff by player
	target_aura_icon = {"BOTTOMRIGHT", "oUF_FreeTarget", "TOPRIGHT", 0, 20},	-- important aura on target (PVP)
	raid_aura_icon = {"BOTTOMLEFT", "oUF_FreePlayer", "TOPLEFT", 0, 70},		-- important raid aura
	bar_1 = {"TOPLEFT", "oUF_FreePlayer", "BOTTOMLEFT", 0, -150},				-- bar 1
	bar_2 = {"TOPRIGHT", UIParent, "RIGHT", -260, 0},							-- bar 2
}

local Misc = CreateFrame("Frame")
local Media = "Interface\\AddOns\\FreeUI\\scripts_extra\\Filger\\Media\\"
	Misc.Media = Media

	-- ShestakUI_Filger.lua
	-- 可选颜色: "DK", "DLY"-小德, "LR", "FS", "WS"-武僧, "QS", "MS"-牧师(既白色), "DZ", "SM", "SS", "ZS", "Black"-黑色, "Gray"-灰色, "OWN"-自动选择你当前角色的职业颜色.
	Misc.font = Media.."PFTempestaSeven.ttf"	-- 所有数字的字体
	Misc.barfg = Media.."barfg"		-- 计时条材质
	Misc.modefg = "DLY"				-- 计时条颜色
	Misc.modeback = "Black"			-- 图标背景或蒙板颜色（一像素和毛绒绒样式无效）
	Misc.modeborder = "Black"		-- 边框颜色
	Misc.numsize = 8				-- 层数, 计时条的计时数字大小
	Misc.namesize = 8				-- 法术名称字体大小

	Misc.Dleft = "LEFT"
	Misc.Dright = "RIGHT"

	-- Cooldowns.lua
	Misc.cdsize = 16				-- 图标中间的 CD 数字大小

	-- Spells.lua
	Misc.bar1 = "OFF"				-- 开(ON)\关(OFF) target_bar 目标计时条 - (主图标注号 9)
	Misc.bar2 = "OFF"				-- 开(ON)\关(OFF) pve_cc 计时条 - (主图标注号 7)
	Misc.CD = "ON"					-- 开(ON)\关(OFF) COOLDOWN 冷却图标 - (主图标注号 8)
	Misc.barw = 160					-- 计时条长度 - (主图标注号 7,9)
	Misc.CDnum = 6					-- COOLDOWN 冷却图标每行显示几个 - (主图标注号 8)
	Misc.AURAnum = 2
	Misc.IconSize = 38				-- 图标大小 - (主图标注号 1,2,3,4,5,6)
	Misc.IconSizePBuff = 32
	Misc.IconSizePProc = 28
	Misc.IconSizePSpec = 28
	Misc.IconSizeRaidAura = 40
	Misc.IconSizeTBuff = 36
	Misc.IconSizeTDebuff = 32
	Misc.CDIconSize = 32			-- COOLDOWN 冷却图标大小 - (主图标注号 8)
	Misc.barIconSize = 25			-- 计时条上的图标大小 - (主图标注号 7,9)

-------------------------------------------------------- 
getscreenheight = tonumber(string.match(({GetScreenResolutions()})[GetCurrentResolution()], "%d+x(%d+)")) 
getscreenwidth = tonumber(string.match(({GetScreenResolutions()})[GetCurrentResolution()], "(%d+)x+%d")) 

--   Pixel perfect script of custom ui Scale 
UIScale = function() 
   uiscale = min(2, max(0.64, 768 / string.match(GetCVar("gxResolution"), "%d+x(%d+)"))) 
end 
UIScale() 

local mult = 768 / string.match(GetCVar("gxResolution"), "%d+x(%d+)") / uiscale 
local Scale = function(x) 
   return mult * math.floor(x / mult + 0.5) 
end 
Misc.mult = mult 

----------------------- ShestakUI_Filger_Fluffy -----------------------

-- 命名空间
local _, sakaras = ...
sakaras.FilgerSettings = Misc
