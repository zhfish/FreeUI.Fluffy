local F, C, L = unpack(select(2, ...))

local class = select(2, UnitClass("player"))
local r, g, b = C.classcolours[class].r, C.classcolours[class].g, C.classcolours[class].b

if not C.general.objectivetracker then return end

local ot = ObjectiveTrackerFrame
local BlocksFrame = ot.BlocksFrame

-- [[ Positioning ]]

-- local function moveTracker()
-- 	ot:ClearAllPoints()
-- 	ot:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -30, -160)
-- 	ot:SetPoint("TOP", Minimap, "BOTTOM", 100, 0) -- bogus positioning because we can't touch ObjectiveTracker_CanFitBlock
-- end

-- hooksecurefunc(ot, "SetPoint", function(_, _, _, point)
-- 	if point == "BOTTOMRIGHT" then
-- 		moveTracker()
-- 	end
-- end)

-- hooksecurefunc(VehicleSeatIndicator, "SetPoint", function(_, _, anchor)
-- 	if anchor ~= Minimap then
-- 		VehicleSeatIndicator:ClearAllPoints()
-- 		VehicleSeatIndicator:SetPoint("BOTTOM", Minimap, "TOP", 0, 20)
-- 	end
-- end)

local frame = CreateFrame("Frame", "ObjectiveTrackerAnchor", UIParent)
frame:SetPoint("TOPLEFT", Minimap, "BOTTOMLEFT", -10, 0)
frame:SetHeight(150)
frame:SetWidth(224)

ObjectiveTrackerFrame:ClearAllPoints()
ObjectiveTrackerFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, 0)
ObjectiveTrackerFrame:SetHeight(600)

hooksecurefunc(ObjectiveTrackerFrame, "SetPoint", function(_, _, parent)
	if parent ~= frame then
		ObjectiveTrackerFrame:ClearAllPoints()
		ObjectiveTrackerFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, 0)
	end
end)

for _, headerName in pairs({"QuestHeader", "AchievementHeader", "ScenarioHeader"}) do
	ObjectiveTrackerFrame.BlocksFrame[headerName].Background:Hide()
end
BONUS_OBJECTIVE_TRACKER_MODULE.Header.Background:Hide()

ObjectiveTrackerFrame.HeaderMenu.Title:SetAlpha(0)
OBJECTIVE_TRACKER_DOUBLE_LINE_HEIGHT = 30

----------------------------------------------------------------------------------------
--	Difficulty color for ObjectiveTrackerFrame lines
----------------------------------------------------------------------------------------
hooksecurefunc(QUEST_TRACKER_MODULE, "Update", function()
	for i = 1, GetNumQuestWatches() do
		local questID, _, questIndex = GetQuestWatchInfo(i)
		if not questID then
			break
		end
		local _, level = GetQuestLogTitle(questIndex)
		local col = GetQuestDifficultyColor(level)
		local block = QUEST_TRACKER_MODULE:GetExistingBlock(questID)
		if block then
			block.HeaderText:SetTextColor(col.r, col.g, col.b)
			block.HeaderText.col = col
		end
	end
end)

hooksecurefunc(DEFAULT_OBJECTIVE_TRACKER_MODULE, "AddObjective", function(self, block)
	if block.module == ACHIEVEMENT_TRACKER_MODULE then
		block.HeaderText:SetTextColor(0.75, 0.61, 0)
		block.HeaderText.col = nil
	end
end)

hooksecurefunc("ObjectiveTrackerBlockHeader_OnLeave", function(self)
	local block = self:GetParent()
	if block.HeaderText.col then
		block.HeaderText:SetTextColor(block.HeaderText.col.r, block.HeaderText.col.g, block.HeaderText.col.b)
	end
end)


-- [[ Header ]]

-- Header

--F.SetFS(ot.HeaderMenu.Title)
ot.HeaderMenu.Title:SetFont(C.media.font2, 14, "OUTLINE")

-- Minimize button

local minimizeButton = ot.HeaderMenu.MinimizeButton

F.ReskinExpandOrCollapse(minimizeButton)
minimizeButton:SetSize(15, 15)
minimizeButton.plus:Hide()

hooksecurefunc("ObjectiveTracker_Collapse", function()
	minimizeButton.plus:Show()
	FreeUIConfig.objectiveTracker.collapsed = true
end)

hooksecurefunc("ObjectiveTracker_Expand", function()
	minimizeButton.plus:Hide()
	FreeUIConfig.objectiveTracker.collapsed = false
end)

-- [[ Blocks and lines ]]

for _, headerName in pairs({"QuestHeader", "AchievementHeader", "ScenarioHeader"}) do
	local header = BlocksFrame[headerName]

	header.Background:Hide()
--	F.SetFS(header.Text)
	header.Text:SetFont(C.media.font2, 14, "OUTLINE")
	header.Text:SetTextColor(r, g, b)
