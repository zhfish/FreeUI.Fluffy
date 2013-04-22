----------------------------------------------------------------------------------------
--	Force readycheck warning
----------------------------------------------------------------------------------------
local ShowReadyCheckHook = function(self, initiator, timeLeft)
	if initiator ~= "player" then
		PlaySound("ReadyCheck", "Master")
	end
end
hooksecurefunc("ShowReadyCheck", ShowReadyCheckHook)



----------------------------------------------------------------------------------------
--	Force other warning
----------------------------------------------------------------------------------------
local ForceWarning = CreateFrame("Frame")
ForceWarning:RegisterEvent("UPDATE_BATTLEFIELD_STATUS")
ForceWarning:RegisterEvent("LFG_PROPOSAL_SHOW")
ForceWarning:RegisterEvent("PARTY_INVITE_REQUEST")
ForceWarning:RegisterEvent("CONFIRM_SUMMON")
ForceWarning:RegisterEvent("PET_BATTLE_QUEUE_PROPOSE_MATCH")
ForceWarning:SetScript("OnEvent", function(self, event)
	if event == "UPDATE_BATTLEFIELD_STATUS" and StaticPopup_Visible("CONFIRM_BATTLEFIELD_ENTRY") then
		PlaySound("ReadyCheck", "Master")
	elseif event == "LFG_PROPOSAL_SHOW" or event == "PARTY_INVITE_REQUEST" or event == "CONFIRM_SUMMON" or event == "PET_BATTLE_QUEUE_PROPOSE_MATCH" then
		PlaySound("ReadyCheck", "Master")
	end
end)




----------------------------------------------------------------------------------------
--	Misclicks for some popups
----------------------------------------------------------------------------------------
StaticPopupDialogs.RESURRECT.hideOnEscape = nil
StaticPopupDialogs.PARTY_INVITE.hideOnEscape = nil
StaticPopupDialogs.PARTY_INVITE_XREALM.hideOnEscape = nil
StaticPopupDialogs.CONFIRM_SUMMON.hideOnEscape = nil
--StaticPopupDialogs.PET_BATTLE_QUEUE_PROPOSE_MATCH.hideOnEscape = nil
StaticPopupDialogs.CONFIRM_BATTLEFIELD_ENTRY.button2 = nil
StaticPopupDialogs.ADDON_ACTION_FORBIDDEN.button1 = nil
StaticPopupDialogs.TOO_MANY_LUA_ERRORS.button1 = nil









----------------------------------------------------------------------------------------
--	Auto hide unnecessary stats from CharacterFrame(module from Inomena by p3lim)
----------------------------------------------------------------------------------------
PAPERDOLL_STATCATEGORIES = {
	GENERAL = {
		id = 1,
		stats = {
			"ITEMLEVEL",
			"MOVESPEED",
		},
	},
	MELEE = {
		id = 2,
		stats = {
			"STRENGTH",
			"AGILITY",
			"MELEE_AP",
			"ENERGY_REGEN",
			"RUNE_REGEN",
			"HASTE",
			"CRITCHANCE",
			"HITCHANCE",
			"EXPERTISE",
			"MASTERY",
		},
	},
	RANGED = {
		id = 2,
		stats = {
			"AGILITY",
			"RANGED_AP",
			"RANGED_HASTE",
			"FOCUS_REGEN",
			"CRITCHANCE",
			"RANGED_HITCHANCE",
			"MASTERY",
		},
	},
	SPELL = {
		id = 2,
		stats = {
			"SPIRIT",
			"INTELLECT",
			"SPELLDAMAGE",
			"SPELLHEALING",
			"SPELL_HASTE",
			"MANAREGEN",
			"SPELLCRIT",
			"SPELL_HITCHANCE",
			"MASTERY",
		},
	},
	DEFENSE = {
		id = 3,
		stats = {
			"STAMINA",
			"ARMOR",
			"DODGE",
			"PARRY",
			"BLOCK",
			"RESILIENCE_REDUCTION",
			"PVP_POWER",
		},
	},
}

local orig = PaperDoll_InitStatCategories
local class = select(3, UnitClass("player"))

local sort = {
	{
		"GENERAL",
		"MELEE",
		"DEFENSE",
	},
	{
		"GENERAL",
		"RANGED",
		"DEFENSE",
	},
	{
		"GENERAL",
		"SPELL",
		"DEFENSE",
	},
}

