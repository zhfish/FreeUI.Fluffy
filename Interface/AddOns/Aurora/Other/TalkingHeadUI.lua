local _, private = ...

-- [[ Lua Globals ]]
local _G = _G
--local select, pairs = _G.select, _G.pairs

-- [[ WoW API ]]
local CreateFrame = _G.CreateFrame

-- [[ Core ]]
local F, C = _G.unpack(private.Aurora)


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