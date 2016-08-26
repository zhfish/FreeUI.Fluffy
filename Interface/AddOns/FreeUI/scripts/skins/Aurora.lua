
-- Aurora custom pos on login
local f = CreateFrame'Frame'
f:RegisterEvent'ADDON_LOADED'
f:SetScript('OnEvent', function(self, event, addon)
	if addon == 'Aurora' then
		AuroraConfig = {
			["customColour"] = {
				["r"] = 0,
				["g"] = .5,
				["b"] = 1,
			},
			["chatBubbles"] = false,
			["acknowledgedSplashScreen"] = false,
			["tooltips"] = false,
			["bags"] = false,
			["buttonGradientColour"] = {
				0.3, -- [1]
				0.3, -- [2]
				0.3, -- [3]
				0.3, -- [4]
			},
			["loot"] = false,
			["buttonSolidColour"] = {
				0.1, -- [1]
				0.1, -- [2]
				0.1, -- [3]
				1, -- [4]
			},
			["useCustomColour"] = false,
			["enableFont"] = false,
			["useButtonGradientColour"] = false,
			["alpha"] = 0.6,
		}
		f:UnregisterEvent'ADDON_LOADED'
	end
end)
