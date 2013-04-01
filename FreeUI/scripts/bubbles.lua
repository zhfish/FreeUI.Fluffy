local F, C = unpack(select(2, ...))

local bubbleHook = CreateFrame("Frame")
local bubblefont = 'Fonts\\cy_emblem.ttf'

local function styleBubble(frame)
	local scale = UIParent:GetScale()

	for i = 1, frame:GetNumRegions() do
		local region = select(i, frame:GetRegions())
		if region:GetObjectType() == "Texture" then
			region:SetTexture(nil)
		elseif region:GetObjectType() == "FontString" then
			region:SetFont(bubblefont, 13)
			region:SetShadowOffset(scale, -scale)
		end
	end

	frame:SetBackdrop({
		bgFile = C.media.backdrop,
		edgeFile = C.media.backdrop,
		edgeSize = scale,
	})
	frame:SetBackdropColor(0, 0, 0, .5)
	frame:SetBackdropBorderColor(0, 0, 0)
end

local function isChatBubble(frame)
	if frame:GetName() then return end
	if not frame:GetRegions() then return end
	return frame:GetRegions():GetTexture() == [[Interface\Tooltips\ChatBubble-Background]]
end

local last = 0
local numKids = 0

bubbleHook:SetScript("OnUpdate", function(self, elapsed)
	last = last + elapsed
	if last > .1 then
		last = 0
		local newNumKids = WorldFrame:GetNumChildren()
		if newNumKids ~= numKids then
			for i = numKids + 1, newNumKids do
				local frame = select(i, WorldFrame:GetChildren())

				if isChatBubble(frame) then
					styleBubble(frame)
				end
			end
			numKids = newNumKids
		end
	end
end)