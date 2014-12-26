-- Nephilist: Garrison
-- By lieandswell / Neph <Nephthys @ Hyjal-US>
-- Simple improvements to garrison interface


local HIDE_MISSION_COMPLETE_ALERTS = true;
local SKIP_ANIMATIONS = true;

-- Function for testing things
local function NephilistTest(stuff)
	if ( stuff ) then 
		DEFAULT_CHAT_FRAME:AddMessage("Test: "..stuff);
	else 
		DEFAULT_CHAT_FRAME:AddMessage("Test");
	end
end


---------------------------------------------------------------------------------
--- Mission List                                                              ---
---------------------------------------------------------------------------------

local THREAT_ICON_SIZE = 28;
local THREAT_ICON_SPACING = 10;

-- Function to compute time in seconds from "HH hr MM min SS sec" strings
local function GetSecondsLeft(timeLeft) 
	local secondsLeft = 0;
	local hrLeft,  _ = string.match(timeLeft, "(%d+)( hr)")
	local minLeft, _ = string.match(timeLeft, "(%d+)( min)")
	local secLeft, _ = string.match(timeLeft, "(%d+)( sec)")
	if ( hrLeft ) then
		secondsLeft = secondsLeft + 60 * 60 * tonumber(hrLeft);
	end
	if ( minLeft ) then
		secondsLeft = secondsLeft + 60 * tonumber(minLeft);
	end
	if ( secLeft ) then
		secondsLeft = secondsLeft + tonumber(secLeft);
	end
	return secondsLeft
end

-- Sort in-progress missions by time remaining
local function SortInProgressMissions(missionsList)
	if ( missionsList) then 
		local comparison = function(mission1, mission2)
			secondsLeft1 = GetSecondsLeft(mission1.timeLeft);
			secondsLeft2 = GetSecondsLeft(mission2.timeLeft);
			if ( secondsLeft1 ~= secondsLeft2 ) then
				return secondsLeft1 < secondsLeft2;
			end
			-- Default Blizzard sort below here, since timeLeft doesn't always include seconds
			if ( mission1.level ~= mission2.level ) then
				return mission1.level > mission2.level;
			end
			if ( mission1.level == GARRISON_FOLLOWER_MAX_LEVEL ) then
				if ( mission1.iLevel ~= mission2.iLevel ) then
					return mission1.iLevel > mission2.iLevel;
				end	
			end
			if ( mission1.durationSeconds ~= mission2.durationSeconds ) then
				return mission1.durationSeconds < mission2.durationSeconds;
			end
			if ( mission1.isRare ~= mission2.isRare ) then
				return mission1.isRare;
			end
			return strcmputf8i(mission1.name, mission2.name) < 0;
		end
		table.sort(missionsList, comparison);
	end
end
-- hooksecurefunc(C_Garrison, "GetInProgressMissions", SortInProgressMissions);

