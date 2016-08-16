
	local _, class = UnitClass'player'
	local color = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
	local font  = [[Interface\AddOns\Lyn\assets\bigfont.ttf]]
	
	-- shape
	MinimapCluster:ClearAllPoints()
	MinimapCluster:SetPoint('TOPRIGHT', UIParent, 'TOPRIGHT', -20, 0)
	MinimapCluster:EnableMouse(false)
	MinimapCluster:SetClampedToScreen(false)
	MinimapCluster:SetSize(256,256)
	Minimap:SetClampedToScreen(false)	
	Minimap:SetSize(256, 256)
	Minimap:SetMaskTexture[[Interface\AddOns\LynMinimap\assets\rectangle]]
	Minimap:SetHitRectInsets(0, 0, 24, 24)
	Minimap:ClearAllPoints()
	Minimap:SetAllPoints(MinimapCluster)
	--Minimap:SetPoint('BOTTOMRIGHT', UIParent, 'BOTTOMRIGHT', -50, 59)
	Minimap:SetFrameLevel(2)
	
	local bg = CreateFrame('Frame', nil, Minimap)
	bg:SetPoint('TOPLEFT', Minimap, 0, -26)
	bg:SetPoint('BOTTOMRIGHT', Minimap, 0, 26)
	bg:SetBackdrop({
		bgFile = [[Interface/Buttons/WHITE8X8]],
		tiled = false,
		insets = {left = -1, right = -1, top = -1, bottom = -1}
	})
	bg:SetBackdropColor(0, 0, 0, 1)
	bg:SetFrameLevel(0)
	
	local trans = CreateFrame('Frame', nil, Minimap)
	trans:SetBackdrop({
			bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],
			tiled = false,
			insets = {left = -3, right = -3, top = -3, bottom = -3}
	})
	trans:SetPoint('TOPLEFT', Minimap, 0, -26)
	trans:SetPoint('BOTTOMRIGHT', Minimap, 0, 26)
	trans:SetFrameLevel(0)
	trans:SetFrameStrata('BACKGROUND')
	trans:SetBackdropColor(0, 0, 0, 0.6)
	
	function GetMinimapShape() return 'SQUARE' end
	
	-- on click mechanic
	Minimap:SetScript('OnMouseUp', function(self, button)
		Minimap:StopMovingOrSizing()
	    if button == 'RightButton' then
	        ToggleDropDownMenu(1, nil, MiniMapTrackingDropDown, self, - (Minimap:GetWidth() * .7), -3)
	    elseif button == 'MiddleButton' then
	        securecall(ToggleCalendar)
	    else
	        Minimap_OnClick(self)
	    end
	end)
	
	-- scrolling zoom
	Minimap:EnableMouseWheel(true)
	Minimap:SetScript('OnMouseWheel', function(self, arg1)
		if arg1 > 0 then Minimap_ZoomIn() else Minimap_ZoomOut() end
	end)
	
	-- hide specific stuff
	MinimapBackdrop:Hide()
	MinimapBorder:Hide()
	MinimapBorderTop:Hide()
	MinimapZoomIn:Hide()
	MinimapZoomOut:Hide()
	MiniMapVoiceChatFrame:Hide()
	GameTimeFrame:Hide()
	MinimapZoneTextButton:Hide()
	MiniMapTracking:Hide()
	MiniMapMailBorder:Hide()
	MinimapNorthTag:SetAlpha(0)
	--MiniMapInstanceDifficulty:SetAlpha(0)
	--GuildInstanceDifficulty:SetAlpha(0)
	Minimap:SetArchBlobRingScalar(0)
	Minimap:SetArchBlobRingAlpha(0)
	Minimap:SetQuestBlobRingScalar(0)
	Minimap:SetQuestBlobRingAlpha(0)
	--GarrisonLandingPageMinimapButton:Hide()
	
	LoadAddOn'Blizzard_TimeManager'
	local region = TimeManagerClockButton:GetRegions()
	region:Hide()
	TimeManagerClockButton:Hide()
	
	-- garrison/orderhall
	GarrisonLandingPageMinimapButton:ClearAllPoints()
	GarrisonLandingPageMinimapButton:SetParent(Minimap)
	GarrisonLandingPageMinimapButton:SetPoint('TOPRIGHT', Minimap, -3, -30)
	GarrisonLandingPageMinimapButton:SetSize(36, 36)
	hooksecurefunc('GarrisonLandingPageMinimapButton_UpdateIcon', function(self)
		self:SetNormalTexture('')
		self:SetPushedTexture('')
		self:SetHighlightTexture('')
		
		local icon = self:CreateTexture(nil,'OVERLAY',nil,7)
		icon:SetSize(24, 24)
		icon:SetPoint('CENTER')
		icon:SetTexture([[Interface/AddOns/LynMinimap/assets/garrison2]])
		icon:SetVertexColor(1, 1, 1)
		self.icon = icon
		
		if (C_Garrison.GetLandingPageGarrisonType() == LE_GARRISON_TYPE_6_0) then
			self.title = GARRISON_LANDING_PAGE_TITLE;
			self.description = MINIMAP_GARRISON_LANDING_PAGE_TOOLTIP;
		else
			self.title = ORDER_HALL_LANDING_PAGE_TITLE;
			self.description = MINIMAP_ORDER_HALL_LANDING_PAGE_TOOLTIP;
		end
	end)
	
	GarrisonLandingPageMinimapButton:SetScript('OnEnter', function(self) 
		--self.icon:SetVertexColor(color.r, color.g, color.b)
		self.icon:SetVertexColor(1, .8, 0)
	end)
	
	GarrisonLandingPageMinimapButton:SetScript('OnLeave', function(self) 
		self.icon:SetVertexColor(1, 1, 1)
	end)
    --[[
	GarrisonLandingPageMinimapButton:SetScript('OnMouseDown', function(self) 
		self.icon:SetVertexColor(0, 1, 1)
	end)
					
	GarrisonLandingPageMinimapButton:SetScript('OnMouseUp', function(self) 
		self.icon:SetVertexColor(1, .8, 0)
	end)
	]]			
	GarrisonMinimapBuilding_ShowPulse = function() end
	
	
	-- difficulty
	MiniMapInstanceDifficulty:ClearAllPoints()
	MiniMapInstanceDifficulty:SetPoint('TOPLEFT', Minimap, 3, -30)
	GuildInstanceDifficulty:ClearAllPoints()
	GuildInstanceDifficulty:SetPoint('TOPLEFT', Minimap, 3, -30)
	MiniMapChallengeMode:ClearAllPoints()
	MiniMapChallengeMode:SetPoint('TOPLEFT', Minimap, 3, -30)
	
	-- lfg/lfr/pvp
	local lfg = MiniMapLFGFrame or QueueStatusMinimapButton
	lfg:SetScale(.9)
	lfg:ClearAllPoints()
	lfg:SetParent(Minimap)
	lfg:SetFrameStrata'HIGH'
	lfg:SetPoint('BOTTOMLEFT', Minimap, 3, 30)
	lfg:SetHighlightTexture(nil)
	QueueStatusMinimapButtonBorder:SetTexture(nil)
	--QueueStatusMinimapButtonBorder:SetPoint("TOPLEFT", lfg, "TOPLEFT", -4, 4)
	--QueueStatusMinimapButtonBorder:SetPoint("BOTTOMRIGHT", lfg, "BOTTOMRIGHT", 4, -4)
	--QueueStatusMinimapButtonBorder:SetVertexColor(0, 0, 0, 1)
	
	-- mail
	MiniMapMailFrame:ClearAllPoints()
	MiniMapMailFrame:SetParent(Minimap)
	MiniMapMailFrame:SetFrameStrata'HIGH'
	MiniMapMailFrame:SetPoint('BOTTOMRIGHT', Minimap, -5, 25)
	MiniMapMailIcon:ClearAllPoints()
	MiniMapMailIcon:SetTexCoord(.1, .9, .1, .9)
	MiniMapMailIcon:SetTexture([[Interface\AddOns\LynMinimap\assets\mail]])
	MiniMapMailIcon:SetPoint("TOPLEFT", MiniMapMailFrame, "TOPLEFT", 8, -8)
	MiniMapMailIcon:SetPoint("BOTTOMRIGHT", MiniMapMailFrame, "BOTTOMRIGHT", -8, 8)

	-- durability
	--[[
	DurabilityFrame:Hide()
	DurabilityFrame:UnregisterAllEvents()
	DurabilityFrame.Show = function() end
	]]
	
	hooksecurefunc(DurabilityFrame, 'SetPoint', function(self, _, parent)
	    if parent=='MinimapCluster' or parent==_G['MinimapCluster'] then
	        self:ClearAllPoints()
			self:SetPoint('RIGHT', Minimap, 'LEFT', -50, -250)
			self:SetScale(.7)
		end
	end)
	
	
	-- VEHICLE SEAT INDICATOR
	hooksecurefunc(VehicleSeatIndicator,'SetPoint', function(self, _, parent)
	    if parent=='MinimapCluster' or parent==_G['MinimapCluster'] then
		    self:ClearAllPoints()
		    self:SetPoint('RIGHT', Minimap, 'LEFT', -50, -250)
		    self:SetScale(.7)
	    end
	end)
	
	-- world capture bar
	hooksecurefunc('UIParent_ManageFramePositions', function()
	    if NUM_EXTENDED_UI_FRAMES then
	        for i = 1, NUM_EXTENDED_UI_FRAMES do
	            local bar = _G['WorldStateCaptureBar'..i]
	            if bar and bar:IsVisible() then
	                bar:ClearAllPoints()
	                if i == 1 then
	                    bar:SetPoint('BOTTOM', MinimapCluster, 'TOP', 0, 30)
	                else
	                    bar:SetPoint('BOTTOM', _G['WorldStateCaptureBar'..(i - 1)], 'TOP', 0, 20)
	                end
	            end
	        end
	    end
	end)
	
	
	