local _G = _G
local MyAddon = CreateFrame("Frame")

MyAddon:RegisterEvent("PLAYER_ENTERING_WORLD")

MyAddon:SetScript("OnEvent", function(self, event)
	if event=="PLAYER_ENTERING_WORLD" then
		local _,instanceType = IsInInstance()
		if instanceType=="raid" then
			SetCVar("UnitNameFriendlyPlayerName",0);
		else
			SetCVar("UnitNameFriendlyPlayerName",1);
		end
	end
end)