-- Show enemy threats in mission list, bonus xp on reward icon
local function ShowMissionThreats(self, rewards, numRewards) 

	-- self here is the mission button (GarrisonMissionListButtonTemplate)
	if ( not self.info.inProgress ) then

		local _, xp, _, _, _, _, _, enemies = C_Garrison.GetMissionInfo(self.info.missionID);
		local counters                      = C_Garrison.GetBuffedFollowersForMission(self.info.missionID)
		local followers                     = C_Garrison.GetFollowers();

		-- Frame to hold threat icons
		local nephilistThreats = self.NephilistThreatsFrame;
		if ( not nephilistThreats ) then
			nephilistThreats = CreateFrame("Frame", nil, self);
			nephilistThreats:SetPoint("CENTER", self, "RIGHT", -215, 0); 
			nephilistThreats:SetWidth(0);
			nephilistThreats:SetHeight(26);
			nephilistThreats.Threats = {};
			nephilistThreats.Threats[1] = CreateFrame("Frame", nil, nephilistThreats, "GarrisonMissionEnemyLargeMechanicTemplate");
			nephilistThreats.Threats[1]:SetPoint("LEFT");
			self.NephilistThreatsFrame = nephilistThreats;
		end

		-- Show mission threats
		local numThreats = 0;
		for i = 1, #enemies do
			local enemy = enemies[i];
			for id, mechanic in pairs(enemy.mechanics) do

				numThreats = numThreats + 1;
				local threatFrame = nephilistThreats.Threats[numThreats];
				if ( not threatFrame ) then
					threatFrame = CreateFrame("Frame", nil, nephilistThreats, "GarrisonMissionEnemyLargeMechanicTemplate");
					tinsert(nephilistThreats.Threats, threatFrame);
				end
				threatFrame.Icon:SetTexture(mechanic.icon);
				threatFrame:Show();

				-- Indicate counterable threats
				threatFrame.counterFound = false;
				if ( counters ) then
					for i = 1, #followers do
						local follower = followers[i];
						-- local status = C_Garrison.GetFollowerStatus(follower.followerID);
						-- Don't know why that doesn't work
						if ( follower.isCollected ) 
							and ( counters[follower.followerID] ) 
							and not ( C_Garrison.GetFollowerStatus(follower.followerID) == GARRISON_FOLLOWER_ON_MISSION ) 
							and not ( C_Garrison.GetFollowerStatus(follower.followerID) == GARRISON_FOLLOWER_INACTIVE )  
						then
							local counter = counters[follower.followerID];
							for k = 1, #counter do 
								if ( counter[k].name == mechanic.name ) then
									threatFrame.counterFound = true;
								end
							end
						end
					end 
				end
				if ( threatFrame.counterFound ) then 
					-- threatFrame.Check:Show();
					threatFrame:SetAlpha(1); 
					threatFrame.Icon:SetVertexColor(1, 1, 1); 
				else 
					-- threatFrame.Check:Hide();
					threatFrame:SetAlpha(0.4); 
					threatFrame.Icon:SetVertexColor(0.5, 0.5, 0.5); 
				end

			end
		end

		-- Hide icons that were made by previous missions in that button
		for i = numThreats + 1, #nephilistThreats.Threats do
			nephilistThreats.Threats[i]:Hide(); 
		end

		-- Arrange icons
		for i = 1, numThreats do 
			nephilistThreats.Threats[i]:ClearAllPoints();
		end
		if ( numThreats == 4 ) then
			nephilistThreats.Threats[1]:SetPoint("BOTTOMLEFT", nephilistThreats, "LEFT", 0,  THREAT_ICON_SPACING/2);
			nephilistThreats.Threats[2]:SetPoint("LEFT", nephilistThreats.Threats[1], "RIGHT", THREAT_ICON_SPACING, 0);
			nephilistThreats.Threats[3]:SetPoint("TOPLEFT", nephilistThreats.Threats[1], "BOTTOMLEFT", 0, -THREAT_ICON_SPACING/2);
			nephilistThreats.Threats[4]:SetPoint("LEFT", nephilistThreats.Threats[3], "RIGHT", THREAT_ICON_SPACING, 0);
			nephilistThreats:SetWidth(2 * (THREAT_ICON_SIZE + THREAT_ICON_SPACING));
			nephilistThreats:SetHeight(2 * (THREAT_ICON_SIZE + THREAT_ICON_SPACING));
		elseif ( numThreats > 4 ) then
			nephilistThreats.Threats[1]:SetPoint("BOTTOMLEFT", nephilistThreats, "LEFT", 0,  THREAT_ICON_SPACING/2);
			for i = 2, 3 do 
				nephilistThreats.Threats[i]:SetPoint("LEFT", nephilistThreats.Threats[i - 1], "RIGHT", THREAT_ICON_SPACING, 0);
			end
			if ( numThreats == 5 ) then
				nephilistThreats.Threats[4]:SetPoint("TOPRIGHT", nephilistThreats.Threats[2], "BOTTOM", -THREAT_ICON_SPACING/2, -THREAT_ICON_SPACING/2);
			else    -- max is 6 threats (so far)
				nephilistThreats.Threats[4]:SetPoint("TOPLEFT", nephilistThreats.Threats[1], "BOTTOMLEFT", 0, -THREAT_ICON_SPACING/2);
			end
			for i = 5, numThreats do 
				nephilistThreats.Threats[i]:SetPoint("LEFT", nephilistThreats.Threats[i - 1], "RIGHT", THREAT_ICON_SPACING, 0);
			end
			nephilistThreats:SetWidth(3 * (THREAT_ICON_SIZE + THREAT_ICON_SPACING));
			nephilistThreats:SetHeight(2 * (THREAT_ICON_SIZE + THREAT_ICON_SPACING));
		else
			nephilistThreats.Threats[1]:SetPoint("LEFT");
			for i = 2, numThreats do 
				nephilistThreats.Threats[i]:SetPoint("LEFT", nephilistThreats.Threats[i - 1], "RIGHT", THREAT_ICON_SPACING, 0);
			end
			nephilistThreats:SetWidth(numThreats * (THREAT_ICON_SIZE + THREAT_ICON_SPACING));
			nephilistThreats:SetHeight(THREAT_ICON_SIZE);
		end

		if ( numThreats > 0 ) then
			nephilistThreats:Show();
		else
			nephilistThreats:Hide();
		end

	else -- mission is in progress

		-- Hide threats for missions in progress
		if ( self.NephilistThreatsFrame ) then
			self.NephilistThreatsFrame:Hide();
		end	

	end