end

do
	local header = BONUS_OBJECTIVE_TRACKER_MODULE.Header

	header.Background:Hide()
--	F.SetFS(header.Text)
	header.Text:SetFont(C.media.font2, 14, "OUTLINE")
	header.Text:SetTextColor(r, g, b)
end

hooksecurefunc(DEFAULT_OBJECTIVE_TRACKER_MODULE, "SetBlockHeader", function(_, block)
	if not block.headerStyled then
--		F.SetFS(block.HeaderText)
		block.HeaderText:SetFont(C.media.font2, 14, "OUTLINE")
		block.HeaderText:SetTextColor(r, g, b)
		block.headerStyled = true
	end
end)

hooksecurefunc(QUEST_TRACKER_MODULE, "SetBlockHeader", function(_, block)
	if not block.headerStyled then
--		F.SetFS(block.HeaderText)
		block.HeaderText:SetFont(C.media.font2, 14, "OUTLINE")
		block.headerStyled = true
	end

	local itemButton = block.itemButton

	if itemButton and not itemButton.styled then
		itemButton:SetNormalTexture("")
		itemButton:SetPushedTexture("")

		itemButton.HotKey:ClearAllPoints()
		itemButton.HotKey:SetPoint("CENTER", itemButton, 1, 0)
		itemButton.HotKey:SetJustifyH("CENTER")
		F.SetFS(itemButton.HotKey)

		itemButton.Count:ClearAllPoints()
		itemButton.Count:SetPoint("TOP", itemButton, 2, -1)
		itemButton.Count:SetJustifyH("CENTER")
		F.SetFS(itemButton.Count)

		itemButton.icon:SetTexCoord(.08, .92, .08, .92)
		F.CreateBG(itemButton)

		itemButton.styled = true
	end
end)

hooksecurefunc(DEFAULT_OBJECTIVE_TRACKER_MODULE, "AddObjective", function(self, block)
	if block.module == QUEST_TRACKER_MODULE or block.module == ACHIEVEMENT_TRACKER_MODULE then
		local line = block.currentLine

		local p1, a, p2, x, y = line:GetPoint()
		line:SetPoint(p1, a, p2, x, y - 4)
	end
end)

local function fixBlockHeight(block)
	if block.shouldFix then
		local height = block:GetHeight()

		if block.lines then
			for _, line in pairs(block.lines) do
				if line:IsShown() then
					height = height + 4
				end
			end
		end

		block.shouldFix = false
		block:SetHeight(height + 5)
		block.shouldFix = true
	end
end

hooksecurefunc("ObjectiveTracker_AddBlock", function(block)
	if block.lines then
		for _, line in pairs(block.lines) do
			if not line.styled then
--				F.SetFS(line.Text)
				line.Text:SetFont(C.media.font2, 12, "OUTLINE")
				line.Text:SetSpacing(2)

				if line.Dash then
					F.SetFS(line.Dash)
				end

				line:SetHeight(line.Text:GetHeight())

				line.styled = true
			end
		end
	end

	if not block.styled then
		block.shouldFix = true
		hooksecurefunc(block, "SetHeight", fixBlockHeight)
		block.styled = true
	end
end)

-- [[ Bonus objective progress bar ]]

hooksecurefunc(BONUS_OBJECTIVE_TRACKER_MODULE, "AddProgressBar", function(self, block, line)
	local progressBar = line.ProgressBar
	local bar = progressBar.Bar
	local icon = bar.Icon

	if not progressBar.styled then
		local label = bar.Label

		bar.BarBG:Hide()

		icon:SetMask(nil)
		icon:SetDrawLayer("BACKGROUND", 1)
		icon:ClearAllPoints()
		icon:SetPoint("RIGHT", 35, 2)
		bar.newIconBg = F.ReskinIcon(icon)

		bar.BarFrame:Hide()

		bar:SetStatusBarTexture(C.media.backdrop)

		label:ClearAllPoints()
		label:SetPoint("CENTER")
--		F.SetFS(label)
		label:SetFont(C.media.font2, 12, "OUTLINE")

		local bg = F.CreateBDFrame(bar)
		bg:SetPoint("TOPLEFT", -1, 1)
		bg:SetPoint("BOTTOMRIGHT", 0, -2)

		progressBar.styled = true
	end

	bar.IconBG:Hide()
	bar.newIconBg:SetShown(icon:IsShown())
end)

--------------------------------------------------------------------------------------------------------
--                                QuestLevel hooked funcitons                                    --
--------------------------------------------------------------------------------------------------------

--title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(questLogIndex)

