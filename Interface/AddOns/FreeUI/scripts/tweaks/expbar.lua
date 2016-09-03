local F, C, L = unpack(select(2, ...))

local SCALE			= 1
local WIDTH 		= 256
local HEIGHT 		= 2
local _, CLASS 		= UnitClass("player")
local COLOR			= CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[CLASS] or RAID_CLASS_COLORS[CLASS]
local POSITION		= {"TOP", Minimap, "BOTTOM", 0, 32}
local OFFSET		= -4
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
	frame.bg:SetBackdropColor(0, 0, 0, .35)
end

local experience = CreateFrame('StatusBar', nil, f, 'AnimatedStatusBarTemplate')
setBar(experience)
experience:SetFrameLevel(4)
experience:SetStatusBarColor(.4, .1, .6)
experience:SetAnimatedTextureColors(.4, .1, .6)
experience:SetPoint(POSITION[1], POSITION[2], POSITION[3], POSITION[4], POSITION[5])
setBackdrop(experience)

local rest = CreateFrame('StatusBar', nil, experience)
setBar(rest)
rest:SetFrameLevel(3)
rest:EnableMouse(false)
rest:SetStatusBarColor(.2, .4, .8)
rest:SetAllPoints(experience)

local artifact = CreateFrame('StatusBar', nil, f, 'AnimatedStatusBarTemplate')
setBar(artifact)
artifact:SetFrameLevel(4)
artifact:SetStatusBarColor(230/255, 204/255, 128/255)
artifact:SetAnimatedTextureColors(230/255, 204/255, 128/255)
--artifact:SetPoint(POSITION[1], POSITION[2], POSITION[3], POSITION[4], UnitLevel'player' == MAX_PLAYER_LEVEL and POSITION[5] or POSITION[5] + OFFSET)
setBackdrop(artifact)

local reputation = CreateFrame("StatusBar", nil, f)
setBar(reputation)
reputation:SetFrameLevel(4)
setBackdrop(reputation)

local numberize = function(v)
    if v <= 9999 then return v end
    if v >= 1000000 then
        local value = string.format('%.1fm', v/1000000)
        return value
    elseif v >= 10000 then
        local value = string.format('%.1fk', v/1000)
        return value
    end
end

local experience_update = function()
	if UnitLevel('player') == MAX_PLAYER_LEVEL then
		local name, standing, min, max, cur = GetWatchedFactionInfo()
		if name then
			local faction = FACTION_BAR_COLORS[standing]
			experience:SetStatusBarColor(faction.r, faction.g, faction.b)
			experience:SetAnimatedTextureColors(faction.r, faction.g, faction.b)
			experience:SetAnimatedValues(cur - min, min, max, standing)
			-- experience:SetMinMaxValues(min, max)
			-- experience:SetValue(cur)
			experience:Show()

			rest:SetMinMaxValues(0, 1)
			rest:SetValue(0)
			return
		end

		experience:Hide()
		rest:Hide()
	else
		local c, m, l	= UnitXP('player'), UnitXPMax('player'), UnitLevel('player')
		local p 			= math.ceil(c/m*100)
		local r			= GetXPExhaustion()

		experience:SetAnimatedValues(c, 0, m, l)
		-- xp:SetMinMaxValues(min(0, c), m)
		-- xp:SetValue(c)
		rest:SetMinMaxValues(min(0, c), m)
		rest:SetValue(r and (c + r) or 0)
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

local reputation_update = function()
	if GetWatchedFactionInfo() then
		local name, rank, minRep, maxRep, value = GetWatchedFactionInfo()

		reputation:ClearAllPoints()
		reputation:SetMinMaxValues(minRep, maxRep)
		reputation:SetValue(value)
		reputation:SetStatusBarColor(FactionInfo[rank][1], FactionInfo[rank][2], FactionInfo[rank][3])

		local y = POSITION[5]
		if experience:IsShown() then
			y = y + OFFSET
		end

		reputation:SetPoint(POSITION[1], POSITION[2], POSITION[3], POSITION[4], y)
		reputation:Show()
	else
		reputation:Hide()
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

local artifact_update = function(self, event)
	if HasArtifactEquipped() then
		local id, altid, name, icon, total, spent, q = C_ArtifactUI.GetEquippedArtifactInfo()	
		local num, xp, next = MainMenuBar_GetNumArtifactTraitsPurchasableFromXP(spent, total)
		local percent = math.ceil(xp/next*100)

		artifact:SetAnimatedValues(xp, 0, next, num + spent)
		-- artifact:SetMinMaxValues(0, next)
		-- artifact:SetValue(xp)

		local y = POSITION[5]
		-- if UnitLevel'player' >= MAX_PLAYER_LEVEL and IsXPUserDisabled() then
		-- 	y = POSITION[5]
		-- end
		local y = POSITION[5]
		if experience:IsShown() then
			y = y + OFFSET
		end
		if reputation:IsShown() then
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



-- events
experience:RegisterEvent('PLAYER_LEVEL_UP')
experience:RegisterEvent('PLAYER_XP_UPDATE')
experience:RegisterEvent('UPDATE_EXHAUSTION')
experience:RegisterEvent('PLAYER_ENTERING_WORLD')
experience:RegisterEvent('MODIFIER_STATE_CHANGED')
experience:RegisterEvent('UPDATE_FACTION')
experience:SetScript('OnEvent', experience_update)
experience:SetScript('OnEnter', function() showExperienceTooltip(experience) end)
experience:SetScript('OnLeave', function() GameTooltip:Hide() end)
hooksecurefunc("SetWatchedFactionIndex", experience_update)

artifact:RegisterEvent("PLAYER_ENTERING_WORLD")
artifact:RegisterEvent("PLAYER_LEVEL_UP")
artifact:RegisterEvent("UPDATE_EXHAUSTION")
artifact:RegisterEvent("UPDATE_FACTION")
artifact:RegisterEvent('MODIFIER_STATE_CHANGED')
artifact:RegisterEvent("CHAT_MSG_COMBAT_FACTION_CHANGE")
artifact:RegisterEvent("ARTIFACT_XP_UPDATE")
artifact:RegisterEvent("ARTIFACT_UPDATE")
artifact:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
artifact:SetScript('OnEvent', artifact_update)
artifact:SetScript('OnEnter', function() showArtifactTooltip(artifact) end)
artifact:SetScript('OnLeave', function() GameTooltip:Hide() end)

reputation:RegisterEvent("PLAYER_ENTERING_WORLD")
reputation:RegisterEvent("PLAYER_LEVEL_UP")
reputation:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
reputation:RegisterEvent("UPDATE_FACTION")
reputation:RegisterEvent("CHAT_MSG_COMBAT_FACTION_CHANGE")
reputation:SetScript("OnEvent", reputation_update)
reputation:SetScript("OnEnter", function() showReputationTooltip(reputation) end)
reputation:SetScript("OnLeave", function() GameTooltip:Hide() end)