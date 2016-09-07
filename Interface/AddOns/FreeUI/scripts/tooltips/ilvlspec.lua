local F, C = unpack(select(2, ...))
if C.tooltip.enable ~= true or C.tooltip.ilvlspec ~= true then return end

--- Variables ---
local GearDB, SpecDB, PVPItemDB = {}, {}, {}
local ScanTip, lvlPattern, PVPPattern
local currentUNIT, currentGUID
local PVP_ITEM_PATTERN

local nextInspectRequest = 0
lastInspectRequest = 0

local prefixColor = "|cffffeeaa"
local detailColor = "|cffffffff"

local locale = GetLocale()
local gearPrefix, specPrefix

if locale == "zhCN" then
	gearPrefix = "装等: "
	specPrefix = "专精: "
	PVP_ITEM_PATTERN = "第%d赛季"
elseif locale == "zhTW" then
	gearPrefix = "裝等: "
	specPrefix = "專精: "
	PVP_ITEM_PATTERN = "第%d季"
else
	gearPrefix = STAT_AVERAGE_ITEM_LEVEL .. ": "
	specPrefix = SPECIALIZATION .. ": "
	PVP_ITEM_PATTERN = "Season %d"
end

local Lv80_BOA = { 
	[42943] = 1, [42944] = 1, [42945] = 1, [42946] = 1,
	[42947] = 1, [42948] = 1, [42949] = 1, [42950] = 1,
	[42951] = 1, [42952] = 1, [42984] = 1, [42985] = 1,
	[42991] = 1, [42992] = 1, [44091] = 1, [44092] = 1,
	[44093] = 1, [44094] = 1, [44095] = 1, [44096] = 1,
	[44097] = 1, [44098] = 1, [44099] = 1, [44100] = 1,
	[44101] = 1, [44102] = 1, [44103] = 1, [44105] = 1,
	[44107] = 1, [48677] = 1, [48683] = 1, [48685] = 1,
	[48687] = 1, [48689] = 1, [48691] = 1, [48716] = 1,
	[48718] = 1, [50255] = 1, [69889] = 1, [69890] = 1, 
	[69893] = 1, [79131] = 1, [92948] = 1,
}

local Lv85_BOA = {
	[61931] = 1, [61935] = 1, [61936] = 1, [61937] = 1,
	[61942] = 1, [61958] = 1, [62023] = 1, [62024] = 1,
	[62025] = 1, [62026] = 1, [62027] = 1, [62029] = 1,
	[62038] = 1, [62039] = 1, [62040] = 1, [69887] = 1,
	[69888] = 1, [69892] = 1, [93841] = 1, [93843] = 1,
	[93844] = 1, [93845] = 1, [93846] = 1, [93847] = 1,
	[93848] = 1, [93848] = 1, [93850] = 1, [93851] = 1,
	[93852] = 1, [93853] = 1, [93855] = 1, [93856] = 1,
	[93857] = 1, [93858] = 1, [93859] = 1, [93860] = 1,
	[93861] = 1, [93862] = 1, [93863] = 1, [93864] = 1,
	[93865] = 1, [93866] = 1, [93867] = 1, [93876] = 1,
	[93885] = 1, [38886] = 1, [38887] = 1, [38888] = 1,
	[93889] = 1, [93890] = 1, [93891] = 1, [93892] = 1,
	[93893] = 1, [93894] = 1, [93895] = 1, [93896] = 1,
	[93897] = 1, [93898] = 1, [93899] = 1, [93900] = 1,
	[93902] = 1, [93903] = 1, [93904] = 1,
}

local Lv100_BOA = {
	[126948] = 1, [126949] = 1, [128318] = 1,
}

local Lv110_BOA = {
	[133595] = 1, [133596] = 1, [133597] = 1, [133598] = 1,
	[133585] = 1, 
}

--- Create Frame ---
local f = CreateFrame("Frame", "CloudyUnitInfo")
f:RegisterEvent("UNIT_INVENTORY_CHANGED")
f:RegisterEvent("INSPECT_READY")

--- BOA Item Level ---
local function BOALevel(ilvl, ulvl, id, upgrade)
	local level
	if ilvl == 1 then
		if Lv110_BOA[id] then
			return 815 - (110 - ulvl) * 10
		elseif Lv100_BOA[id] then
			if ulvl > 100 then ulvl = 100 end
		elseif Lv85_BOA[id] then
			if ulvl > 85 then ulvl = 85 end
		elseif Lv80_BOA[id] then
			if ulvl > 80 then ulvl = 80 end
		elseif ulvl > 60 and upgrade ~= 583 and upgrade ~= 582 then
			ulvl = 60
		elseif ulvl > 90 and upgrade ~= 583 then
			ulvl = 90
		elseif ulvl > 100 then
			ulvl = 100
		end
		if ulvl > 97 then
			level = 605 - (100 - ulvl) * 5
		elseif ulvl > 90 then
			level = 590 - (97 - ulvl) * 10
		elseif ulvl > 85 then
			level = 463 - (90 - ulvl) * 19.75
		elseif ulvl > 80 then
			level = 333 - (85 - ulvl) * 13.5
		elseif ulvl > 67 then
			level = 187 - (80 - ulvl) * 4
		elseif ulvl > 57 then
			level = 105 - (67 - ulvl) * 26 / 9
		elseif ulvl > 10 then
			level = ulvl + 5
		else
			level = 10
		end
	else
		if ulvl > 100 then
			ulvl = 100
		end
		if ilvl == 582 or ilvl == 569 or ilvl == 556 then
			level = ilvl + (620 - ilvl) / 10 * (ulvl - 90)
		else
			level = ilvl
		end
	end
	return floor(level + 0.5)
