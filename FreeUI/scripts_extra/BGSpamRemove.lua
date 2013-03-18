--[[

local bgZones = select(2, ...)

bgZones[461] = "ArathiBasin"
bgZones[736] = "BattleForGilneas"
bgZones[512] = "Strand of the Ancients"
bgZones[401] = "Alterac Valley"
bgZones[482] = "Eye of the Storm"
bgZones[540] = "Isle of Conquest"
bgZones[860] = "Silvershard Mines"
bgZones[856] = "Temple of Kotmogu"
bgZones[626] = "Twin Peaks"
bgZones[443] = "Warsong Gulch"


local DisableSpam

do
	local RaidBossEmoteFrame, GetCurrentMapAreaID, spamDisabled = _G["RaidBossEmoteFrame"], GetCurrentMapAreaID

	function DisableSpam()
		if bgZones[ GetCurrentMapAreaID() ] then
			RaidBossEmoteFrame:UnregisterEvent( "RAID_BOSS_EMOTE" )
			spamDisabled = true
		elseif spamDisabled then
			RaidBossEmoteFrame:RegisterEvent( "RAID_BOSS_EMOTE" )
			spamDisabled = false
		end
	end
end

local Fixer = CreateFrame( "Frame" )

Fixer:RegisterEvent( "ZONE_CHANGED_NEW_AREA" )
Fixer:SetScript( "OnEvent", DisableSpam )

DisableSpam()

]]--


local BATTLEGROUNDS = {
	["Arathi Basin"] = true,
	["Wintergrasp"] = true,
	["Strand of the Ancients"] = true,
	["Tol Barad"] = true,
	["The Battle for Gilneas"] = true,
	["Temple of Kotmogu"] = true,
}

local Fixer = CreateFrame( "Frame" )
local RaidBossEmoteFrame, spamDisabled = RaidBossEmoteFrame
local function ToggleBossEmotes()
   if BATTLEGROUNDS[GetZoneText()] then 
      RaidBossEmoteFrame:UnregisterEvent( "RAID_BOSS_EMOTE" )
      spamDisabled = true
   elseif spamDisabled then
      RaidBossEmoteFrame:RegisterEvent( "RAID_BOSS_EMOTE" )
      spamDisabled = false
   end
end

Fixer:RegisterEvent( "PLAYER_ENTERING_WORLD" )
Fixer:RegisterEvent( "ZONE_CHANGED_NEW_AREA" )
Fixer:SetScript( "OnEvent", ToggleBossEmotes )



