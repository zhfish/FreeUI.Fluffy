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