local F, C, L = unpack(select(2, ...))

local class = select(2, UnitClass("player"))
local r, g, b = C.classcolours[class].r, C.classcolours[class].g, C.classcolours[class].b

if not C.general.objectivetracker then return end

local ot = ObjectiveTrackerFrame
local BlocksFrame = ot.BlocksFrame


local otMover_Frame = CreateFrame("Frame", "otMoverFrame", UIParent)
	--otMover_Frame:SetBackdrop(GameTooltip:GetBackdrop())
	--otMover_Frame:SetBackdropColor(GameTooltip:GetBackdropColor())
	otMover_Frame:SetWidth(262)
	otMover_Frame:SetHeight(26)
	otMover_Frame:SetScale(1)
	otMover_Frame:SetPoint("CENTER",0,0)
	otMover_Frame:SetClampedToScreen(true)
	otMover_Frame:EnableMouse(true)
	otMover_Frame:SetMovable(true)
	otMover_Frame:SetUserPlaced(true)

	local otMover_Tex = otMover_Frame:CreateTexture()
	otMover_Tex:SetAllPoints()
	otMover_Tex:SetTexture(0,0,0,.3)
--	otMover_Tex:SetGradientAlpha("HORIZONTAL",0,0,0,0,1,1,1,.8)

	otMover_Frame:RegisterEvent("ADDON_LOADED")
	otMover_Frame:RegisterEvent("PLAYER_LOGIN")
	otMover_Frame:RegisterEvent("PLAYER_REGEN_DISABLED")
	otMover_Frame:RegisterEvent("PLAYER_REGEN_ENABLED")
	otMover_Frame:RegisterEvent("QUEST_WATCH_LIST_CHANGED")
	otMover_Frame:RegisterEvent("TRACKED_ACHIEVEMENT_LIST_CHANGED")

	otMover_Frame:SetScript("OnMouseDown",
		function(self, button)
			self:StartMoving()
		end
	)

	otMover_Frame:SetScript("OnMouseUp",
		function(self, button)
			self:StopMovingOrSizing()
		end
	)

	otMover_Frame:SetScript("OnUpdate", 
		function(self, t)
			if(ObjectiveTrackerFrame.collapsed) then
				otMover_Frame:SetWidth(92)
			else otMover_Frame:SetWidth(262) end
		end
	)

	local function otMover_SetPoint(self,...)
		ObjectiveTrackerFrame:SetParent(otMover_Frame)
		ObjectiveTrackerFrame:SetPoint("TOPLEFT", 30,-1)
		ObjectiveTrackerFrame.HeaderMenu.MinimizeButton:SetPoint("TOPRIGHT", otMover_Frame, "TOPRIGHT", -2 ,-5)
	end

	local function GetChildNames(ui_obj, ...)
		for x=1, ui_obj:GetNumChildren() do
			local child = select(x, ...)
			print(child:GetName())
		end
	end

	local function otMover_OnEvent(self, event, ...)
			
		if(event == "PLAYER_LOGIN") then
			hooksecurefunc(ObjectiveTrackerFrame, "SetPoint", otMover_SetPoint) 
			--GetChildNames(Minimap, Minimap:GetChildren())
		end
		
		if(event == "PLAYER_REGEN_DISABLED") then
			otMover_Frame:Hide()
		end	

		if(event == "PLAYER_REGEN_ENABLED") then
			otMover_Frame:Show()
		end	

		if(event == "QUEST_WATCH_LIST_CHANGED" or event == "TRACKED_ACHIEVEMENT_LIST_CHANGED") then
			if(GetNumQuestWatches() > 0 or GetNumTrackedAchievements() > 0 or GetNumAutoQuestPopUps() > 0) then 
				otMover_Frame:Show()
			else otMover_Frame:Hide() end
		end
		--TRACKED_ACHIEVEMENT_LIST_CHANGED
	end

	otMover_Frame:SetScript("OnEvent", otMover_OnEvent)


-- [[ Header ]]

-- Header

F.SetFS(ot.HeaderMenu.Title)

-- Minimize button

local minimizeButton = ot.HeaderMenu.MinimizeButton

F.ReskinExpandOrCollapse(minimizeButton)
minimizeButton:SetSize(15, 15)
minimizeButton.plus:Hide()

hooksecurefunc("ObjectiveTracker_Collapse", function()
	minimizeButton.plus:Show()
end)
hooksecurefunc("ObjectiveTracker_Expand", function()
	minimizeButton.plus:Hide()
end)

-- [[ Blocks and lines ]]

for _, headerName in pairs({"QuestHeader", "AchievementHeader", "ScenarioHeader"}) do
	local header = BlocksFrame[headerName]

	header.Background:Hide()
	F.SetFS(header.Text)
	header.Text:SetTextColor(.4,.6,.9)	-- header
end

