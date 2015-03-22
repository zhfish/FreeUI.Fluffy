-- Play a cheer sound when you get an achievement.

local sounds = {
	["ACHIEVEMENT_EARNED"] = "Sound\\Events\\GuldanCheers.wav", "MASTER",
}

local f = CreateFrame("Frame")
f:RegisterEvent("ACHIEVEMENT_EARNED")
f:SetScript("OnEvent", function(self, event)
	PlaySoundFile(sounds[event])
end)