end
-- hooksecurefunc("GarrisonMissionButton_SetRewards", ShowMissionThreats);
-- Defined in Blizzard_GarrisonMissionUI.lua

-- Show bonus experience and item iLevel on reward icon
local function ShowRewardText(self, rewards, numRewards)
	local i = 1;
	for key, reward in pairs(rewards) do
		local button = self.Rewards[i]; 
		if ( reward.followerXP ) then
			button.Quantity:SetText(reward.followerXP);
			button.Quantity:Show();
		end
		if ( reward.itemID and (reward.quantity == 1) ) then
			local _, _, itemRarity, iLevel, _, _, _, _, _, itemTexture = GetItemInfo(reward.itemID)
			if ( iLevel and (iLevel > 1) ) then
				button.Quantity:SetText(ITEM_QUALITY_COLORS[itemRarity].hex.."i"..iLevel..FONT_COLOR_CODE_CLOSE);
				button.Quantity:Show();
			end
		end
		i = i + 1;
	end
end
-- hooksecurefunc("GarrisonMissionButton_SetRewards", ShowRewardText);
-- Defined in Blizzard_GarrisonMissionUI.lua

-- Show number of follower slots on mission button
local FOLLOWER_SLOT_ICON_SIZE = 32;
local FOLLOWER_SLOT_ICON_SPACING = -12;
local function ShowFollowerSlots(self, rewards, numRewards)

	-- self here is the mission button (GarrisonMissionListButtonTemplate)

	-- Frame to hold follower slot icons
	local followersFrame = self.NephilistFollowersFrame;
	if ( not followersFrame ) then
		-- Container frame
		followersFrame = CreateFrame("Frame", nil, self);
		followersFrame:SetPoint("CENTER", self, "LEFT", 105, 15); 
		followersFrame:SetWidth(0);
		followersFrame:SetHeight(FOLLOWER_SLOT_ICON_SIZE);
		followersFrame.Followers = {};
		self.NephilistFollowersFrame = followersFrame;

		-- Make first follower icon
		followersFrame.Followers[1] = CreateFrame("Frame", nil, followersFrame);
		local followerFrame = followersFrame.Followers[1];
		followerFrame:SetSize(FOLLOWER_SLOT_ICON_SIZE, FOLLOWER_SLOT_ICON_SIZE);
		followerFrame.texture = followerFrame:CreateTexture(nil, "ARTWORK");
		followerFrame.texture:SetAllPoints();
		followerFrame.texture:SetTexture("Interface\\FriendsFrame\\UI-Toast-FriendOnlineIcon");
		followerFrame.texture:SetVertexColor(0.75, 0.6, 0.4);
		followerFrame:SetPoint("LEFT");
	end

	local numFollowers = self.info.numFollowers;

	-- Icons for follower slots
	if numFollowers > 1 then 
		for i = 2, numFollowers do
			local followerFrame = followersFrame.Followers[i];
			if ( not followerFrame ) then
				followerFrame = CreateFrame("Frame", nil, followersFrame);
				followerFrame:SetSize(FOLLOWER_SLOT_ICON_SIZE, FOLLOWER_SLOT_ICON_SIZE);
				followerFrame.texture = followerFrame:CreateTexture(nil, "ARTWORK");
				followerFrame.texture:SetTexture("Interface\\FriendsFrame\\UI-Toast-FriendOnlineIcon");
				followerFrame.texture:SetAllPoints();
				followerFrame.texture:SetVertexColor(0.75, 0.6, 0.4);
				followerFrame:SetPoint("LEFT", followersFrame.Followers[i-1], "RIGHT", FOLLOWER_SLOT_ICON_SPACING, 0);
				tinsert(followersFrame.Followers, followerFrame);
			end
			followersFrame.Followers[i]:Show(); 
		end
	end

	-- Hide icons made by previous missions in that button
	for i = numFollowers + 1, #followersFrame.Followers do
		followersFrame.Followers[i]:Hide(); 
	end

	-- Size frame so icons will be properly centered
	followersFrame:SetWidth(
		numFollowers * (FOLLOWER_SLOT_ICON_SIZE + FOLLOWER_SLOT_ICON_SPACING) - FOLLOWER_SLOT_ICON_SPACING
	);
	followersFrame:Show();

	-- Icons are on top of the in-progress overlay, so fade them out instead
	if ( self.info.inProgress ) then
		followersFrame:SetAlpha(0.5);
	else
		followersFrame:SetAlpha(1);
	end

