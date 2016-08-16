f = CreateFrame('Frame', nil, Minimap)
f:SetPoint('BOTTOM', Minimap, 'TOP', 0, -20)
f:SetSize(200, 10)

t = f:CreateFontString(nil, 'BACKGROUND')
t:SetPoint('RIGHT', f)
t:SetFont([[Interface\AddOns\Lyn\assets\bigfont.ttf]], 10)
t:SetShadowOffset(1, -1)
t:SetShadowColor(0, 0, 0)
t:SetJustifyH('RIGHT')
t:SetText('|cffADF1F5RESTING|r')

f:RegisterEvent('PLAYER_ENTERING_WORLD')
f:RegisterEvent('PLAYER_UPDATE_RESTING')

f:SetScript('OnUpdate', function(self, event, ...) 
	if IsResting() then
		self:SetAlpha(1)
	else
		self:SetAlpha(0)
	end
end)
