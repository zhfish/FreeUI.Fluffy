local F, C = unpack(select(2, ...))

if not C.general.AuraTracker then return end

Filger_Settings = {
--	config_mode = false,
	max_test_icon = 4,

	Self_Buff	= {"BOTTOMLEFT", "oUF_FreePlayer", "TOPLEFT", 0, 20},		-- player's buff/proc
	Self_CD		= {"TOPLEFT", "oUF_FreePlayer", "BOTTOMLEFT", 0, -20},		-- player's cooldown
	Tar_Debuff 	= {"BOTTOMLEFT", "oUF_FreeTarget", "TOPLEFT", 0, 20},		-- target's debuff by player
	Buff_Comm	= {"BOTTOMRIGHT", "oUF_FreePlayer", "TOPRIGHT", 0, 20},		-- important buff on player (others)
	Tar_Aura	= {"BOTTOMLEFT", "oUF_FreeTarget", "TOPLEFT", 0, 100},		-- important aura on target (anyone)
	RaidAlert 	= {"BOTTOMLEFT", "oUF_FreeTarget", "TOPLEFT", 0, 200},		-- imporatant aura by dungeon boss
}

local Misc = CreateFrame("Frame")
local Media = "Interface\\AddOns\\FreeUI\\scripts_extra\\Filger\\Media\\"
	Misc.Media = Media

	Misc.font = Media.."PFTempestaSeven.ttf"

	Misc.numsize = 8
	Misc.namesize = 8

	Misc.CDnum = 6
	Misc.AURAnum = 6

	Misc.IconSizeNormal = 32
	Misc.IconSizeBig = 44

local _, filger = ...
filger.FilgerSettings = Misc
