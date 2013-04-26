local F, C = unpack(Aurora or FreeUI)

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon ~= "Blizzard_PetJournal" then return end
	self:UnregisterEvent("ADDON_LOADED")

	PetJournal:HookScript("OnShow", function(self)
		if not self.styledTabs then
			BattlePetTabsTabManager:SetPoint("TOPLEFT", "$parent", "BOTTOMLEFT", 10, 0)

			local function styleTab(tab)
				local bu = _G[tab.."Button"]

				_G[tab]:GetRegions():Hide()

				bu:SetNormalTexture("")
				bu:SetPushedTexture("")
				bu:SetCheckedTexture(C.media.checked)

				F.CreateBG(bu)
				F.CreateSD(bu, 5, 0, 0, 0, 1, 1)

				_G[tab.."ButtonIconTexture"]:SetTexCoord(.08, .92, .08, .92)
			end

			styleTab("BattlePetTabsTabManager")

			for i = 1, 8 do
				styleTab("BattlePetTabsTab"..i)
			end

			self.styledTabs = true
		end
	end)

	hooksecurefunc("BattlePetTabFlyout_OnShow", function(self)
		local scale = self:GetScale()

		for i = 1, self.buttonFrame.numBGs do
			BattlePetTabFlyoutFrame.buttonFrame["bg"..i]:Hide()
		end

		for i = 1, #self.buttons do
			local bu = self.buttons[i]

			if not bu.styled then
				bu:SetNormalTexture("")
				bu:SetPushedTexture("")

				bu.icon:SetTexCoord(.08, .92, .08, .92)
				local bg = F.CreateBG(bu.icon)

				bg:SetPoint("TOPLEFT", -1 / scale, 1 / scale)
				bg:SetPoint("BOTTOMRIGHT", 1 / scale, -1 / scale)

				bu.styled = true
			end
		end
	end)

	local BattlePetTabFlyoutPopupFrame = BattlePetTabFlyoutPopupFrame

	for i = 1, 4 do
		select(i, BattlePetTabFlyoutPopupFrame:GetRegions()):Hide()
	end

	BattlePetTabFlyoutPopupFrame.editBox.nameLeft:Hide()
	BattlePetTabFlyoutPopupFrame.editBox.nameMiddle:Hide()
	BattlePetTabFlyoutPopupFrame.editBox.nameRight:Hide()
	BattlePetTabFlyoutPopupFrameScrollFrame:GetRegions():Hide()
	select(2, BattlePetTabFlyoutPopupFrameScrollFrame:GetRegions()):Hide()

	F.CreateBD(BattlePetTabFlyoutPopupFrame)
	F.CreateBD(BattlePetTabFlyoutPopupFrame.editBox, .25)
	F.Reskin(BattlePetTabFlyoutPopupFrame.okay)
	F.Reskin(BattlePetTabFlyoutPopupFrame.cancel)
	F.ReskinScroll(BattlePetTabFlyoutPopupFrameScrollFrameScrollBar)

	for i = 1, 20 do
		local bu = BattlePetTabFlyoutPopupFrame["button"..i]

		select(2, bu:GetRegions()):Hide()

		bu:SetCheckedTexture(C.media.checked)
		bu:GetCheckedTexture():SetPoint("TOPLEFT", 0, -1)
		bu:GetCheckedTexture():SetPoint("BOTTOMRIGHT", 0, -1)

		bu.icon:SetTexCoord(.08, .92, .08, .92)
		F.CreateBG(bu.icon)
	end
end)