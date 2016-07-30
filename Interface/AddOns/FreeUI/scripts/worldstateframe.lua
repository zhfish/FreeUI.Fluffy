local F, C = unpack(select(2, ...))

local locale = GetLocale()

local function restyleStateFrames()
	for i = 1, NUM_ALWAYS_UP_UI_FRAMES do
		local f = _G["AlwaysUpFrame"..i]
		if f and not f.styled then
			local _, g = f:GetRegions()
			F.SetFS(g)

			if locale == "zhCN" or locale == "zhTW" then
				g:SetFont(C.media.font3, 10, "OUTLINEMONOCHROME")
			end

			g:SetShadowOffset(0, 0)
			g:SetTextColor(1, 1, 1)

			f.styled = true
		end
	end
end

restyleStateFrames()
hooksecurefunc("WorldStateAlwaysUpFrame_Update", restyleStateFrames)