local F, C = unpack(select(2, ...))
if C.tooltip.enable ~= true or C.tooltip.ilvlspec ~= true then return end

--- Variables ---
local currentUNIT, currentGUID, scanTip
local GearDB, SpecDB, ItemDB = {}, {}, {}

local nextInspectRequest = 0
lastInspectRequest = 0

local prefixColor = "|cffffeeaa"
local detailColor = "|cffffffff"

local locale = GetLocale()
local gearPrefix
local specPrefix

if locale == "zhCN" or locale == "zhTW" then
	gearPrefix = "装等: "
	specPrefix = "专精: "
else
	gearPrefix = STAT_AVERAGE_ITEM_LEVEL .. ": "
	specPrefix = SPECIALIZATION .. ": "
end

--- Create Frame ---
local f = CreateFrame("Frame", "CloudyUnitInfo")
f:RegisterEvent("UNIT_INVENTORY_CHANGED")
f:RegisterEvent("INSPECT_READY")

local UpgradeTable = {
	[0]   =  0, [1]   =  8, [15]  = 10, [171] =  5, [373] =  4,
	[374] =  8, [375] =  4, [376] =  4, [377] =  4, [379] =  4,
	[380] =  4, [445] =  0, [446] =  4, [447] =  8, [451] =  0,
	[452] =  8, [453] =  0, [454] =  4, [455] =  8, [456] =  0,
	[457] =  8, [458] =  0, [459] =  4, [460] =  8, [461] = 12,
	[462] = 16, [465] =  0, [466] =  4, [467] =  8, [468] =  0,
	[469] =  4, [470] =  8, [471] = 12, [472] = 16, [476] =  0,
	[477] =  4, [478] =  8, [479] =  0, [480] =  8, [491] =  0,
	[492] =  4, [493] =  8, [494] =  0, [495] =  4, [496] =  8,
	[497] = 12, [498] = 16, [501] =  0, [502] =  4, [503] =  8,
	[504] = 12, [505] = 16, [506] = 20, [507] = 24, [529] =  0,
	[530] =  5, [531] = 10, [535] = 15,	[536] = 30,	[537] = 45,
	[538] =  0,
}

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

local Invasion = { 
	[138152] = 1, [138153] = 1, [138154] = 1, [138155] = 1,
	[138156] = 1, [138157] = 1, [138158] = 1, [138159] = 1,
	[138163] = 1, [138164] = 1, [138165] = 1, [138166] = 1,
	[138167] = 1, [138168] = 1, [138169] = 1, [138192] = 1,
	[138172] = 1, [138173] = 1, [138174] = 1, [138175] = 1,
	[138176] = 1, [138177] = 1, [138178] = 1, [138179] = 1,
	[138180] = 1, [138181] = 1, [138182] = 1, [138183] = 1,
	[138184] = 1, [138185] = 1, [138186] = 1, [138187] = 1,
	[138450] = 1, [141606] = 1, [141607] = 1, [141608] = 1,
	[141609] = 1, [141610] = 1, [141611] = 1, [141612] = 1,
	[141613] = 1, [141614] = 1, [141615] = 1, [141617] = 1, 
}

local OtherLegion = { 
}

--- BOA Item Level ---
local function BOALevel(ilvl, ulvl, id, upgrade)
	local level
	if ilvl == 1 then
		if Lv110_BOA[id] then
			return 815 - (110 - ulvl) * 10
		elseif ulvl > 100 then
			ulvl = 100
		elseif Lv100_BOA[id] then
		elseif Lv85_BOA[id] then
			if ulvl > 85 then ulvl = 85 end
		elseif Lv80_BOA[id] then
			if ulvl > 80 then ulvl = 80 end
		elseif ulvl > 90 and upgrade ~= 583 then
			ulvl = 90
		elseif ulvl > 60 and upgrade ~= 583 and upgrade ~= 582 then
			ulvl = 60
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
	elseif ilvl > 1 then
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

