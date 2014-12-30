-- 设置(初次调整 位置,图标大小等, 请对照主楼置顶的标注图)
Filger_Settings = {
	config_mode = false,				-- 开\关测试模式
	max_test_icon = 6,					-- 测试模式下,每组显示最大图标数量
	C_AURA		= {"TOPLEFT", "oUF_FreePlayer", "BOTTOMLEFT", 0, 100},		-- comm aura
	P_AURA		= {"BOTTOMLEFT", "oUF_FreePlayer", "TOPLEFT", 0, 20},		-- player's buff/debuff/proc
	P_CD		= {"TOPLEFT", "oUF_FreePlayer", "BOTTOMLEFT", 0, -20},		-- player's cooldown
	T_AURA_P 	= {"BOTTOMLEFT", "oUF_FreeTarget", "TOPLEFT", 0, 20},		-- target's debuff by player
	R_T_AURA 	= {"BOTTOMLEFT", "oUF_FreeTarget", "TOPLEFT", 0, 80},		-- important aura alert (dungeon/PVP)
}

local Misc = CreateFrame("Frame")
local Media = "Interface\\AddOns\\FreeUI\\scripts_extra\\Filger\\Media\\"
	Misc.Media = Media
	
	Misc.font = Media.."PFTempestaSeven.ttf"	
	Misc.modeback = "Black"			
	Misc.modeborder = "Black"		
	Misc.numsize = 8				
	Misc.namesize = 8				

	Misc.Dleft = "LEFT"
	Misc.Dright = "RIGHT"

	Misc.CDnum = 6					
	Misc.AURAnum = 6

	Misc.IconSizeNormal = 32
	Misc.IconSizeBig = 40


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
