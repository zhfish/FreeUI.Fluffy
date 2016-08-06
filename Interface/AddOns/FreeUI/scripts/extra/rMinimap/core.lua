local F, C, L = unpack(select(2, ...))

local r, g, b = unpack(C.class)

-- rMinimap: core
-- zork, 2016

-----------------------------
-- Variables
-----------------------------

local A, L = ...

L.addonName       = A
L.dragFrames      = {}
L.addonColor      = "00FFAA00"
L.addonShortcut   = "rmm"

-----------------------------
-- Config
-----------------------------

local cfg = {
  scale = 1,
  point = { "TOPRIGHT", 0, 0},
}

--
local Scale = 1
local mediaFolder = "Interface\\AddOns\\FreeUI\\media\\"
position = "TOPRIGHT"
position_x = -22
position_y = 0
local texture = "Interface\\Buttons\\WHITE8x8"
local backdrop = {edgeFile = texture, edgeSize = 1}
local backdropcolor = {0/255, 0/255, 0/255}
local brdcolor = {0/255, 0/255, 0/255}
local locale = GetLocale()
local font = C.media.font2

-----------------------------
-- Init
-----------------------------

--MinimapCluster
-- MinimapCluster:SetScale(cfg.scale)
-- MinimapCluster:ClearAllPoints()
-- MinimapCluster:SetPoint(unpack(cfg.point))

--Minimap
local mediapath = "interface\\addons\\FreeUI\\scripts\\extra\\rMinimap\\media\\"
--Minimap:SetMaskTexture(mediapath.."mask2")
--Minimap:ClearAllPoints()
--Minimap:SetPoint("CENTER")
--Minimap:SetSize(190,190) --correct the cluster offset

Minimap:SetSize(256*Scale, 256*Scale)
Minimap:SetMaskTexture(mediaFolder.."rectangle")
Minimap:SetHitRectInsets(0, 0, 34*Scale, 34*Scale)
Minimap:SetFrameLevel(4)
Minimap:ClearAllPoints()
Minimap:SetPoint(position, UIParent, position_x, position_y)
Minimap:SetScale(Scale)

BorderFrame = CreateFrame("Frame", nil, Minimap)
BorderFrame:SetPoint("TOPLEFT", Minimap, "TOPLEFT", -1, -(32*Scale))
BorderFrame:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 1, (32*Scale))	
BorderFrame:SetBackdrop(backdrop)
BorderFrame:SetBackdropBorderColor(unpack(brdcolor))
BorderFrame:SetBackdropColor(unpack(backdropcolor))
BorderFrame:SetFrameLevel(6)

F.CreateSD(BorderFrame)

Minimap:SetScript("OnMouseUp", function(self, button)
	if button == "RightButton" then
		ToggleDropDownMenu(1, nil, MiniMapTrackingDropDown, "cursor", -162, 190)
	else
		Minimap_OnClick(self)
	end
end)

--hide regions
do
	local frames = {
		"MiniMapInstanceDifficulty",
		"MiniMapVoiceChatFrame",
		"MiniMapWorldMapButton",
		"MiniMapMailBorder",
		"MinimapBorderTop",
		"MinimapNorthTag",
		"MiniMapTracking",
		"MinimapZoomOut",
		"MinimapZoomIn",
		"MinimapBorder",
	}

	for i = 1, #frames do
		_G[frames[i]]:Hide()
		_G[frames[i]].Show = F.dummy
	end
end

--dungeon info
MiniMapInstanceDifficulty:ClearAllPoints()
MiniMapInstanceDifficulty:SetPoint("TOP",Minimap,"TOP",0,-5)
MiniMapInstanceDifficulty:SetScale(0.8)
GuildInstanceDifficulty:ClearAllPoints()
GuildInstanceDifficulty:SetPoint("TOP",Minimap,"TOP",0,-5)
GuildInstanceDifficulty:SetScale(0.7)
MiniMapChallengeMode:ClearAllPoints()
MiniMapChallengeMode:SetPoint("TOP",Minimap,"TOP",0,-10)
MiniMapChallengeMode:SetScale(0.6)