-- Hook gossip frame
function GossipFrameUpdate_hook()
	local buttonIndex = 1

	-- name, level, isTrivial, isDaily, isRepeatable, isLegendary, ... = GetGossipAvailableQuests()
	local availableQuests = {GetGossipAvailableQuests()}
	local numAvailableQuests = table.getn(availableQuests)
	for i=1, numAvailableQuests, 6 do
		local titleButton = _G["GossipTitleButton" .. buttonIndex]
		local title = "["..availableQuests[i+1].."] "..availableQuests[i]
		local isTrivial = availableQuests[i+2]
		if isTrivial then
			titleButton:SetFormattedText(TRIVIAL_QUEST_DISPLAY, title)
		else
			titleButton:SetFormattedText(NORMAL_QUEST_DISPLAY, title)
		end
		GossipResize(titleButton)
		buttonIndex = buttonIndex + 1
	end
	if numAvailableQuests > 1 then
		buttonIndex = buttonIndex + 1
	end

	-- name, level, isTrivial, isDaily, isLegendary, ... = GetGossipActiveQuests()
	local activeQuests = {GetGossipActiveQuests()}
	local numActiveQuests = table.getn(activeQuests)
	for i=1, numActiveQuests, 5 do
		local titleButton = _G["GossipTitleButton" .. buttonIndex]
		local title = ""..activeQuests[i+1]..". "..activeQuests[i]
		local isTrivial = activeQuests[i+2]
		if isTrivial then
			titleButton:SetFormattedText(TRIVIAL_QUEST_DISPLAY, title)
		else
			titleButton:SetFormattedText(NORMAL_QUEST_DISPLAY, title)
		end
		GossipResize(titleButton)
		buttonIndex = buttonIndex + 1
	end
end
hooksecurefunc("GossipFrameUpdate", GossipFrameUpdate_hook)

-- Hook objective tracker
function SetBlockHeader_hook()
	for i = 1, GetNumQuestWatches() do
		local questID, title, questLogIndex, numObjectives, requiredMoney, isComplete, startEvent, isAutoComplete, failureTime, timeElapsed, questType, isTask, isStory, isOnMap, hasLocalPOI = GetQuestWatchInfo(i)
		if ( not questID ) then
			break
		end
		local oldBlock = QUEST_TRACKER_MODULE:GetExistingBlock(questID)
		if oldBlock then
			local oldBlockHeight = oldBlock.height
			local oldHeight = QUEST_TRACKER_MODULE:SetStringText(oldBlock.HeaderText, title, nil, OBJECTIVE_TRACKER_COLOR["Header"])
			local newTitle = ""..select(2, GetQuestLogTitle(questLogIndex))..". "..title
			local newHeight = QUEST_TRACKER_MODULE:SetStringText(oldBlock.HeaderText, newTitle, nil, OBJECTIVE_TRACKER_COLOR["Header"])
			oldBlock:SetHeight(oldBlockHeight + newHeight - oldHeight);
		end
	end
end
hooksecurefunc(QUEST_TRACKER_MODULE, "Update", SetBlockHeader_hook)

-- Hook quest log on map
-- function QuestLogQuests_hook(self, poiTable)
-- 	local numEntries, numQuests = GetNumQuestLogEntries()
-- 	local headerIndex = 0
-- 	for questLogIndex = 1, numEntries do
-- 		local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(questLogIndex)
-- 		if isOnMap and not isTask and not isHeader then
-- 			headerIndex = headerIndex + 1
-- 			local button = QuestLogQuests_GetTitleButton(headerIndex)
-- 			local oldBlockHeight = button:GetHeight()
-- 			local oldHeight = button.Text:GetStringHeight()
-- 			local newTitle = ""..level..". "..button.Text:GetText()
-- 			button.Text:SetText(newTitle)
-- 			local newHeight = button.Text:GetStringHeight()
-- 			button:SetHeight(oldBlockHeight + newHeight - oldHeight)
-- 		end
-- 	end
-- end
-- hooksecurefunc("QuestLogQuests_Update", QuestLogQuests_hook)

-- Hook quest info
function QuestInfo_hook(template, parentFrame, acceptButton, material, mapView)
	local elementsTable = template.elements
	for i = 1, #elementsTable, 3 do
		if elementsTable[i] == QuestInfo_ShowTitle then
			if QuestInfoFrame.questLog then
				local questLogIndex = GetQuestLogSelection()
				local level = select(2, GetQuestLogTitle(questLogIndex))
				local newTitle = ""..level..". "..QuestInfoTitleHeader:GetText()
				QuestInfoTitleHeader:SetText(newTitle)
			end
		end
	end
end
hooksecurefunc("QuestInfo_Display", QuestInfo_hook)

-- [[ Init ]]

F.RegisterEvent("VARIABLES_LOADED", function()
	if not FreeUIConfig.objectiveTracker then FreeUIConfig.objectiveTracker = {} end

	if C.quests.rememberObjectiveTrackerState and (FreeUIConfig.objectiveTracker.collapsed or C.quests.alwaysCollapseObjectiveTracker) then
		ObjectiveTracker_Collapse()
	end
end)