end

--- Scan Item Level ---
local function GetItemLevel(itemLink)
	local itemLevel
	if not lvlPattern then
		lvlPattern = gsub(ITEM_LEVEL, "%%d", "(%%d+)")
	end

	if not ScanTip then
		ScanTip = CreateFrame("GameTooltip","ScanTip",nil,"GameTooltipTemplate")
		ScanTip:SetOwner(UIParent,"ANCHOR_NONE")
	end
	ScanTip:ClearLines()
	ScanTip:SetHyperlink(itemLink)

	for i = 2, min(5, ScanTip:NumLines()) do
		local line = _G["ScanTipTextLeft"..i]:GetText()
		itemLevel = strmatch(line, lvlPattern)
		if itemLevel then
			return tonumber(itemLevel)
		end
	end

	local itemID = strmatch(itemLink, "item:(%d+)")
	if itemID then
		itemLevel = select(4, GetItemInfo(itemID))
		if itemLevel then
			return tonumber(itemLevel)
		end
	end

	return 0
end

--- Scan PVP Item  ---
local function GetPVPItem(itemLink)
	local itemID = strmatch(itemLink, "item:(%d+)")
	itemID = tonumber(itemID) or 0
	if PVPItemDB[itemID] then return PVPItemDB[itemID] end
	if not PVPPattern then
		PVPPattern = gsub(PVP_ITEM_PATTERN, "%%d", "(%%d+)")
	end

	if not ScanTip then
		ScanTip = CreateFrame("GameTooltip","ScanTip",nil,"GameTooltipTemplate")
		ScanTip:SetOwner(UIParent,"ANCHOR_NONE")
	end
	ScanTip:ClearLines()
	ScanTip:SetHyperlink(itemLink)

	local line = _G["ScanTipTextLeft"..2]:GetText()
	local PVP = strmatch(line, PVPPattern)
	if PVP then
		PVPItemDB[itemID] = true
		return true
	end
end

--- Unit Gear Info ---
local function UnitGear(unit)
	if (not unit) or (UnitGUID(unit) ~= currentGUID) then return end

	local ulvl = UnitLevel(unit)
	local class = select(2, UnitClass(unit))

	local boa, pvp, twohand = 0, 0, 1
	local ilvl, total, delay = 0, 0, nil

	for i = 1, 17 do
		if i ~= 4 then
			local itemTexture = GetInventoryItemTexture(unit, i)

			if itemTexture then
				local itemLink = GetInventoryItemLink(unit, i)

				if (not itemLink) then
					delay = true
				else
					local _, _, quality, lvl, _, _, _, _, slot = GetItemInfo(itemLink)
					local bonus = select(15, strsplit(":", itemLink))
					local id = strmatch(itemLink, "item:(%d+)")
					bonus = tonumber(bonus) or 0
					id = tonumber(id) or 0

					if (not quality) or (not lvl) then
						delay = true
					else
						if quality == 7 then
							boa = boa + 1
							level = BOALevel(lvl, ulvl, id, bonus)
						else
							if GetPVPItem(itemLink) then
								pvp = pvp + 1
							end

							if i < 17 or quality < 6 then
								level = GetItemLevel(itemLink)
							else
								local org_level = level
								level = GetItemLevel(itemLink)
								if level < org_level then
									total = total + org_level - level
								else
									total = total + level - org_level
								end
							end
						end

						if i == 16 then
							if slot == "INVTYPE_RANGED" or (slot == "INVTYPE_RANGEDRIGHT" and class == "HUNTER") then
								twohand = 2
							elseif slot == "INVTYPE_2HWEAPON" and GetInspectSpecialization(unit) ~= 72 then
								twohand = 2
							end
						end

						total = total + level * twohand
					end
				end
			end
		end
	end

	if (not delay) then
		if unit == "player" and GetAverageItemLevel() > 0 then
			ilvl = select(2, GetAverageItemLevel())
		else
			ilvl = total / 16
		end

		if ilvl > 0 then ilvl = string.format("%.1f", ilvl) end
		if boa > 0 then ilvl = ilvl .. " |cffe6cc80" .. boa .. " BOA" end
		if pvp > 0 then ilvl = ilvl .. " |cffa335ee" .. pvp .. " PVP" end
	else
		ilvl = nil
	end

	return ilvl
end

