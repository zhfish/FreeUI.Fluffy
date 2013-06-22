-- 设置
local Misc = CreateFrame("Frame")
local Media = "Interface\\AddOns\\FreeUI\\scripts_extra\\Filger\\Media\\"
	Misc.Media = Media

	-- Filger.lua
	Misc.font = Media.."Pixel.ttf"	-- 所有数字的字体
	Misc.barfg = Media.."barfg"		-- 计时条材质
	Misc.modefg = "OWN"			-- 计时条颜色
	Misc.modeback = "Black"		-- 图标背景或蒙板颜色（一像素和毛绒绒样式无效）
	Misc.modeborder = "Black"	-- 边框颜色
	Misc.numsize = 14			-- 层数, 计时条的计时数字大小
	Misc.namesize = 14			-- 法术名称字体大小

	-- Cooldowns.lua
	Misc.cdsize = 16			-- 图标中间的 CD 数字大小

	-- config.lua
	Misc.Tbar = "ON"			-- 开(ON)\关(OFF) target_bar 目标计时条
	Misc.Pbar = "ON"			-- 开(ON)\关(OFF) pve_cc 计时条
	Misc.barw = 180				-- 计时条长度
	Misc.CDnum = 6				-- COOLDOWN 冷却图标每行显示几个

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