do
	local header = BONUS_OBJECTIVE_TRACKER_MODULE.Header

	header.Background:Hide()
	F.SetFS(header.Text)
	header.Text:SetTextColor(1,0,0)	-- bonus objectives header
end

hooksecurefunc(DEFAULT_OBJECTIVE_TRACKER_MODULE, "SetBlockHeader", function(_, block)
	if not block.headerStyled then
		F.SetFS(block.HeaderText)
		block.HeaderText:SetTextColor(r,g,b)	-- achievement header
		block.headerStyled = true
	end
end)

hooksecurefunc(QUEST_TRACKER_MODULE, "SetBlockHeader", function(_, block)
	if not block.headerStyled then
		F.SetFS(block.HeaderText)
		block.HeaderText:SetTextColor(r,g,b)	-- quest lines header
		block.headerStyled = true
	end

	local itemButton = block.itemButton

	if itemButton and not itemButton.styled then
		itemButton:SetNormalTexture("")
		itemButton:SetPushedTexture("")

		itemButton.HotKey:ClearAllPoints()
		itemButton.HotKey:SetPoint("TOP", itemButton, -1, 0)
		itemButton.HotKey:SetJustifyH("CENTER")
		F.SetFS(itemButton.HotKey)

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
				F.SetFS(line.Text)
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

	if not progressBar.styled then
		local bar = progressBar.Bar
		local label = bar.Label
		local icon = bar.Icon

		bar.BarFrame:Hide()
		bar.BarBG:Hide()
		bar.IconBG:Hide()

		if icon:IsShown() then
			icon:SetMask(nil)
			icon:SetDrawLayer("BACKGROUND", 1)
			icon:ClearAllPoints()
			icon:SetPoint("RIGHT", 35, 2)
			S:ReskinIcon(icon)
		end
		
		bar:SetStatusBarTexture(R["media"].gloss)

		label:ClearAllPoints()
		label:SetPoint("CENTER", 0, -1)
		label:FontTemplate(nil, nil, "OUTLINE")

		local bg = S:CreateBDFrame(bar)
		bg:Point("TOPLEFT", -1, 1)
		bg:Point("BOTTOMRIGHT", 0, -2)

		progressBar.styled = true
	end

	progressBar.Bar:SetValue(50)
end)



--------------------------------------------------------------------------------------------------------
--                                    QuestLevel variables                                       --
--------------------------------------------------------------------------------------------------------
local QuestLevelPatch = {}

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
function QuestLogQuests_hook(self, poiTable)
	local numEntries, numQuests = GetNumQuestLogEntries()
	local headerIndex = 0
	for questLogIndex = 1, numEntries do
		local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(questLogIndex)
		if isOnMap and not isTask and not isHeader then
			headerIndex = headerIndex + 1
			local button = QuestLogQuests_GetTitleButton(headerIndex)
			local oldBlockHeight = button:GetHeight()
			local oldHeight = button.Text:GetStringHeight()
			local newTitle = ""..level..". "..button.Text:GetText()
			button.Text:SetText(newTitle)
			local newHeight = button.Text:GetStringHeight()
			button:SetHeight(oldBlockHeight + newHeight - oldHeight)
		end
	end
end
hooksecurefunc("QuestLogQuests_Update", QuestLogQuests_hook)

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




-- more color


hooksecurefunc(QUEST_TRACKER_MODULE, "SetBlockHeader", function(_, block)
	block.HeaderText:SetTextColor(r, g, b)
end)

local function hoverquest(_, block)
	block.HeaderText:SetTextColor(r, g, b)
end

hooksecurefunc(QUEST_TRACKER_MODULE, "OnBlockHeaderEnter", hoverquest)  
hooksecurefunc(QUEST_TRACKER_MODULE, "OnBlockHeaderLeave", hoverquest)


hooksecurefunc(ACHIEVEMENT_TRACKER_MODULE, "SetBlockHeader", function(_, block)
	local trackedAchievements = {GetTrackedAchievements()}
    
    for i = 1, #trackedAchievements do
	    local achieveID = trackedAchievements[i]
	    local _, achievementName, _, completed, _, _, _, description, _, icon, _, _, wasEarnedByMe = GetAchievementInfo(achieveID)
        local showAchievement = true
        
	    if wasEarnedByMe then
		    showAchievement = false
	    elseif displayOnlyArena then
		    if GetAchievementCategory(achieveID)~=ARENA_CATEGORY then
			    showAchievement = false
		    end
	    end
	    
        if showAchievement then

            block.HeaderText:SetTextColor(r, g, b)

        end
    end
end)
  
local function hoverachieve(_, block)
	block.HeaderText:SetTextColor(r, g, b)
end
  
hooksecurefunc(ACHIEVEMENT_TRACKER_MODULE, "OnBlockHeaderEnter", hoverachieve)
hooksecurefunc(ACHIEVEMENT_TRACKER_MODULE, "OnBlockHeaderLeave", hoverachieve)