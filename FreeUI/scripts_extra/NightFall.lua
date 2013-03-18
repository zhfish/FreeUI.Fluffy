local NightFall = CreateFrame("Frame")
	NightFall:SetScript("OnEvent",function(_, _, _, eventType, _, _, _, _, _, _, destName, _, _, spellID)
		if ((eventType == "SPELL_AURA_APPLIED" or eventType == "SPELL_AURA_REFRESH") and (spellID == 17941) and (destName == UnitName("player"))) then
  			PlaySoundFile("Interface\\AddOns\\FreeUI\\scripts_extra\\media\\ding.ogg");
		end
	end)
NightFall:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")