--QueueStatusMinimapButton (lfi)
QueueStatusMinimapButton:SetParent(Minimap)
QueueStatusMinimapButton:SetScale(1)
QueueStatusMinimapButton:ClearAllPoints()
QueueStatusMinimapButton:SetPoint("BOTTOMLEFT",Minimap,0,0)
QueueStatusMinimapButtonBorder:Hide()
QueueStatusMinimapButton:SetHighlightTexture (nil)
QueueStatusMinimapButton:SetPushedTexture(nil)

--garrison (DIEEEEEE!!!)
--GarrisonLandingPageMinimapButton

--mail
-- MiniMapMailFrame:ClearAllPoints()
-- MiniMapMailFrame:SetPoint("BOTTOMRIGHT",Minimap,-0,0)
-- MiniMapMailIcon:SetTexture(mediapath.."mail")
-- MiniMapMailBorder:SetTexture("Interface\\Calendar\\EventNotificationGlow")
-- MiniMapMailBorder:SetBlendMode("ADD")
-- MiniMapMailBorder:ClearAllPoints()
-- MiniMapMailBorder:SetPoint("CENTER",MiniMapMailFrame,0.5,1.5)
-- MiniMapMailBorder:SetSize(27,27)
-- MiniMapMailBorder:SetAlpha(0.5)

Minimap:EnableMouseWheel(true)
MinimapCluster:EnableMouse(false)
Minimap:SetScript("OnMouseWheel", function(_, zoom)
	if zoom > 0 then
		Minimap_ZoomIn()
	else
		Minimap_ZoomOut()
	end
end)

Minimap:SetScript("OnMouseUp", function(self, button)
	if button == "RightButton" then
		ToggleDropDownMenu(1, nil, MiniMapTrackingDropDown, "cursor", -162, 190)
	else
		Minimap_OnClick(self)
	end
end)

local mail = CreateFrame("Frame", "FreeUIMailFrame", Minimap)
mail:Hide()
mail:RegisterEvent("UPDATE_PENDING_MAIL")
mail:SetScript("OnEvent", function(self)
	if HasNewMail() then
		self:Show()
	else
		self:Hide()
	end
end)

MiniMapMailFrame:HookScript("OnMouseUp", function(self)
	self:Hide()
	mail:Hide()
end)

local mt = F.CreateFS(mail)
mt:SetText("|cfff6ff83Mail")
mt:SetPoint("BOTTOM", Minimap, 0, 35)

MiniMapMailFrame:SetAlpha(0)
MiniMapMailFrame:SetSize(22, 10)
MiniMapMailFrame:ClearAllPoints()
MiniMapMailFrame:SetPoint("CENTER", mt)

ZoneTextFrame:SetFrameStrata("MEDIUM")
SubZoneTextFrame:SetFrameStrata("MEDIUM")

ZoneTextString:ClearAllPoints()
ZoneTextString:SetPoint("CENTER", Minimap)
ZoneTextString:SetWidth(138)
F.SetFS(ZoneTextString)
F.SetFS(SubZoneTextString)
SubZoneTextString:SetWidth(138)
F.SetFS(PVPInfoTextString)
PVPInfoTextString:SetWidth(138)
F.SetFS(PVPArenaTextString)
PVPArenaTextString:SetWidth(138)

MinimapZoneTextButton:ClearAllPoints()
MinimapZoneTextButton:SetPoint("CENTER", Minimap)
MinimapZoneTextButton:SetFrameStrata("HIGH")
MinimapZoneTextButton:EnableMouse(false)
MinimapZoneTextButton:SetAlpha(0)
MinimapZoneText:SetPoint("CENTER", MinimapZoneTextButton)
F.SetFS(MinimapZoneText)
MinimapZoneText:SetShadowColor(0, 0, 0, 0)
MinimapZoneText:SetJustifyH("CENTER")

