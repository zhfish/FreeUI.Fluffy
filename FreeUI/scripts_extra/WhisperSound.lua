----------------------------------------------------------------------------------------
--	Play sound files system(by Tukz)
----------------------------------------------------------------------------------------
local SoundSys = CreateFrame("Frame")
SoundSys:RegisterEvent("CHAT_MSG_WHISPER")
SoundSys:RegisterEvent("CHAT_MSG_BN_WHISPER")
SoundSys:HookScript("OnEvent", function(self, event, ...)
	if event == "CHAT_MSG_WHISPER" or event == "CHAT_MSG_BN_WHISPER" then
		PlaySoundFile("Interface\\AddOns\\FreeUI\\scripts_extra\\media\\whisper.mp3", "Master")
	end
end)