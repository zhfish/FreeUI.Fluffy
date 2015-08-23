local ADDON_NAME, ns = ...

local NORMAL_FONT_COLOR = NORMAL_FONT_COLOR
local ITEM_LEVEL_ABBR = "iLvl"
local GetMouseFocus = GetMouseFocus
local GameTooltip = GameTooltip
local GetTime = GetTime
local UnitGUID = UnitGUID

local ItemUpgradeInfo = LibStub("LibItemUpgradeInfo-1.0")
local LibInspect = LibStub("LibInspect")

local maxage = 1800 --number of secs to cache each player
LibInspect:SetMaxAge(maxage)

local cache = {}
local ilvlText = "|cffFFFFFF%0.2f|r"

local function getUnit()
	local mFocus = GetMouseFocus()
	local unit = mFocus and (mFocus.unit or mFocus:GetAttribute("unit")) or "mouseover"
	return unit
end

local function ShowiLvl(score)
	if(not GameTooltip.freebtipiLvlSet) then
		GameTooltip:AddDoubleLine(ITEM_LEVEL_ABBR, ilvlText:format(score), NORMAL_FONT_COLOR.r,
		NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
		GameTooltip.freebtipiLvlSet = true
		GameTooltip:Show()
	end
end

local iLvlUpdate = CreateFrame"Frame"
iLvlUpdate:SetScript("OnUpdate", function(self, elapsed)
	self.update = (self.update or 0) + elapsed
	if(self.update < .1) then return end

	local unit = getUnit()
	local guid = UnitGUID(unit)
	local cacheGUID = cache[guid]
	if(cacheGUID) then
		ShowiLvl(cacheGUID.score)
	end

	self.update = 0
	self:Hide()
end)

local slots = { "Back", "Chest", "Feet", "Finger0", "Finger1", "Hands", "Head", "Legs",
"MainHand", "Neck", "SecondaryHand", "Shoulder", "Trinket0", "Trinket1", "Waist", "Wrist" }

local slotIDs = {}
for i, slot in next, slots do
	local slotName = slot.."Slot"
	local id = GetInventorySlotInfo(slotName)

	if(id) then
		slotIDs[i] = id
	end
end

local function getItems(guid, data, age)
	if((not guid) or (data and type(data.items) ~= "table")) then return end

	local cacheGUID = cache[guid]
	if(cacheGUID and cacheGUID.time > (GetTime()-maxage)) then
		return iLvlUpdate:Show()
	end

	local numItems = 0
	local itemsTotal = 0

	for i, id in next, slotIDs do
		local link = data.items[id]

		if(link) then
			local ilvl = ItemUpgradeInfo:GetUpgradedItemLevel(link)

			numItems = numItems + 1
			itemsTotal = itemsTotal + ilvl
		end
	end

	if(numItems > 0) then
		local score = itemsTotal / numItems
		cache[guid] = { score = score, time = GetTime() }
		iLvlUpdate:Show()
	end
end
LibInspect:AddHook(ADDON_NAME, "items", function(...) getItems(...) end)

local function OnSetUnit(self)
	self.freebtipiLvlSet = false

	local unit = getUnit()
	local caninspect = LibInspect:RequestData("items", unit)
	iLvlUpdate:Show()
end
GameTooltip:HookScript("OnTooltipSetUnit", OnSetUnit)

-- Inspect iLevels
local F = CreateFrame('Frame')
local slot = {'Head','Neck','Shoulder','Shirt','Chest','Waist','Legs','Feet','Wrist','Hands','Finger0','Finger1','Trinket0','Trinket1','Back','MainHand','SecondaryHand','Tabard'}
local levelAdjust={
   ["000"]=00,["001"]=08,["373"]=04,["374"]=08,["375"]=04,["376"]=04,["377"]=04,["378"]=07,
   ["379"]=04,["380"]=04,["445"]=00,["446"]=04,["447"]=08,["451"]=00,["452"]=08,["453"]=00,
   ["454"]=04,["455"]=08,["456"]=00,["457"]=08,["458"]=00,["459"]=04,["460"]=08,["461"]=12,
   ["462"]=16,["465"]=00,["466"]=04,["467"]=08,["468"]=00,["469"]=04,["470"]=08,["471"]=12,
   ["472"]=16,["491"]=00,["492"]=04,["493"]=08,["494"]=00,["495"]=04,["496"]=08,["497"]=12,
   ["498"]=16,["503"]=01,["504"]=12,["505"]=16,["506"]=20,["507"]=24,
}

local function CreateIlvText(slotName)
   local f = _G[slotName]
   f.ilv = f:CreateFontString(nil, "OVERLAY")
   f.ilv:SetFont("Interface\\AddOns\\FreeUI\\media\\pixel.ttf", 8, "OUTLINEMONOCHROME")
   f.ilv:SetPoint("CENTER", f, "TOP", 1, -6)
   f.ilv:SetTextColor(GameFontNormal:GetTextColor())
end

local function GetActualItemLevel(itemLink, baseLevel)
   local upgrade = itemLink:match("item:%d+:%d+:%d+:%d+:%d+:%d+:%-?%d+:%-?%d+:%d+:(%d+)")
   if not upgrade then return baseLevel end
   return baseLevel + (levelAdjust[upgrade] or 0)
end

local function CheckItem(unit, frame)
   if unit then
      for k, v in pairs(slot) do
         local f = _G[frame..v..'Slot']
         local itemLink = GetInventoryItemLink(unit, k)
         if not itemLink then
            f.ilv:SetText()
         else
            local _, _, itemQuality, baseLevel = GetItemInfo(itemLink)
            f.ilv:SetText(GetActualItemLevel(itemLink, baseLevel))
         end
      end
   end
end

for _, v in pairs(slot) do CreateIlvText('Character'..v..'Slot') end

CharacterFrame:HookScript('OnShow', function(self)
CheckItem('player', 'Character')
self:RegisterEvent('PLAYER_EQUIPMENT_CHANGED')
end)

CharacterFrame:HookScript('OnHide', function(self)
self:UnregisterEvent('PLAYER_EQUIPMENT_CHANGED')
end)

CharacterFrame:HookScript('OnEvent', function(self, event)
if event ~= 'PLAYER_EQUIPMENT_CHANGED' then return end
CheckItem('player', 'Character')
end)

F:RegisterEvent('ADDON_LOADED')
F:SetScript('OnEvent', function(self, event, addon)
   if addon == 'Blizzard_InspectUI' then
      for k, v in pairs(slot) do CreateIlvText('Inspect'..v..'Slot') end
      CheckItem(_G['InspectFrame'].unit, 'Inspect')
      _G['InspectFrame']:HookScript('OnShow', function()
         CheckItem(_G['InspectFrame'].unit, 'Inspect')
         self:RegisterEvent('INSPECT_READY')
         self:RegisterEvent('UNIT_MODEL_CHANGED')
         self:RegisterEvent('PLAYER_TARGET_CHANGED')
         self:SetScript('OnEvent', function() CheckItem(_G['InspectFrame'].unit, 'Inspect') end)
      end)
      _G['InspectFrame']:HookScript('OnHide', function()
         self:UnregisterEvent('PLAYER_TARGET_CHANGED')
         self:UnregisterEvent('UNIT_MODEL_CHANGED')
         self:UnregisterEvent('INSPECT_READY')
         self:SetScript('OnEvent', nil)
      end)
      self:UnregisterEvent('ADDON_LOADED')
      self:SetScript('OnEvent', nil)
   end
end)