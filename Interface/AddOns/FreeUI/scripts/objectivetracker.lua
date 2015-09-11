local F, C, L = unpack(select(2, ...))

if not C.general.objectivetracker then return end

local headFont = "Fonts\\lihei.ttf"
local headFontSize = 14
local headFontFlag = "OUTLINE"
local normalFont = "Fonts\\lihei.ttf"
local normalFontSize = 12
local normalFontFlag = "OUTLINE"

local vmheight = 750
local vmwidth = 300
local vm = ObjectiveTrackerFrame


vm:SetClampedToScreen(true)
vm:ClearAllPoints()
vm.ClearAllPoints = function() end
vm:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOM", 0, -50) 
vm.SetPoint = function() end
vm:SetMovable(true)
vm:SetUserPlaced(true)
vm:SetHeight(vmheight)
vm:SetWidth(vmwidth)

local vmmove = CreateFrame("FRAME", nil, vm)  
vmmove:SetHeight(16)
vmmove:SetPoint("TOPLEFT", vm, 0, 0)
vmmove:SetPoint("TOPRIGHT", vm)
vmmove:EnableMouse(true)
vmmove:RegisterForDrag("LeftButton")
vmmove:SetHitRectInsets(-5, -5, -5, -5)
   vmmove:SetScript("OnDragStart", function(self, button)
	if  button=="LeftButton" then
    	local f = self:GetParent()
    	f:StartMoving()
    end
end)

vmmove:SetScript("OnDragStop", function(self, button)
    local f = self:GetParent()
    f:StopMovingOrSizing()
end)




local function moveQuestObjectiveItems(self)
    local a = {self:GetPoint()}
        
    self:ClearAllPoints()
	self:SetPoint("TOPRIGHT", a[2], "TOPLEFT", -25, -6)
	self:SetFrameLevel(0)
end

local qitime = 0
local qiinterval = 1

hooksecurefunc("QuestObjectiveItem_OnUpdate", function(self, elapsed)
	qitime = qitime + elapsed
	
	if qitime > qiinterval then
    	moveQuestObjectiveItems(self)
    	qitime = 0
    end
end)



if IsAddOnLoaded("Blizzard_ObjectiveTracker") then
    hooksecurefunc("ObjectiveTracker_Update", function(reason, id)
        if vm.MODULES then  
            for i = 1, #vm.MODULES do                               
	            vm.MODULES[i].Header.Background:SetAtlas(nil)
	            vm.MODULES[i].Header.Text:SetFont(headFont or STANDARD_TEXT_FONT, headFontSize, headFontFlag)
	            vm.MODULES[i].Header.Text:ClearAllPoints()
	            vm.MODULES[i].Header.Text:SetPoint("Left", vm.MODULES[i].Header, 10, 0)
	            vm.MODULES[i].Header.Text:SetJustifyH("Left")
            end
        end
    end)
end




local r, g, b = 103/255, 103/255, 103/255
local class = select(2, UnitClass("player"))
local colour = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]

hooksecurefunc(QUEST_TRACKER_MODULE, "SetBlockHeader", function(_, block)
		block.HeaderText:SetFont(normalFont or STANDARD_TEXT_FONT, normalFontSize, normalFontFlag)
        block.HeaderText:SetShadowOffset(.7, -.7)
        block.HeaderText:SetShadowColor(0, 0, 0, 1)
        block.HeaderText:SetTextColor(colour.r, colour.g, colour.b)
        block.HeaderText:SetJustifyH("Left")
        block.HeaderText:SetWidth(vmwidth)
local heightcheck = block.HeaderText:GetNumLines()      
        if heightcheck==2 then
            local height = block:GetHeight()     
            block:SetHeight(height + 2)
        end
end)

local function hoverquest(_, block)
        block.HeaderText:SetTextColor(colour.r, colour.g, colour.b)
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
            block.HeaderText:SetFont(normalFont or STANDARD_TEXT_FONT, normalFontSize, normalFontFlag)
            block.HeaderText:SetShadowOffset(.7, -.7)
            block.HeaderText:SetShadowColor(0, 0, 0, 1)
            block.HeaderText:SetTextColor(colour.r, colour.g, colour.b)
            block.HeaderText:SetJustifyH("Left")
            block.HeaderText:SetWidth(vmwidth)
        end
    end
end)
  
local function hoverachieve(_, block)
        block.HeaderText:SetTextColor(colour.r, colour.g, colour.b)
    end
  
hooksecurefunc(ACHIEVEMENT_TRACKER_MODULE, "OnBlockHeaderEnter", hoverachieve)
hooksecurefunc(ACHIEVEMENT_TRACKER_MODULE, "OnBlockHeaderLeave", hoverachieve)

     

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
