local F, C = unpack(select(2, ...))

local function restyleStateFrames()
	for i = 1, NUM_ALWAYS_UP_UI_FRAMES do
		local f = _G["AlwaysUpFrame"..i]
		if f and not f.styled then
			local _, g = f:GetRegions()

			if GetLocale() == "zhCN" or GetLocale() == "zhTW" then
				g:SetFont(C.media.font.normal, 12, "OUTLINE")
			else
				F.SetFS(g)
			end

			g:SetShadowOffset(0, 0)
			g:SetTextColor(1, 1, 1)

			f.styled = true
		end
	end
end

restyleStateFrames()
hooksecurefunc("WorldStateAlwaysUpFrame_Update", restyleStateFrames)