end
-- hooksecurefunc("GarrisonMissionButton_SetRewards", ShowFollowerSlots);
-- Defined in Blizzard_GarrisonMissionUI.lua

-- Hide gratuitous "(In Progress)" text from in-progress mission list (srsly wtf)
local function HideInProgressText()
	local self = GarrisonMissionFrame.MissionTab.MissionList;
	local missions;
	if ( self.showInProgress ) then
		missions = self.inProgressMissions;
	else
		missions = self.availableMissions;
	end
	local numMissions = #missions;
	local scrollFrame = self.listScroll;
	local offset      = HybridScrollFrame_GetOffset(scrollFrame);
	local buttons     = scrollFrame.buttons;
	local numButtons  = #buttons;
	for i = 1, numButtons do
		local button = buttons[i];
		local index  = offset + i; -- adjust index for scrolling
		if ( index <= numMissions ) then
			local mission = missions[index];
			if ( mission.inProgress ) then
				button.Summary:SetText("("..mission.timeLeft..")");
			end
		end
	end
end
-- hooksecurefunc("GarrisonMissionList_Update", HideInProgressText)
-- Defined in Blizzard_GarrisonMissionUI.lua

-- Remove redundant information from mission list tooltips
local function MakeNewMissionTooltips(self)
	-- self here is the mission button
	if ( self.info.inProgress ) then
		-- self:SetScript("OnEnter", GarrisonMissionButton_OnEnter); 
		self:SetScript("OnEnter", function(self)  
			GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT");
			if self.info.followers ~= nil then
				GameTooltip:AddLine(GARRISON_FOLLOWERS);
				for i=1, #(self.info.followers) do
					GameTooltip:AddLine(C_Garrison.GetFollowerName(self.info.followers[i]), 1, 1, 1);
				end
			end
			GameTooltip:Show();
		end)
	else
		self:SetScript("OnEnter", function() GameTooltip:Hide() end);
	end
end
-- hooksecurefunc("GarrisonMissionButton_SetRewards", MakeNewMissionTooltips);



---------------------------------------------------------------------------------
--- Follower List                                                             ---
---------------------------------------------------------------------------------