if locale == "zhCN" or locale == "zhTW" then
	ZoneTextString:SetFont(font, 14, "OUTLINE")
	SubZoneTextString:SetFont(font, 14, "OUTLINE")
	PVPInfoTextString:SetFont(font, 14, "OUTLINE")
	PVPArenaTextString:SetFont(font, 14, "OUTLINE")
	MinimapZoneText:SetFont(font, 14, "OUTLINE")
end

Minimap:HookScript("OnEnter", function()
	MinimapZoneTextButton:SetAlpha(1)
end)
Minimap:HookScript("OnLeave", function()
	MinimapZoneTextButton:SetAlpha(0)
end)

--MiniMapTracking
-- MiniMapTracking:SetParent(Minimap)
-- MiniMapTracking:SetScale(1)
-- MiniMapTracking:ClearAllPoints()
-- MiniMapTracking:SetPoint("TOPLEFT",Minimap,5,-5)
-- MiniMapTrackingButton:SetHighlightTexture (nil)
-- MiniMapTrackingButton:SetPushedTexture(nil)
-- MiniMapTrackingBackground:Hide()
-- MiniMapTrackingButtonBorder:Hide()

--MiniMapNorthTag
MinimapNorthTag:ClearAllPoints()
MinimapNorthTag:SetPoint("TOP",Minimap,0,-3)
MinimapNorthTag:SetAlpha(0)

--Blizzard_TimeManager
-- LoadAddOn("Blizzard_TimeManager")
-- TimeManagerClockButton:GetRegions():Hide()
-- TimeManagerClockButton:ClearAllPoints()
-- TimeManagerClockButton:SetPoint("BOTTOM",0,5)
-- TimeManagerClockTicker:SetFont(STANDARD_TEXT_FONT,12,"OUTLINE")
-- TimeManagerClockTicker:SetTextColor(0.8,0.8,0.6,1)

--GameTimeFrame
-- GameTimeFrame:SetParent(Minimap)
-- GameTimeFrame:SetScale(0.6)
-- GameTimeFrame:ClearAllPoints()
-- GameTimeFrame:SetPoint("TOPRIGHT",Minimap,-18,-18)
-- GameTimeFrame:SetHitRectInsets(0, 0, 0, 0)
-- GameTimeFrame:GetNormalTexture():SetTexCoord(0,1,0,1)
-- GameTimeFrame:SetNormalTexture(mediapath.."calendar")
-- GameTimeFrame:SetPushedTexture(nil)
-- GameTimeFrame:SetHighlightTexture (nil)
-- local fs = GameTimeFrame:GetFontString()
-- fs:ClearAllPoints()
-- fs:SetPoint("CENTER",0,-5)
-- fs:SetFont(STANDARD_TEXT_FONT,20)
-- fs:SetTextColor(0.2,0.2,0.1,0.9)

--zoom
Minimap:EnableMouseWheel()
local function Zoom(self, direction)
  if(direction > 0) then Minimap_ZoomIn()
  else Minimap_ZoomOut() end
end
Minimap:SetScript("OnMouseWheel", Zoom)

--onenter/show
-- local function Show()
--   GameTimeFrame:SetAlpha(0.9)
--   TimeManagerClockButton:SetAlpha(0.9)
--   MiniMapTracking:SetAlpha(0.9)
--   MiniMapChallengeMode:SetAlpha(0.9)
--   MiniMapInstanceDifficulty:SetAlpha(0.9)
--   GuildInstanceDifficulty:SetAlpha(0.9)
-- end
-- Minimap:SetScript("OnEnter", Show)

