local F, C, L = unpack(select(2, ...))

local _, nBuff = ...

nBuff.Config = {
	buffSize = 34,
	buffScale = 1,

	debuffSize = 40,
	debuffScale = 1,

	paddingX = 4,
	paddingY = 6,
	buffPerRow = 8,
}

local cfg = nBuff.Config

local _G = _G
local unpack = unpack

-- _G.DAY_ONELETTER_ABBR = '|cffffffff%dd|r'
-- _G.HOUR_ONELETTER_ABBR = '|cff51afed%dh|r'
-- _G.MINUTE_ONELETTER_ABBR = '|cfff1c31a%dm|r'
-- _G.SECOND_ONELETTER_ABBR = '|cffff000c%d|r'

-- _G.DEBUFF_MAX_DISPLAY = 32 -- show more debuffs
-- _G.BUFF_MIN_ALPHA = 1

local function durationSetText(duration, arg1, arg2)
	duration:SetText(format("|cffffffff"..string.gsub(arg1, " ", "").."|r", arg2))
end

local function applySkin(b)
	if not b or (b and b.styled) then return end

	local name = b:GetName()

	local border = _G[name.."Border"]
	if border then border:Hide() end

	local icon = _G[name.."Icon"]
	icon:SetTexCoord(.08, .92, .08, .92)
	icon:SetDrawLayer("BACKGROUND", 1)

	F.SetFS(b.duration)
	b.duration:ClearAllPoints()
	b.duration:SetPoint("BOTTOM", 1, -2)

	hooksecurefunc(b.duration, "SetFormattedText", durationSetText)

	F.SetFS(b.count)
	b.count:ClearAllPoints()
	b.count:SetPoint("TOP", b, "TOP", 2, -2)

	F.CreateBG(b)

	b.styled = true
end


local origSecondsToTimeAbbrev = _G.SecondsToTimeAbbrev
local function SecondsToTimeAbbrevHook(seconds)
		origSecondsToTimeAbbrev(seconds)

		local tempTime
		if (seconds >= 86400) then
				tempTime = ceil(seconds / 86400)
				return '|cffffffff%dd|r', tempTime
		end

		if (seconds >= 3600) then
				tempTime = ceil(seconds / 3600)
				return '|cff51afed%dh|r', tempTime
		end

		if (seconds >= 60) then
				tempTime = ceil(seconds / 60)
				return '|cfff1c31a%dm|r', tempTime
		end

		return '|cffff000c%d|r', seconds
end
SecondsToTimeAbbrev = SecondsToTimeAbbrevHook

BuffFrame:SetScript('OnUpdate', nil)
hooksecurefunc(BuffFrame, 'Show', function(self)
		self:SetScript('OnUpdate', nil)
end)

-- TemporaryEnchantFrame ...
TempEnchant1:ClearAllPoints()
TempEnchant1:SetPoint('TOPRIGHT', Minimap, 'TOPLEFT', -12, -36)
-- TempEnchant1.SetPoint = function() end

TempEnchant2:ClearAllPoints()
TempEnchant2:SetPoint('TOPRIGHT', TempEnchant1, 'TOPLEFT', -cfg.paddingX, 0)

local function UpdateFirstButton(self)
		if (self and self:IsShown()) then
				self:ClearAllPoints()
				if (UnitHasVehicleUI('player')) then
						self:SetPoint('TOPRIGHT', TempEnchant1)
						return
				else
						if (BuffFrame.numEnchants > 0) then
								self:SetPoint('TOPRIGHT', _G['TempEnchant'..BuffFrame.numEnchants], 'TOPLEFT', -cfg.paddingX, 0)
								return
						else
								self:SetPoint('TOPRIGHT', TempEnchant1)
								return
						end
				end
		end
end

local function CheckFirstButton()
		if (BuffButton1) then
		UpdateFirstButton(BuffButton1)
		end
end

hooksecurefunc('BuffFrame_UpdateAllBuffAnchors', function()
		local previousBuff, aboveBuff
		local numBuffs = 0
		local numTotal = BuffFrame.numEnchants

		for i = 1, BUFF_ACTUAL_DISPLAY do
				local buff = _G['BuffButton'..i]

		numBuffs = numBuffs + 1
		numTotal = numTotal + 1

		buff:ClearAllPoints()
		if (numBuffs == 1) then
			UpdateFirstButton(buff)
		elseif (numBuffs > 1 and mod(numTotal, cfg.buffPerRow) == 1) then
			if (numTotal == cfg.buffPerRow + 1) then
				buff:SetPoint('TOP', TempEnchant1, 'BOTTOM', 0, -cfg.paddingY)
			else
				buff:SetPoint('TOP', aboveBuff, 'BOTTOM', 0, -cfg.paddingY)
			end

			aboveBuff = buff
		else
			buff:SetPoint('TOPRIGHT', previousBuff, 'TOPLEFT', -cfg.paddingX, 0)
		end

		previousBuff = buff
		end
end)

hooksecurefunc('DebuffButton_UpdateAnchors', function(self, index)
		local numBuffs = BUFF_ACTUAL_DISPLAY + BuffFrame.numEnchants
		local rowSpacing
		local debuffSpace = cfg.buffSize + cfg.paddingY
		local numRows = ceil(numBuffs/cfg.buffPerRow)

		if (numRows and numRows > 1) then
				rowSpacing = -numRows * debuffSpace
		else
				rowSpacing = -debuffSpace
		end

		local buff = _G[self..index]
		buff:ClearAllPoints()

		if (index == 1) then
				buff:SetPoint('TOP', TempEnchant1, 'BOTTOM', 0, rowSpacing)
		elseif (index >= 2 and mod(index, cfg.buffPerRow) == 1) then
				buff:SetPoint('TOP', _G[self..(index-cfg.buffPerRow)], 'BOTTOM', 0, -cfg.paddingY)
		else
				buff:SetPoint('TOPRIGHT', _G[self..(index-1)], 'TOPLEFT', -cfg.paddingX, 0)
		end
end)

for i = 1, NUM_TEMP_ENCHANT_FRAMES do
		local button = _G['TempEnchant'..i]
		button:SetScale(cfg.buffScale)
		button:SetSize(cfg.buffSize, cfg.buffSize)

		applySkin(button)

		button:SetScript('OnShow', function()
				CheckFirstButton()
		end)

		button:SetScript('OnHide', function()
				CheckFirstButton()
		end)

end

hooksecurefunc('AuraButton_Update', function(self, index)
		local button = _G[self..index]

		if (button and not button.styled) then applySkin(button)
				if (button) then
						if (self:match('Debuff')) then
								button:SetSize(cfg.debuffSize, cfg.debuffSize)
								button:SetScale(cfg.debuffScale)
						else
								button:SetSize(cfg.buffSize, cfg.buffSize)
								button:SetScale(cfg.buffScale)
						end
				end
		end
end)