-- Show time remaining for followers on missions and XP gain if they're assigned to mission
local function ShowFollowerTimeRemainingAndXPGain(self) 
	-- self is GarrisonMissionFrameFollowers
	local followerFrame = self; 
	local followers     = followerFrame.FollowerList.followers;
	local followersList = followerFrame.FollowerList.followersList;
	local scrollFrame   = followerFrame.FollowerList.listScroll;
	local offset        = HybridScrollFrame_GetOffset(scrollFrame);
	local buttons       = scrollFrame.buttons;
	for i = 1, #buttons do
		local button = buttons[i];
		local index  = offset + i; -- adjust for scrolling
		if ( index <= #followersList ) then
			local follower = followers[followersList[index]];

			-- Show time left on mission
			if ( follower.status == GARRISON_FOLLOWER_ON_MISSION ) then
				for k, mission in pairs(C_Garrison.GetInProgressMissions()) do
					for i = 1, #mission.followers do
						if ( mission.followers[i] == follower.followerID ) then
							button.Status:SetFormattedText("%s", mission.timeLeft);
						end
					end
				end
			end

			-- Show XP gain from successfully completing mission
			local xpGainBar = button.XPGainBar; 
			if not ( xpGainBar ) then
				xpGainBar = button:CreateTexture(nil, "BACKGROUND", nil, 3);
				xpGainBar:SetWidth(GARRISON_FOLLOWER_LIST_BUTTON_FULL_XP_WIDTH); 
				xpGainBar:SetHeight(4); 
				xpGainBar:SetTexture("Interface\\TargetingFrame\\UI-StatusBar"); 
				xpGainBar:SetVertexColor(0.25, 0.25, 0.5); 
				xpGainBar:SetPoint("TOPLEFT", button.BG, "BOTTOMLEFT", 24, 6); 
				button.XPGainBar = xpGainBar;
			end
			local missionPage = GarrisonMissionFrame.MissionTab.MissionPage;
			local missionInfo = missionPage.missionInfo;
			if ( 
				missionPage:IsShown() and missionInfo and follower.xp 
				and not (follower.xp == 0) and not (follower.levelXP == 0) 
			) then
				local xpGained = 0;
				if ( missionPage.xp ) then
					xpGained = xpGained + missionPage.xp;
				end
				local _, _, _, _, _, _, xpBonus, _ = C_Garrison.GetPartyMissionInfo(missionInfo.missionID);
				if ( xpBonus ) then
					xpGained = xpGained + xpBonus;
				end
				for id, reward in pairs(missionInfo.rewards) do
					if ( reward.followerXP ) then
						xpGained = xpGained + reward.followerXP;
					end
				end
				if ( missionInfo.iLevel ) then 
					if not follower.iLevel then 
						xpGained = xpGained * 0.1;
					elseif ( follower.iLevel < missionInfo.iLevel ) then
						if ( follower.iLevel < (missionInfo.iLevel - 14) ) then
							xpGained = xpGained * 0.1;
						else
							xpGained = xpGained * 0.5;
						end
					end
				elseif ( follower.level < missionInfo.level ) then
					if ( follower.level < (missionInfo.level - 2) ) then
						xpGained = xpGained * 0.1;
					else
						xpGained = xpGained * 0.5;
					end
				end
				if ( (follower.xp + xpGained)/follower.levelXP < 1 ) then
					xpGainBar:SetWidth((follower.xp + xpGained)/follower.levelXP * GARRISON_FOLLOWER_LIST_BUTTON_FULL_XP_WIDTH);
				else
					xpGainBar:SetWidth(GARRISON_FOLLOWER_LIST_BUTTON_FULL_XP_WIDTH);
				end
				xpGainBar:Show();
			else
				xpGainBar:Hide();
			end

		end
	end
end
-- hooksecurefunc("GarrisonFollowerList_Update", ShowFollowerTimeRemainingAndXPGain)
-- Defined in Blizzard_GarrisonSharedTemplates.lua

-- Show follower counters even if they're working or away on a mission
local function ShowMoreCounters(button, follower, showCounters) 
	local numShown = 0;
	if ( showCounters and button.isCollected ) then
		-- if a mission is being viewed, show threats this follower can counter
		-- for followers you have, show counters if they are or could be on the mission
		local counters = GarrisonMissionFrame.followerCounters and GarrisonMissionFrame.followerCounters[follower.followerID];  -- This is the part changed
		if ( counters ) then
			for i = 1, #counters do
				if ( numShown == 4 ) then
					break;    -- max of 4 icons
				end			
				numShown = numShown + 1;
				GarrisonFollowerButton_SetCounterButton(button, numShown, counters[i]);
			end
		end
		local traits = GarrisonMissionFrame.followerTraits and GarrisonMissionFrame.followerTraits[follower.followerID];  -- This is the part changed
		if ( traits ) then
			for i = 1, #traits do
				if ( numShown == 4 ) then
					break;    -- max of 4 icons
				end
				numShown = numShown + 1;
				GarrisonFollowerButton_SetCounterButton(button, numShown, traits[i]);
			end
		end
	end
	if ( numShown == 1 or numShown == 2 ) then
		button.Counters[1]:SetPoint("TOPRIGHT", -8, -16);
	else
		button.Counters[1]:SetPoint("TOPRIGHT", -8, -4);
	end
	for i = numShown + 1, #button.Counters do
		button.Counters[i].info = nil;
		button.Counters[i]:Hide();
	end
end
-- hooksecurefunc("GarrisonFollowerButton_UpdateCounters", ShowMoreCounters)
-- Defined in Blizzard_GarrisonSharedTemplates.lua

-- Function for filtering follower list via click
local function FilterFollowers(filterText)
	local searchBox = GarrisonMissionFrameFollowers.SearchBox;
	searchBox:SetText(filterText);
	SearchBoxTemplate_OnTextChanged(searchBox);
	GarrisonFollowerList_UpdateFollowers(GarrisonMissionFrameFollowers);
	PlaySound("igMainMenuOptionCheckBoxOn");
end

-- Filter follower list by clicking enemy threat on mission page
local function FilterFollowersByClickingMechanic(enemies, numFollowers) 
	for i=1, #enemies do
		local Frame =  GarrisonMissionFrame.MissionTab.MissionPage.Enemies[i];
		if ( not Frame ) then
			break;
		end	
		local enemy = enemies[i];
		local numMechs = 0;
		for id, mechanic in pairs(enemy.mechanics) do
			numMechs = numMechs + 1;
			local mechanicFrame = Frame.Mechanics[numMechs];
			mechanicFrame:SetScript("OnMouseUp", function(self)
				FilterFollowers(self.info.name);
			end); 
		end
	end
end
-- hooksecurefunc("GarrisonMissionPage_SetEnemies", FilterFollowersByClickingMechanic);
-- Defined in Blizzard_GarrisonMissionUI.lua

-- Filter follower list by clicking ability, counter, or trait icon on follower page
local function FilterFollowersByClickingAbility(self, followerID)
		local followerInfo = C_Garrison.GetFollowerInfo(self.followerID);
		if ( followerInfo ) then
			if ( not followerInfo.abilities ) then
				followerInfo.abilities = C_Garrison.GetFollowerAbilities(followerID);
			end
			local numCounters = 0;
			for i=1, #followerInfo.abilities do
				local ability = followerInfo.abilities[i];
				-- Filter follower list by clicking ability or trait icon
				local abilityFrame = self.AbilitiesFrame.Abilities[i];
				if ( abilityFrame ) then
					if ( not abilityFrame.NephilistHooked ) then
						abilityFrame.NephilistHooked = true; 
						abilityFrame.IconButton:HookScript("OnClick", function(self)
							FilterFollowers(self:GetParent().Name:GetText());
						end);
					end
				end
				-- Filter follower list by clicking "Counters:" icon
				if ( ability.counters and not ability.isTrait and not self.isLandingPage ) then
					for id, counter in pairs(ability.counters) do
						numCounters = numCounters + 1;
						local counterFrame = self.AbilitiesFrame.Counters[numCounters];
						counterFrame:SetScript("OnMouseUp", function(self)
							FilterFollowers(self.info.name);
						end); 
					end
				end
			end
		end
end
-- hooksecurefunc("GarrisonFollowerPage_ShowFollower", FilterFollowersByClickingAbility); 
-- Defined in Blizzard_GarrisonSharedTemplates.lua

-- Filter follower list by clicking counter icon in follower list
--[[
hooksecurefunc("GarrisonFollowerButton_SetCounterButton", function(button, index, info)
	-- GarrisonFollowerButton_SetCounterButton defined in Blizzard_GarrisonSharedTemplates.lua
	local counter = button.Counters[index];
	if ( counter ) then
		counter:SetScript("OnMouseUp", function(self)
			if ( not counter.info.traitID ) then 
				FilterFollowers(self.info.name)
			else
				-- trait icons aren't given a .name?
			end
		end); 
	end
end)
--]]

local function FilterFollowersByClickingEnvironment(missionInfo) 
	local missionPage = GarrisonMissionFrame.MissionTab.MissionPage;
	local environmentIcon = missionPage.Stage.MissionEnvIcon;
	environmentIcon:SetScript("OnMouseUp", function()
		FilterFollowers(missionPage.environment);
	end);
end
-- hooksecurefunc("GarrisonMissionPage_ShowMission", FilterFollowersByClickingEnvironment); 


---------------------------------------------------------------------------------
--- Redirect mission alerts to chat instead of that pop-up window             ---
--- that sits right on top of the "Next" button (srsly wtf)                   ---
---------------------------------------------------------------------------------

local function HideMissionAlert(missionID)
	local missionInfo = C_Garrison.GetBasicMissionInfo(missionID);
	local alertFrame = GarrisonMissionAlertFrame;
	alertFrame.animIn:Stop();
	alertFrame:Hide();
	DEFAULT_CHAT_FRAME:AddMessage("Garrison mission complete: "..missionInfo.name, 1.0, 1, 0, 10);
end


---------------------------------------------------------------------------------
--- Skip animations                                                           ---
---------------------------------------------------------------------------------

-- Skip combat animations for completed mission
local function SkipCombatAnimations(self, missionID, canComplete, succeeded)
	-- self here is GarrisonMissionFrame.MissionComplete
	self.Stage.EncountersFrame.FadeOut:Play(); 
	self.animIndex = GarrisonMissionComplete_FindAnimIndexFor(GarrisonMissionComplete_AnimRewards) - 1;
	self.animTimeLeft = 0;
end

-- Auto-open the reward chest when ClickFrame gets shown
local function SkipChestAnimations()
	GarrisonMissionFrame.MissionComplete.NextMissionButton:Enable();
	if ( C_Garrison.CanOpenMissionChest(GarrisonMissionFrame.MissionComplete.currentMission.missionID) ) then
		-- self here is GarrisonMissionFrame.MissionComplete.BonusRewards.ChestModel.ClickFrame
		GarrisonMissionFrame.MissionComplete.BonusRewards.ChestModel.ClickFrame:Hide();    
		local bonusRewards = GarrisonMissionFrame.MissionComplete.BonusRewards;
		bonusRewards.waitForEvent = false;
		bonusRewards.waitForTimer = false;   -- Default UI is true
		bonusRewards.success = false;
		bonusRewards:RegisterEvent("GARRISON_MISSION_BONUS_ROLL_COMPLETE");
		bonusRewards.ChestModel:SetAnimation(154);
		bonusRewards.ChestModel.OpenAnim:Play();
		C_Timer.After(0.1, GarrisonMissionComplete_OnRewardTimer); -- changed from 1.1 sec
		C_Garrison.MissionBonusRoll(GarrisonMissionFrame.MissionComplete.currentMission.missionID);
		PlaySound("UI_Garrison_CommandTable_ChestUnlock_Gold_Success");
		GarrisonMissionFrame.MissionComplete.NextMissionButton:Disable();
	end
end


---------------------------------------------------------------------------------
--- Executive frame                                                           ---
---------------------------------------------------------------------------------

local function NephilistGarrison_OnEvent(self, event, arg1)

	if ( arg1 == "NephilistGarrison" and not self.alertFrameHooked ) then

		if ( HIDE_MISSION_COMPLETE_ALERTS ) then
			hooksecurefunc("GarrisonMissionAlertFrame_ShowAlert", HideMissionAlert);
		end
		self.alertFrameHooked = true;

	elseif ( arg1 == "Blizzard_GarrisonUI" ) then

		hooksecurefunc("GarrisonMissionList_Update", HideInProgressText); 
		hooksecurefunc(C_Garrison, "GetInProgressMissions", SortInProgressMissions);
		hooksecurefunc("GarrisonMissionButton_SetRewards", ShowMissionThreats);
		hooksecurefunc("GarrisonMissionButton_SetRewards", ShowRewardText);
		hooksecurefunc("GarrisonMissionButton_SetRewards", ShowFollowerSlots);
		hooksecurefunc("GarrisonMissionButton_SetRewards", MakeNewMissionTooltips);

		hooksecurefunc("GarrisonFollowerList_Update", ShowFollowerTimeRemainingAndXPGain); 
		hooksecurefunc("GarrisonFollowerButton_UpdateCounters", ShowMoreCounters); 
		hooksecurefunc("GarrisonMissionPage_SetEnemies", FilterFollowersByClickingMechanic);
		hooksecurefunc("GarrisonMissionPage_ShowMission", FilterFollowersByClickingEnvironment); 
		hooksecurefunc("GarrisonFollowerPage_ShowFollower", FilterFollowersByClickingAbility); 

		if ( SKIP_ANIMATIONS ) then
			hooksecurefunc("GarrisonMissionComplete_OnMissionCompleteResponse", SkipCombatAnimations);
			-- GarrisonMissionFrame.MissionComplete.BonusRewards.ChestModel.ClickFrame:SetScript("OnShow", GarrisonMissionCompleteChest_OnMouseDown);
			GarrisonMissionFrame.MissionComplete.BonusRewards.ChestModel.ClickFrame:SetScript("OnShow", SkipChestAnimations);
		end

		self:UnregisterEvent("ADDON_LOADED");

	end

end

local nephilistFrame = CreateFrame("Frame", "NephilistGarrison", UIParent); 
nephilistFrame.alertFrameHooked = false;
nephilistFrame:RegisterEvent("ADDON_LOADED");
nephilistFrame:SetScript("OnEvent", NephilistGarrison_OnEvent);

