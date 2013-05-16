-- Unerring Vision of Lei-Shen (Crit, Proc)
local UnerringVision = CreateFrame("Frame")
	UnerringVision:SetScript("OnEvent",function(_, _, _, eventType, _, _, _, _, _, _, destName, _, _, spellID)
		if ((eventType == "SPELL_AURA_APPLIED" or eventType == "SPELL_AURA_REFRESH") and (spellID == 138963) and (destName == UnitName("player"))) then
  			PlaySoundFile("Interface\\AddOns\\FreeUI\\scripts_extra\\media\\execute.ogg");
		end
	end)
UnerringVision:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")