--onleave/hide
-- local lasttime = 0
-- local function Hide()
--   if Minimap:IsMouseOver() then return end
--   if time() == lasttime then return end
--   GameTimeFrame:SetAlpha(0)
--   TimeManagerClockButton:SetAlpha(0)
--   MiniMapTracking:SetAlpha(0)
--   MiniMapChallengeMode:SetAlpha(0)
--   MiniMapInstanceDifficulty:SetAlpha(0)
--   GuildInstanceDifficulty:SetAlpha(0)
-- end
-- local function SetTimer()
--   lasttime = time()
--   C_Timer.After(1.5, Hide)
-- end
-- Minimap:SetScript("OnLeave", SetTimer)
-- rLib:RegisterCallback("PLAYER_ENTERING_WORLD", Hide)
-- Hide(Minimap)


Minimap:SetArchBlobRingScalar(0)
Minimap:SetQuestBlobRingScalar(0)

GuildInstanceDifficulty:SetAlpha(0)
MiniMapChallengeMode:GetRegions():SetTexture("")

GameTimeFrame:ClearAllPoints()
GameTimeFrame:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", -1, -33)
GameTimeFrame:SetSize(16, 16)
GameTimeFrame:SetHitRectInsets(0, 0, 0, 0)
GameTimeFrame:SetNormalTexture("")
GameTimeFrame:SetPushedTexture("")
GameTimeFrame:SetHighlightTexture("")

local _, _, _, _, dateText = GameTimeFrame:GetRegions()
F.SetFS(dateText)
dateText:SetTextColor(80/255, 232/255, 255/255)
dateText:SetShadowOffset(0, 0)
dateText:SetPoint("CENTER")

QueueStatusMinimapButtonBorder:SetAlpha(0)
QueueStatusMinimapButton:ClearAllPoints()
QueueStatusMinimapButton:SetPoint("BOTTOMRIGHT", Minimap, 0, 34)
QueueStatusMinimapButton:SetHighlightTexture("")
QueueStatusMinimapButton.Eye.texture:SetTexture("")

QueueStatusFrame:ClearAllPoints()
QueueStatusFrame:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMLEFT", -4, 33)

local dots = {}
for i = 1, 8 do
	dots[i] = F.CreateFS(QueueStatusMinimapButton, C.FONT_SIZE_LARGE)
	dots[i]:SetText(".")
end
dots[1]:SetPoint("TOP", 2, 2)
dots[2]:SetPoint("TOPRIGHT", -6, -1)
dots[3]:SetPoint("RIGHT", -3, 2)
dots[4]:SetPoint("BOTTOMRIGHT", -6, 5)
dots[5]:SetPoint("BOTTOM", 2, 2)
dots[6]:SetPoint("BOTTOMLEFT", 9, 5)
dots[7]:SetPoint("LEFT", 6, 2)
dots[8]:SetPoint("TOPLEFT", 9, -1)

local counter = 0
local last = 0
local interval = .06
local diff = .014

local function onUpdate(self, elapsed)
	last = last + elapsed
	if last >= interval then
		counter = counter + 1

		dots[counter]:SetShown(not dots[counter]:IsShown())

		if counter == 8 then
			counter = 0
			diff = diff * -1
		end

		interval = interval + diff
		last = 0
	end
end

hooksecurefunc("EyeTemplate_StartAnimating", function(eye)
	eye:SetScript("OnUpdate", onUpdate)
end)

hooksecurefunc("EyeTemplate_StopAnimating", function(eye)
	for i = 1, 8 do
		dots[i]:Show()
	end
	counter = 0
	last = 0
	interval = .06
	diff = .014
end)

QueueStatusMinimapButton:HookScript("OnEnter", function()
	for i = 1, 8 do
		dots[i]:SetTextColor(r, g, b)
	end
end)

QueueStatusMinimapButton:HookScript("OnLeave", function()
	for i = 1, 8 do
		dots[i]:SetTextColor(1, 1, 1)
	end
end)

TicketStatusFrame:ClearAllPoints()
TicketStatusFrame:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -49, 0)

