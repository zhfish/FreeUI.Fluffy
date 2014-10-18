local class = select(2, UnitClass("player"))

if class == "WARLOCK" then

local lowHealth = .2
local lowMana 	= .3

local playedHp, playedMp
local f = CreateFrame("Frame")
f:SetScript("OnEvent", function(self, event, unit, pType)
	if unit ~= "player" then return end
	if event == "UNIT_HEALTH" or event == "UNIT_MAXHEALTH" then
		if UnitHealth("player") / UnitHealthMax("player") < lowHealth then
			if not playedHp then
				playedHp = true
				PlaySoundFile("Interface\\AddOns\\FreeUI\\media\\LowHealth.ogg")
			end
		else
			playedHp = false
		end
	elseif event == "UNIT_POWER" or event == "UNIT_MAXPOWER" and pType == "MANA" then
		if UnitPower("player") / UnitPowerMax("player") < lowMana then
			if not playedMp then
				playedMp = true
				PlaySoundFile("Interface\\AddOns\\FreeUI\\media\\LowMana.ogg")
			end
		else
			playedMp = false
		end
	end
end)

f:RegisterEvent("UNIT_HEALTH")
f:RegisterEvent("UNIT_POWER")
f:RegisterEvent("UNIT_MAXHEALTH")
f:RegisterEvent("UNIT_MAXPOWER")

end