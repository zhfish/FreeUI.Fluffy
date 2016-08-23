local F, C, L = unpack(select(2, ...))

local SCALE			= 1
local WIDTH 		= 256
local HEIGHT 		= 2
local _, CLASS 		= UnitClass("player")
local COLOR			= CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[CLASS] or RAID_CLASS_COLORS[CLASS]
local POSITION		= {"TOP", Minimap, "BOTTOM", 0, 32}
local OFFSET		= -3
local TIP			= {"TOPRIGHT", UIParent, -275, -235}
local TEXTURE 		= [[Interface/AddOns/FreeUI/media/statusbar]]

-- LOCALE
local L = {}
if (GetLocale() == "zhCN") then
	L = {
		["Hated"]		= "仇恨",
		["Hostile"]		= "敌对",
		["Unfriendly"]	= "冷淡",
		["Neutral"]		= "中立",
		["Friendly"]	= "友善",
		["Honored"]		= "尊敬",
		["Revered"]		= "崇敬",
		["Exalted"]		= "崇拜",
	}
else
	L = {
		["Hated"]		= "Hated",
		["Hostile"]		= "Hostile",
		["Unfriendly"]	= "Unfriendly",
		["Neutral"]		= "Neutral",
		["Friendly"]	= "Friendly",
		["Honored"]		= "Honored",
		["Revered"]		= "Revered",
		["Exalted"]		= "Exalted",
	}
end

-- DATA METHODS
local FactionInfo = {
	[1] = {170/255, 70/255, 70/255, L["Hated"], "FFaa4646"},
	[2] = {170/255, 70/255, 70/255, L["Hostile"], "FFaa4646"},
	[3] = {170/255, 70/255, 70/255, L["Unfriendly"], "FFaa4646"},
	[4] = {200/255, 180/255, 100/255, L["Neutral"], "FFc8b464"},
	[5] = {75/255, 175/255, 75/255, L["Friendly"], "FF4baf4b"},
	[6] = {75/255, 175/255, 75/255, L["Honored"], "FF4baf4b"},
	[7] = {75/255, 175/255, 75/255, L["Revered"], "FF4baf4b"},
	[8] = {155/255, 255/255, 155/255, L["Exalted"],"FF9bff9b"},
}

f = CreateFrame("Frame", nil, UIParent)
f:SetPoint(POSITION[1], POSITION[2], POSITION[3], POSITION[4], POSITION[5])
f:SetWidth(WIDTH)
f:SetHeight(HEIGHT)
f:SetScale(SCALE)

-- SETUP BARS
local setBar = function(frame)
	frame:SetStatusBarTexture(TEXTURE)
	frame:SetWidth(WIDTH)
	frame:SetHeight(HEIGHT)
	frame:SetScale(SCALE)
end