local spec
local specs = {
	{1, 1, 1},
	{3, 1, 1},
	{2, 2, 2},
	{1, 1, 1},
	{3, 3, 3},
	{1, 1, 1},
	{3, 1, 3},
	{3, 3, 3},
	{3, 3, 3},
	{1, 3, 1},
	{3, 1, 1, 3},
}

local handler = CreateFrame("Frame")
handler:RegisterEvent("PLAYER_TALENT_UPDATE")
handler:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
handler:SetScript("OnEvent", function()
	spec = GetSpecialization()

	if spec then
		PaperDoll_InitStatCategories = function()
			orig(sort[specs[class][spec]], nil, nil, "player")
			PaperDollFrame_CollapseStatCategory(CharacterStatsPaneCategory4)
		end
	end
end)

for index = 1, 3 do
	local toolbar = _G["CharacterStatsPaneCategory"..index.."Toolbar"]
	toolbar:SetScript("OnEnter", nil)
	toolbar:SetScript("OnClick", nil)
	toolbar:RegisterForDrag()
end

do
	local setStat = PaperDollFrame_SetStat
	function PaperDollFrame_SetStat(self, ...)
		if index == 1 and class ~= 6 and class ~= 2 and class ~= 1 then
			return self:Hide()
		end

		setStat(self, ...)
	end

	local setSpellHit = PaperDollFrame_SetSpellHitChance
	function PaperDollFrame_SetSpellHitChance(self, ...)
		if class == 5 and spec ~= 3 then
			return self:Hide()
		elseif (class == 11 or class == 7) and spec == 3 then
			return self:Hide()
		end

		setSpellHit(self, ...)
	end

	local setParry = PaperDollFrame_SetParry
	function PaperDollFrame_SetParry(self, ...)
		if class ~= 2 and class ~= 1 and class ~= 6 and not (class == 10 and spec == 2) then
			return self:Hide()
		end

		setParry(self, ...)
	end

	local setBlock = PaperDollFrame_SetBlock
	function PaperDollFrame_SetBlock(self, ...)
		if class ~= 2 and class ~= 1 then
			return self:Hide()
		end

		setBlock(self, ...)
	end
end


----------------------------------------------------------------------------------------
--	ALT+Click to buy a stack
----------------------------------------------------------------------------------------
hooksecurefunc("MerchantItemButton_OnModifiedClick", function(self, button)
	if MerchantFrame.selectedTab == 1 then
		if IsAltKeyDown() then
			local id = self:GetID()
			local quantity = select(4, GetMerchantItemInfo(id))
			local extracost = select(7, GetMerchantItemInfo(id))
			if not extracost then
				local stack
				if quantity > 1 then
					stack = quantity * GetMerchantItemMaxStack(id)
				else
					stack = GetMerchantItemMaxStack(id)
				end
				local amount = 1
				if self.count < stack then
					amount = stack / self.count
				end
				if self.numInStock ~= -1 and self.numInStock < amount then
					amount = self.numInStock
				end
				local money = GetMoney()
				if (self.price * amount) > money then
					amount = floor(money / self.price)
				end
				if amount > 0 then
					BuyMerchantItem(id, amount)
				end
			end
		end
	end
end)

local function IsMerchantButtonOver()
	return GetMouseFocus():GetName() and GetMouseFocus():GetName():find("MerchantItem%d")
end

GameTooltip:HookScript("OnTooltipSetItem", function(self)
	if MerchantFrame:IsShown() and IsMerchantButtonOver() then
		for i = 2, GameTooltip:NumLines() do
			if _G["GameTooltipTextLeft"..i]:GetText():find(ITEM_VENDOR_STACK_BUY) then
				GameTooltip:AddLine("|cff00ff00<"..L_MISC_BUY_STACK..">|r")
			end
		end
	end
end)


-----------------------------------------------------------
-- FixedGetTradeSkillReagentItemLink 
-----------------------------------------------------------

local GameTooltip = CreateFrame("GameTooltip", "TradeSkillFix", UIParent, "GameTooltipTemplate") 
function GetTradeSkillReagentItemLink(skillId, reagentId) 
    GameTooltip:SetOwner(UIParent, "ANCHOR_TOPRIGHT") 
    GameTooltip:SetTradeSkillItem(skillId, reagentId) 
    local _, link = GameTooltip:GetItem() 
    GameTooltip:Hide() 
    return link 
end 