--- Unit Specialization ---
local function UnitSpec(unit)
	if (not unit) or (UnitGUID(unit) ~= currentGUID) then return end

	local specName
	if (unit == "player") then
		local specIndex = GetSpecialization()

		if specIndex then
			specName = select(2, GetSpecializationInfo(specIndex))
		else
			specName = NONE
		end
	else
		local specID = GetInspectSpecialization(unit)

		if specID and (specID > 0) then
			specName = select(2, GetSpecializationInfoByID(specID))
		elseif (specID == 0) then
			specName = NONE
		end
	end

	return specName
end

--- Set Unit Info ---
local function SetUnitInfo(gear, spec)
	if (not gear) and (not spec) then return end

	local _, unit = GameTooltip:GetUnit()
	if (not unit) or (UnitGUID(unit) ~= currentGUID) then return end

	local gearLine, specLine
	for i = 2, GameTooltip:NumLines() do
		local line = _G["GameTooltipTextLeft" .. i]
		local text = line:GetText()

		if text and strfind(text, gearPrefix) then
			gearLine = line
		elseif text and strfind(text, specPrefix) then
			specLine = line
		end
	end

	if gear then
		gear = prefixColor .. gearPrefix .. detailColor .. gear
		if gearLine then
			gearLine:SetText(gear)
		else
			GameTooltip:AddLine(gear)
		end
	end

	if spec and UnitLevel(unit) > 10 then
		spec = prefixColor .. specPrefix .. detailColor .. spec
		if specLine then
			specLine:SetText(spec)
		else
			GameTooltip:AddLine(spec)
		end
	end

	GameTooltip:Show()
end

--- Scan Current Unit ---
local function ScanUnit(unit, forced)
	local cachedGear, cachedSpec

	if UnitIsUnit(unit, "player") then
		cachedGear = UnitGear("player")
		cachedSpec = UnitSpec("player")

		SetUnitInfo(cachedGear or CONTINUED, cachedSpec or CONTINUED)
	else
		if (not unit) or (UnitGUID(unit) ~= currentGUID) then return end

		cachedGear = GearDB[currentGUID]
		cachedSpec = SpecDB[currentGUID]

		if cachedGear or forced then
			SetUnitInfo(cachedGear or CONTINUED, cachedSpec)
		end

		if not (IsShiftKeyDown() or forced) then
			if cachedGear and cachedSpec then return end
			if UnitAffectingCombat("player") then return end
		end

		if (not UnitIsVisible(unit)) then return end
		if UnitIsDeadOrGhost("player") or UnitOnTaxi("player") then return end
		if InspectFrame and InspectFrame:IsShown() then return end

		SetUnitInfo(CONTINUED, cachedSpec or CONTINUED)

		local timeSinceLastInspect = GetTime() - lastInspectRequest
		if (timeSinceLastInspect >= 1.5) then
			nextInspectRequest = 0
		else
			nextInspectRequest = 1.5 - timeSinceLastInspect
		end
		f:Show()
	end
end

--- Character Info Sheet ---
hooksecurefunc("PaperDollFrame_SetArmor", function(_, unit)
	if unit ~= "player" then return end

	local total, equip = GetAverageItemLevel()
	if total > 0 then total = string.format("%.1f", total) end
	if equip > 0 then equip = string.format("%.1f", equip) end

	local ilvl = equip
	if equip ~= total then
		ilvl = equip .. " / " .. total
	end

	PaperDollFrame_SetItemLevel(CharacterStatsPane.ItemLevelFrame, unit)
	CharacterStatsPane.ItemLevelCategory:Show()
	CharacterStatsPane.ItemLevelFrame:Show()
	CharacterStatsPane.ItemLevelFrame.Value:SetText(ilvl)
	CharacterStatsPane.AttributesCategory:SetPoint("TOP", CharacterStatsPane.ItemLevelFrame, "BOTTOM", 0, -10)
end)

--- Handle Events ---
f:SetScript("OnEvent", function(self, event, ...)
	if event == "UNIT_INVENTORY_CHANGED" then
		local unit = ...
		if UnitGUID(unit) == currentGUID then
			ScanUnit(unit, true)
		end
	elseif event == "INSPECT_READY" then
		local guid = ...
		if guid ~= currentGUID then return end

		local gear = UnitGear(currentUNIT)
		GearDB[currentGUID] = gear

		local spec = UnitSpec(currentUNIT)
		SpecDB[currentGUID] = spec

		if (not gear) or (not spec) then
			ScanUnit(currentUNIT, true)
		else
			SetUnitInfo(gear, spec)
		end
	end
end)

f:SetScript("OnUpdate", function(self, elapsed)
	nextInspectRequest = nextInspectRequest - elapsed
	if nextInspectRequest > 0 then return end

	self:Hide()

	if currentUNIT and (UnitGUID(currentUNIT) == currentGUID) then
		lastInspectRequest = GetTime()
		NotifyInspect(currentUNIT)
	end
end)

GameTooltip:HookScript("OnTooltipSetUnit", function(self)
	local _, unit = self:GetUnit()
	if (not unit) or (not CanInspect(unit)) then return end

	currentUNIT, currentGUID = unit, UnitGUID(unit)
	ScanUnit(unit)
end)