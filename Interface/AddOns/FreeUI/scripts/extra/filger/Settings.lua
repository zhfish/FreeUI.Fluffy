local F, C = unpack(select(2, ...))

if not C.general.auraTracker then return end

Filger_Settings = {
--	config_mode = true,	-- 测试模式
	max_test_icon = 6,		-- 测试模式显示图标数量

	Self_Buff	= {"BOTTOMRIGHT", "oUF_FreePlayer", "CENTER", -1, 60},		-- 玩家自身的 Buff 和 Proc
	Self_CD		= {"TOPLEFT", "oUF_FreePlayer", "BOTTOMLEFT", 0, -20},		-- 玩家自身的 Cooldown
	Tar_Debuff 	= {"BOTTOMLEFT", "oUF_FreeTarget", "TOPLEFT", 0, 20},		-- 玩家施放在目标身上的 Debuff
	Comm_Aura	= {"BOTTOMLEFT", "oUF_FreePlayer", "CENTER", 1, 60},		-- 友方施放在玩家身上的重要 Buff
	Tar_Aura	= {"BOTTOMLEFT", "oUF_FreeTarget", "TOPLEFT", 0, 100},		-- 目标身上的关键性进攻/防御/控制类技能
	RaidAlert 	= {"BOTTOMRIGHT", "oUF_FreePlayer", "TOPLEFT", 0, 400},		-- 团队副本里的重要技能
}

local Misc = CreateFrame("Frame")
local Media = "Interface\\AddOns\\FreeUI\\scripts_extra\\Filger\\Media\\"
	Misc.Media = Media
	Misc.font = Media.."PFTempestaSeven.ttf"
	Misc.numsize = 8
	Misc.namesize = 8
	Misc.IconSizeNormal = 34
	Misc.IconSizeBig = 44
	Misc.IconSizecd = 38

local _, filger = ...
filger.FilgerSettings = Misc
