local _G = _G
local F, C, L = unpack(Aurora)


C.themes["Blizzard_TalkingHeadUI"] = function()

	local frame = CreateFrame("Frame", UIParent)
	frame:SetScale(.6)
	frame:SetPoint("TOP", 0, -100)
	frame:SetSize(64,64)


	TalkingHeadFrame:SetParent(frame)
	TalkingHeadFrame:ClearAllPoints()
	TalkingHeadFrame:SetPoint("CENTER")
	TalkingHeadFrame.ignoreFramePositionManager = true

end