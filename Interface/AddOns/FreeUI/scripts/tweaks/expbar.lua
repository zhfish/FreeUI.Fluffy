local SCALE			= 1
local WIDTH 		= 252
local HEIGHT 		= 2
local _, CLASS 		= UnitClass('player')
local COLOR			= CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[CLASS] or RAID_CLASS_COLORS[CLASS]
--local POSITION		= {'BOTTOM', Minimap, 'TOP', 0, -18}
local POSITION		= {"TOP", Minimap, "BOTTOM", 0, 32}
local OFFSET		= 10
--local TIP			= {'BOTTOMRIGHT', UIParent, -265, 85}
local TIP			= {'TOPRIGHT', UIParent, -275, -235}
local TEXTURE 		= [[Interface/AddOns/FreeUI/media/statusbar]]

f = CreateFrame('Frame', nil, UIParent)
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
	frame.bg = CreateFrame('Frame', nil, frame)
	frame.bg:SetBackdrop({
		bgFile = [[Interface/Buttons/WHITE8X8]],
		tiled = false,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	frame.bg:SetPoint('TOPLEFT', frame, -1, 1)
	frame.bg:SetPoint('BOTTOMRIGHT', frame, 1, -1)
	frame.bg:SetFrameLevel(1)
	frame.bg:SetBackdropColor(0, 0, 0, 1)
	
	frame.shadow = CreateFrame('Frame', nil, frame)
	frame.shadow:SetBackdrop({
		bgFile = [[Interface/Tooltips/UI-Tooltip-Background]],
		tiled = false,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	frame.shadow:SetPoint('TOPLEFT', frame, -3, 3)
	frame.shadow:SetPoint('BOTTOMRIGHT', frame, 3, -3)
	frame.shadow:SetFrameLevel(0)
	frame.shadow:SetBackdropColor(0, 0, 0, .6)
end

local xp = CreateFrame('StatusBar', nil, f)
setBar(xp)
xp:SetFrameLevel(4)
xp:SetStatusBarColor(.4, .1, .6)
xp:SetPoint(POSITION[1], POSITION[2], POSITION[3], POSITION[4], POSITION[5])
setBackdrop(xp)

local rest = CreateFrame('StatusBar', nil, xp)
setBar(rest)
rest:SetFrameLevel(3)
rest:EnableMouse(false)
rest:SetStatusBarColor(.2, .4, .8)
rest:SetAllPoints(xp)

local artifact = CreateFrame('StatusBar', nil, f)
setBar(artifact)
artifact:SetFrameLevel(4)
artifact:SetStatusBarColor(230/255, 204/255, 128/255)
artifact:SetPoint(POSITION[1], POSITION[2], POSITION[3], POSITION[4], UnitLevel'player' == MAX_PLAYER_LEVEL and POSITION[5] or POSITION[5] + OFFSET)
setBackdrop(artifact)

-- DATA METHODS
local factionStanding = {
	[1] = { name = 'Hated' },
	[2] = { name = 'Hostile' },
	[3] = { name = 'Unfriendly' },
	[4] = { name = 'Neutral' },
	[5] = { name = 'Friendly' },
	[6] = { name = 'Honored' },
	[7] = { name = 'Revered' },
	[8] = { name = 'Exalted' },
};

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


local xp_update = function()
	local c, m 	= UnitXP('player'), UnitXPMax('player')
	local p 	= math.ceil(c/m*100)
	local r     = GetXPExhaustion()

	if UnitLevel'player' >= MAX_PLAYER_LEVEL or IsXPUserDisabled() then
		xp:Hide() 
		rest:Hide()
	else
		xp:SetMinMaxValues(min(0, c), m)
		xp:SetValue(c)
		rest:SetMinMaxValues(min(0, c), m)
		rest:SetValue(r and (c + r) or 0)
	end
end

local showExperienceTooltip = function(self)
	local xpc, xpm, xpr = UnitXP('player'), UnitXPMax('player'), GetXPExhaustion('player')
	
	GameTooltip:SetOwner(self, 'ANCHOR_NONE')
	GameTooltip:SetPoint(TIP[1], TIP[2], TIP[3], TIP[4], TIP[5])
	
	if UnitLevel('player') ~= MAX_PLAYER_LEVEL or IsXPUserDisabled == false then
		GameTooltip:AddLine('Level '..UnitLevel('player'), COLOR.r, COLOR.g, COLOR.b)
		GameTooltip:AddLine((numberize(xpc)..'/'..numberize(xpm)..' ('..floor((xpc/xpm)*100) ..'%)'), 1, 1, 1)
		if xpr then
			GameTooltip:AddLine(numberize(xpr)..' ('..floor((xpr/xpm)*100) ..'%)', .2, .4, .8)
		end
		
		GameTooltip:Show()
	end
end

local artifact_update = function(self, event)
	if HasArtifactEquipped() then
		local id, altid, name, icon, total, spent, q = C_ArtifactUI.GetEquippedArtifactInfo()	
		local num, xp, next = MainMenuBar_GetNumArtifactTraitsPurchasableFromXP(spent, total)
		local percent       = math.ceil(xp/next*100)
		
		if not artifact:IsShown() then
			artifact:Show()
		end
	
		artifact:SetMinMaxValues(0, next)
		artifact:SetValue(xp)
		
		local y = POSITION[5] + OFFSET
		if UnitLevel'player' >= MAX_PLAYER_LEVEL or IsXPUserDisabled() then
			y = POSITION[5]
		end
		
		artifact:SetPoint(POSITION[1], POSITION[2], POSITION[3], POSITION[4], y)
	else
		if artifact:IsShown() then
			artifact:Hide()
		end
	end
	if event == 'ARTIFACT_XP_UPDATE' then
		if not artifact:IsShown() then
			artifact:Show()
		end
	end
end

local showArtifactTooltip = function(self) 
	local id, altid, name, icon, total, spent, q = C_ArtifactUI.GetEquippedArtifactInfo()
	local num, xp, next = MainMenuBar_GetNumArtifactTraitsPurchasableFromXP(spent, total)
	local percent       = math.ceil(xp/next*100)
	
	GameTooltip:SetOwner(self, 'ANCHOR_NONE')
	GameTooltip:SetPoint(TIP[1], TIP[2], TIP[3], TIP[4], TIP[5])
	
	GameTooltip:AddLine(name, COLOR.r, COLOR.g, COLOR.b)
	GameTooltip:AddLine('Artifact Power: '..percent, 1, 1, 1)
	GameTooltip:AddLine('Points to spend: ' .. num, 1, 1, 1)
	GameTooltip:AddLine('Next trait: ' .. xp .. '/' .. next, 1, 1, 1)
	
	GameTooltip:Show()
end



-- events
xp:RegisterEvent('PLAYER_LEVEL_UP')
xp:RegisterEvent('PLAYER_XP_UPDATE')
xp:RegisterEvent('UPDATE_EXHAUSTION')
xp:RegisterEvent('PLAYER_ENTERING_WORLD')
xp:SetScript('OnEvent', xp_update)
xp:SetScript('OnEnter', function() showExperienceTooltip(xp) end)
xp:SetScript('OnLeave', function() GameTooltip:Hide() end)

artifact:RegisterEvent('PLAYER_ENTERING_WORLD')
artifact:RegisterEvent('ARTIFACT_XP_UPDATE')
artifact:RegisterEvent('ARTIFACT_UPDATE')
artifact:RegisterEvent('PLAYER_EQUIPMENT_CHANGED')
artifact:RegisterEvent('PLAYER_LEVEL_UP')
artifact:SetScript('OnEvent', artifact_update)
artifact:SetScript('OnEvent', artifact_update)
artifact:SetScript('OnEnter', function() showArtifactTooltip(artifact) end)
artifact:SetScript('OnLeave', function() GameTooltip:Hide() end)