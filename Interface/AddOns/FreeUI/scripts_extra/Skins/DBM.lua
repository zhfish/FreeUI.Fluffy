local F, C, L = unpack(FreeUI)

if not IsAddOnLoaded("DBM-Core") then return end

local function InitStyle()
	hooksecurefunc(DBT, "CreateBar", function(self)
		for bar in self:GetBarIterator() do
			local frame = bar.frame
			local name = frame:GetName().."Bar"
			local tbar = _G[name]
			local text = _G[name.."Name"]

			if not bar.styled then
				local texture = _G[name.."Texture"]
				local timer = _G[name.."Timer"]
				local spark = _G[name.."Spark"]
				local icon1 = _G[frame:GetName().."BarIcon1"]
				local icon2 = _G[frame:GetName().."BarIcon2"]

				if (icon1.overlay) then
					icon1.overlay = _G[icon1.overlay:GetName()]
				else
					icon1.overlay = CreateFrame("Frame", "$parentIcon1Overlay", tbar)
					icon1.overlay:SetWidth(24)
					icon1.overlay:SetHeight(24)
					icon1.overlay:SetFrameStrata("BACKGROUND")
					icon1.overlay:SetPoint("BOTTOMRIGHT", tbar, "BOTTOMLEFT", -2, -2)
					F.CreateSD(icon1.overlay, 3, 0, 0, 0, 1, -3)
				end

				if (icon2.overlay) then
					icon2.overlay = _G[icon2.overlay:GetName()]
				else
					icon2.overlay = CreateFrame("Frame", "$parentIcon2Overlay", tbar)
					icon2.overlay:SetWidth(24)
					icon2.overlay:SetHeight(24)
					icon2.overlay:SetFrameStrata("BACKGROUND")
					icon2.overlay:SetPoint("BOTTOMLEFT", tbar, "BOTTOMRIGHT", 5, -2)
					F.CreateSD(icon2.overlay, 3, 0, 0, 0, 1, -3)
				end

				F.CreateBDFrame(tbar, .6)

				texture:SetTexture(C.media.texture)
				texture.SetTexture = F.dummy

				F.SetFS(text)
				text.SetFont = F.dummy

				timer:SetPoint("CENTER", 0, 10)
				timer:SetPoint("RIGHT", -2, 10)
				F.SetFS(timer)
				timer.SetFont = F.dummy

				spark:SetSize(8, 16)
				spark.SetSize = F.dummy
				spark:SetTexture("Interface\\AddOns\\FreeUI\\media\\DBMSpark")
				
				if not icon1.styled then
							icon1:SetTexCoord(0.1, 0.9, 0.1, 0.9)
							icon1:ClearAllPoints()
							icon1:SetPoint("TOPLEFT", icon1.overlay, 2, -2)
							icon1:SetPoint("BOTTOMRIGHT", icon1.overlay, -2, 2)
							icon1.styled = true
						end
						
						if not icon2.styled then
							icon2:SetTexCoord(0.1, 0.9, 0.1, 0.9)
							icon2:ClearAllPoints()
							icon2:SetPoint("TOPLEFT", icon2.overlay, 2, -2)
							icon2:SetPoint("BOTTOMRIGHT", icon2.overlay, -2, 2)
							icon2.styled = true
						end

				bar.styled = true

				if bar.owner.options.IconLeft then icon1:Show() icon1.overlay:Show() else icon1:Hide() icon1.overlay:Hide() end
				if bar.owner.options.IconRight then icon2:Show() icon2.overlay:Show() else icon2:Hide() icon2.overlay:Hide() end

				tbar:SetHeight(6)

				text:SetPoint("CENTER", 0, 10)
				text:SetPoint("LEFT", 2, 10)

				tbar:SetAlpha(1)
				frame:SetAlpha(1)
				texture:SetAlpha(1)
				frame:Show()
				bar:Update(0)
				bar.injected = true
			end
		end
	end)

	local firstInfo = true
	hooksecurefunc(DBM.InfoFrame, "Show", function()
		if firstInfo then
			DBMInfoFrame:SetBackdrop(nil)
			local bd = CreateFrame("Frame", nil, DBMInfoFrame)
			bd:SetPoint("TOPLEFT")
			bd:SetPoint("BOTTOMRIGHT")
			bd:SetFrameLevel(DBMInfoFrame:GetFrameLevel()-1)
			F.CreateBD(bd)

			firstInfo = false
		end
	end)

	local firstRange = true
	hooksecurefunc(DBM.RangeCheck, "Show", function()
		if firstRange then
			DBMRangeCheck:SetBackdrop(nil)
			F.CreateBDFrame(DBMRangeCheck)

			DBMRangeCheckRadar.background:SetTexture("")
			F.CreateBDFrame(DBMRangeCheckRadar)

			F.SetFS(DBMRangeCheckRadar.text)
			DBMRangeCheckRadar.text:SetTextColor(1, 1, 1)
			F.SetFS(DBMRangeCheckRadar.inRangeText)
			DBMRangeCheckRadar.inRangeText:SetTextColor(1, 1, 1)

			firstRange = false
		end
	end)

	hooksecurefunc(DBM.BossHealth, "Show", function()
		local anchor = DBMBossHealthDropdown:GetParent()
		if not anchor.styled then
			local header = anchor:GetRegions()
			F.SetFS(header)
			header:SetTextColor(1, 1, 1)

			anchor.styled = true
		end
	end)

	local count = 1

	local styleBar = function()
		local bar = _G["DBM_BossHealth_Bar_"..count]

		while bar do
			if not bar.styled then
				local name = bar:GetName()
				local sb = _G[name.."Bar"]
				local text = _G[name.."BarName"]
				local timer = _G[name.."BarTimer"]

				_G[name.."BarBackground"]:Hide()
				_G[name.."BarBorder"]:SetNormalTexture("")

				sb:SetStatusBarTexture(C.media.texture)

				F.SetFS(text)
				F.SetFS(timer)

				F.CreateBDFrame(sb)

				bar.styled = true
			end

			count = count + 1
			bar = _G["DBM_BossHealth_Bar_"..count]
		end
	end

	hooksecurefunc(DBM.BossHealth, "AddBoss", styleBar)
	hooksecurefunc(DBM.BossHealth, "UpdateSettings", styleBar)

	hooksecurefunc(DBM, "ShowUpdateReminder", function()
		-- no name or anything
		-- reverse loop because it's most likely to be somewhere at the end
		for i = UIParent:GetNumChildren(), 1, -1 do
			local frame = select(i, UIParent:GetChildren())

			local editBox = frame:GetChildren()
			if editBox and editBox:GetObjectType() == "EditBox" and editBox:GetText() == "http://www.deadlybossmods.com" and not frame.styled then
				F.CreateBD(frame)

				select(6, editBox:GetRegions()):Hide()
				select(7, editBox:GetRegions()):Hide()
				select(8, editBox:GetRegions()):Hide()

				local bg = F.CreateBDFrame(editBox, .25)
				bg:SetPoint("TOPLEFT", -2, -6)
				bg:SetPoint("BOTTOMRIGHT", 2, 8)

				F.Reskin(select(2, frame:GetChildren()))

				frame.styled = true
			end
		end
	end)
end

if IsAddOnLoaded("DBM-Core") then
	InitStyle()
else
	local load = CreateFrame("Frame")
	load:RegisterEvent("ADDON_LOADED")
	load:SetScript("OnEvent", function(self, _, addon)
		if addon ~= "DBM-Core" then return end
		self:UnregisterEvent("ADDON_LOADED")

		InitStyle()

		load = nil
	end)
end