local function SpaceTimeLevel(upgrade, ilvl)
	local level
	if upgrade == 692 then
		if ilvl > 99 then
			level = 675
		elseif ilvl > 98 then
			level = 615
		elseif ilvl > 97 then
			level = 605
		elseif ilvl > 90 then
			level = 600 - (97 - ilvl) * 50 / 6
		elseif ilvl > 85 then
			level = 483 - (90 - ilvl) * 20.75
		elseif ilvl > 80 then
			level = 350 - (85 - ilvl) * 12.5
		elseif ilvl == 80 then
			level = 200
		else
			level = 10
		end
	else
		if ilvl > 99 then
			level = 660
		elseif ilvl > 98 then
			level = 605
		elseif ilvl > 97 then
			level = 598
		elseif ilvl > 90 then
			level = 590 - (97 - ilvl) * 10
		elseif ilvl > 85 then
			level = 463 - (90 - ilvl) * 19.75
		elseif ilvl > 80 then
			level = 333 - (85 - ilvl) * 13.5
		elseif ilvl > 67 then
			level = 187 - (80 - ilvl) * 4
		elseif ilvl > 57 then
			level = 105 - (67 - ilvl) * 26 / 9
		elseif ilvl > 10 then
			level = ilvl + 5
		else
			level = 10
		end
		if upgrade == 656 then
			if ilvl > 99 then
				level = level + 15
			elseif ilvl > 98 then
				level = level + 10
			else
				level = level + 6
			end
		end
	end
	return floor(level + 0.5)
end

local function InvasionLevel(upgrade, ilvl)
	local level
	if ilvl > 99 then
		level = 700
	elseif ilvl > 97 then
		level = 700 - (100 - ilvl) * 30
	elseif ilvl > 90 then
		level = 600 - (97 - ilvl) * 10
	elseif ilvl > 85 then
		level = 463 - (90 - ilvl) * 19.75
	elseif ilvl > 80 then
		level = 333 - (85 - ilvl) * 13.5
	elseif ilvl > 67 then
		level = 187 - (80 - ilvl) * 4
	elseif ilvl > 57 then
		level = 105 - (67 - ilvl) * 26 / 9
	elseif ilvl > 10 then
		level = ilvl + 5
	else
		level = 10
	end
	if upgrade == 3388 then
		if ilvl > 97 then
			level = level + 10
		end
	elseif upgrade == 3389 then
		if ilvl > 97 then
			level = level + 20
		elseif ilvl > 4 then
			level = level + 10
		elseif ilvl > 3 then
			level = level + 8
		elseif ilvl > 2 then
			level = level + 5
		elseif ilvl > 1 then
			level = level + 2
		end
	end
	return floor(level + 0.5)
end

--- Unit Gear Info ---
local function UnitGear(unit)
	if (not unit) or (UnitGUID(unit) ~= currentGUID) then return end

	local ulvl = UnitLevel(unit)
	local class = select(2, UnitClass(unit))

	local boa, twohand, ilvl, total, delay = 0, 1, 0, 0, nil

	for i = 1, 17 do
		if i ~= 4 then
			local itemTexture = GetInventoryItemTexture(unit, i)

			if itemTexture then
				local itemLink = GetInventoryItemLink(unit, i)

				if (not itemLink) then
					delay = true
				else
					local id = strmatch(itemLink, "item:(%d+)")
					id = tonumber(id) or 7
					local _, _, quality, lvl, _, _, _, _, slot = GetItemInfo(itemLink)
					local Instance, _, numBonus, bonus = select(12, strsplit(":", itemLink, 15))
					Instance = tonumber(Instance) or 7
					numBonus = tonumber(numBonus) or 0
					local bonus1, bonus2
					if numBonus > 0 then
						bonus1, bonus2 = select(numBonus, strsplit(":", bonus))
					else
						bonus2 = select(1, strsplit(":", bonus))
					end
					bonus1 = tonumber(bonus1) or 0
					bonus2 = tonumber(bonus2) or 0

					if (not quality) or (not lvl) then
						delay = true
					else
						if quality == 7 then
							boa = boa + 1
							level = BOALevel(lvl, ulvl, id, bonus1)
						elseif Invasion[id] then
							level = InvasionLevel(bonus1, bonus2)
						elseif Instance == 512 then
							level = SpaceTimeLevel(bonus1, bonus2)
						else
							local upgradeScore
							upgradeScore = UpgradeTable[bonus2] or 0
							level = lvl + upgradeScore
						end

						if i == 16 then
							if slot == "INVTYPE_RANGED" or slot == "INVTYPE_RANGEDRIGHT" then
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