local setBackdrop = function(frame) 
	frame.bg = CreateFrame("Frame", nil, frame)
	frame.bg:SetBackdrop({
		bgFile = [[Interface/Buttons/WHITE8X8]],
		tiled = false,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	frame.bg:SetPoint("TOPLEFT", frame, -1, 1)
	frame.bg:SetPoint("BOTTOMRIGHT", frame, 1, -1)
	frame.bg:SetFrameLevel(1)
	frame.bg:SetBackdropColor(0, 0, 0, 1)

	-- frame.shadow = CreateFrame("Frame", nil, frame)
	-- frame.shadow:SetBackdrop({
	-- 	bgFile = [[Interface/Tooltips/UI-Tooltip-Background]],
	-- 	edgeFile = C.media.glow,
	-- 	tiled = false,
	-- 	insets = {left = 3, right = 3, top = 3, bottom = 3}
	-- })
	-- frame.shadow:SetPoint("TOPLEFT", frame, -3, 3)
	-- frame.shadow:SetPoint("BOTTOMRIGHT", frame, 3, -3)
	-- frame.shadow:SetFrameLevel(0)
	-- frame.shadow:SetBackdropColor(0, 0, 0, .6)
end

local xp = CreateFrame("StatusBar", nil, f)
setBar(xp)
xp:SetFrameLevel(4)
xp:SetStatusBarColor(.4, .1, .6)
xp:SetPoint(POSITION[1], POSITION[2], POSITION[3], POSITION[4], POSITION[5])
setBackdrop(xp)

local rest = CreateFrame("StatusBar", nil, xp)
setBar(rest)
rest:SetFrameLevel(3)
rest:EnableMouse(false)
rest:SetStatusBarColor(.2, .4, .8)
rest:SetAllPoints(xp)

local artifact = CreateFrame("StatusBar", nil, f)
setBar(artifact)
artifact:SetFrameLevel(4)
artifact:SetStatusBarColor(230/255, 204/255, 128/255)
artifact:SetPoint(POSITION[1], POSITION[2], POSITION[3], POSITION[4], UnitLevel"player" == MAX_PLAYER_LEVEL and POSITION[5] or POSITION[5] + OFFSET)
setBackdrop(artifact)

local rep = CreateFrame("StatusBar", nil, f)
setBar(rep)
rep:SetFrameLevel(4)
setBackdrop(rep)

local numberize = function(v)
	if v <= 9999 then return v end
	if v >= 1000000 then
		local value = string.format("%.1fm", v/1000000)
		return value
	elseif v >= 10000 then
		local value = string.format("%.1fk", v/1000)
		return value
	end
end

local xp_update = function()
	if UnitLevel("player") < MAX_PLAYER_LEVEL and not IsXPUserDisabled() then
		local c, m = UnitXP("player"), UnitXPMax("player")
		local p, r = math.ceil(c/m*100), GetXPExhaustion()

		xp:SetMinMaxValues(min(0, c), m)
		xp:SetValue(c)
		rest:SetMinMaxValues(min(0, c), m)
		rest:SetValue(r and (c + r) or 0)
	else
		xp:Hide() 
		rest:Hide()
	end
end

local showExperienceTooltip = function(self)
	if UnitLevel("player") < MAX_PLAYER_LEVEL and not IsXPUserDisabled() then
		local xpc, xpm, xpr = UnitXP("player"), UnitXPMax("player"), GetXPExhaustion("player")

		GameTooltip:SetOwner(self, "ANCHOR_NONE")
		GameTooltip:SetPoint(TIP[1], TIP[2], TIP[3], TIP[4], TIP[5])

		GameTooltip:AddLine("Level "..UnitLevel("player"), COLOR.r, COLOR.g, COLOR.b)
		GameTooltip:AddLine((numberize(xpc).."/"..numberize(xpm).." ("..floor((xpc/xpm)*100) .."%)"), 1, 1, 1)
		if xpr then
			GameTooltip:AddLine(numberize(xpr).." ("..floor((xpr/xpm)*100) .."%)", .2, .4, .8)
		end

		GameTooltip:Show()
	end
end

local artifact_update = function(self, event)
	if HasArtifactEquipped() then
		local id, altid, name, icon, total, spent, q = C_ArtifactUI.GetEquippedArtifactInfo()	
		local num, xp, next = MainMenuBar_GetNumArtifactTraitsPurchasableFromXP(spent, total)
		local percent = math.ceil(xp/next*100)

		artifact:ClearAllPoints()
		artifact:SetMinMaxValues(0, next)
		artifact:SetValue(xp)

		local y = POSITION[5]
		if xp:IsShown() then
			y = y + OFFSET
		end
		artifact:SetPoint(POSITION[1], POSITION[2], POSITION[3], POSITION[4], y)
		artifact:Show()
	else
		artifact:Hide()
	end
end

local showArtifactTooltip = function(self) 
	if HasArtifactEquipped() then
		local id, altid, name, icon, total, spent, q = C_ArtifactUI.GetEquippedArtifactInfo()
		local num, xp, next = MainMenuBar_GetNumArtifactTraitsPurchasableFromXP(spent, total)
		local percent = math.ceil(xp/next*100)

		GameTooltip:SetOwner(self, "ANCHOR_NONE")
		GameTooltip:SetPoint(TIP[1], TIP[2], TIP[3], TIP[4], TIP[5])

		GameTooltip:AddLine(name, COLOR.r, COLOR.g, COLOR.b)
		GameTooltip:AddLine("Artifact Power: "..percent, 1, 1, 1)
		GameTooltip:AddLine("Points to spend: " .. num, 1, 1, 1)
		GameTooltip:AddLine("Next trait: " .. xp .. "/" .. next, 1, 1, 1)

		GameTooltip:Show()
	end
end

local rep_update = function()
	if GetWatchedFactionInfo() then
		local name, rank, minRep, maxRep, value = GetWatchedFactionInfo()

		rep:ClearAllPoints()
		rep:SetMinMaxValues(minRep, maxRep)
		rep:SetValue(value)
		rep:SetStatusBarColor(FactionInfo[rank][1], FactionInfo[rank][2], FactionInfo[rank][3])

		local y = POSITION[5]
		if xp:IsShown() then
			y = y + OFFSET
		end
		if artifact:IsShown() then
			y = y + OFFSET
		end
		rep:SetPoint(POSITION[1], POSITION[2], POSITION[3], POSITION[4], y)
		rep:Show()
	else
		rep:Hide()
	end
end

local showReputationTooltip = function(self)
	if GetWatchedFactionInfo() then
		local name, rank, start, cap, value = GetWatchedFactionInfo()

		GameTooltip:SetOwner(self, "ANCHOR_NONE")
		GameTooltip:SetPoint(TIP[1], TIP[2], TIP[3], TIP[4], TIP[5])

		GameTooltip:AddDoubleLine("Reputation:", name, r, g, b, 1, 1, 1)
		GameTooltip:AddDoubleLine("Standing:", string.format("|c"..FactionInfo[rank][5].."%s|r", FactionInfo[rank][4]), r, g, b)
		GameTooltip:AddDoubleLine("Rep:", string.format("%s/%s (%d%%)", BreakUpLargeNumbers(value-start), BreakUpLargeNumbers(cap-start), (value-start)/(cap-start)*100), r, g, b, 1, 1, 1)
		GameTooltip:AddDoubleLine("Remaining:", string.format("%s", BreakUpLargeNumbers(cap-value)), r, g, b, 1, 1, 1)

		GameTooltip:Show()
	end
end

-- events
xp:RegisterEvent("PLAYER_ENTERING_WORLD")
xp:RegisterEvent("PLAYER_LEVEL_UP")
xp:RegisterEvent("PLAYER_XP_UPDATE")
xp:RegisterEvent("UPDATE_EXHAUSTION")
xp:SetScript("OnEvent", xp_update)
xp:SetScript("OnEnter", function() showExperienceTooltip(xp) end)
xp:SetScript("OnLeave", function() GameTooltip:Hide() end)

artifact:RegisterEvent("PLAYER_ENTERING_WORLD")
artifact:RegisterEvent("PLAYER_LEVEL_UP")
artifact:RegisterEvent("ARTIFACT_XP_UPDATE")
artifact:RegisterEvent("ARTIFACT_UPDATE")
artifact:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
artifact:SetScript("OnEvent", artifact_update)
artifact:SetScript("OnEnter", function() showArtifactTooltip(artifact) end)
artifact:SetScript("OnLeave", function() GameTooltip:Hide() end)

rep:RegisterEvent("PLAYER_ENTERING_WORLD")
rep:RegisterEvent("PLAYER_LEVEL_UP")
rep:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
rep:RegisterEvent("UPDATE_FACTION")
rep:RegisterEvent("CHAT_MSG_COMBAT_FACTION_CHANGE")
rep:SetScript("OnEvent", rep_update)
rep:SetScript("OnEnter", function() showReputationTooltip(rep) end)
rep:SetScript("OnLeave", function() GameTooltip:Hide() end)