local rd = CreateFrame("Frame", nil, Minimap)
rd:SetSize(24, 8)
rd:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 5, -37)
rd:RegisterEvent("PLAYER_ENTERING_WORLD")
rd:RegisterEvent("PLAYER_DIFFICULTY_CHANGED")
rd:RegisterEvent("GUILD_PARTY_STATE_UPDATED")
rd:RegisterEvent("INSTANCE_GROUP_SIZE_CHANGED")

local rdt = F.CreateFS(rd, C.FONT_SIZE_NORMAL, "LEFT")
rdt:SetPoint("TOPLEFT")

local instanceTexts = {
	[0] = "",
	[1] = "5",
	[2] = "5H",
	[3] = "10",
	[4] = "25",
	[5] = "10H",
	[6] = "25H",
	[7] = "RF",
	[8] = "CM",
	[9] = "40",
	[11] = "3H",
	[12] = "3",
	[16] = "M",
	[23] = "5M",	-- Mythic 5-player
	[24] = "5T",	-- Timewalker 5-player
}

rd:SetScript("OnEvent", function()
	local inInstance, instanceType = IsInInstance()
	local _, _, difficultyID, _, maxPlayers, _, _, _, instanceGroupSize = GetInstanceInfo()

	if instanceTexts[difficultyID] ~= nil then
		rdt:SetText(instanceTexts[difficultyID])
	else
		if difficultyID == 14 then
			rdt:SetText(instanceGroupSize.."N")
		elseif difficultyID == 15 then
			rdt:SetText(instanceGroupSize.."H")
		elseif difficultyID == 17 then
			rdt:SetText(instanceGroupSize.."RF")
		else
			rdt:SetText("")
		end
	end

	rd:SetShown(inInstance and (instanceType == "party" or instanceType == "raid" or instanceType == "scenario"))

	if GuildInstanceDifficulty:IsShown() then
		rdt:SetTextColor(0, .9, 0)
	else
		rdt:SetTextColor(1, 1, 1)
	end
end)

HelpOpenTicketButtonTutorial:Hide()
HelpOpenTicketButtonTutorial.Show = F.dummy

local function positionTicketButtons()
	if HelpOpenTicketButton:IsShown() then
		if HelpOpenWebTicketButton:IsShown() then
			HelpOpenTicketButton:ClearAllPoints()
			HelpOpenTicketButton:SetPoint("TOP", Minimap, "TOP", -17, -5)
			HelpOpenWebTicketButton:ClearAllPoints()
			HelpOpenWebTicketButton:SetPoint("TOP", Minimap, "TOP", 17, -5)
		else
			HelpOpenTicketButton:ClearAllPoints()
			HelpOpenTicketButton:SetPoint("TOP", Minimap, "TOP", 0, -5)
		end
	elseif HelpOpenWebTicketButton:IsShown() then
		HelpOpenWebTicketButton:ClearAllPoints()
		HelpOpenWebTicketButton:SetPoint("TOP", Minimap, "TOP", 0, -5)
	end
end

for _, ticketButton in pairs({HelpOpenTicketButton, HelpOpenWebTicketButton}) do
	ticketButton:SetParent(Minimap)
	ticketButton:SetHeight(8)
	ticketButton:SetHitRectInsets(0, 0, 0, 0)
	ticketButton:ClearAllPoints()

	ticketButton:SetNormalTexture("")
	ticketButton:SetHighlightTexture("")
	ticketButton:SetPushedTexture("")

	local gmtext = F.CreateFS(ticketButton)
	gmtext:SetPoint("CENTER", 2, -33)
	gmtext:SetText(gsub(CHAT_FLAG_GM, "[<>]", "")) -- magic!

	ticketButton:HookScript("OnShow", positionTicketButtons)
	ticketButton:HookScript("OnHide", positionTicketButtons)
end


--drag frame
--rLib:CreateDragFrame(MinimapCluster, L.dragFrames, -2, true)

--create slash commands
--rLib:CreateSlashCmd(L.addonName, L.addonShortcut, L.dragFrames, L.addonColor)