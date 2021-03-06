local F, C = unpack(select(2, ...))
if C.tooltip.enable ~= true or C.tooltip.ilvlspec ~= true then return end

--[[
	by aliluya555
]]


--- Variables ---
if (type(LibItemLevel) ~= "table") then return end
FreeUI_ftipUnitDB = FreeUI_ftipUnitDB or {}

local _, _G = _, _G
local LIL = LibItemLevel

local prefixColor, detailColor = "|cffffeeaa", "|cffffffff"
local nextInspectRequest, lastInspectRequest = 0, 0
local nextScanRequest, lastScanRequest = 0, 0
local currentUNIT, currentGUID, inspectUpdate
local LFG_LIST_LOADING = _G["LFG_LIST_LOADING"]
local UNKNOWN = _G["UNKNOWN"]
local FAILED = _G["FAILED"]
local NONE = _G["NONE"]

local locale = GetLocale()
local gearPrefix, specPrefix

if (locale == "zhCN") then
	gearPrefix = "装等: "
	specPrefix = "专精: "
elseif (locale == "zhTW") then
	gearPrefix = "裝等: "
	specPrefix = "專精: "
else
	gearPrefix = STAT_AVERAGE_ITEM_LEVEL..": "
	specPrefix = SPECIALIZATION..": "
end

--- Create Frame ---
local f = CreateFrame("Frame", "FreeUI_ftipUnitInfo")
f:RegisterEvent("UNIT_INVENTORY_CHANGED")
f:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
f:RegisterEvent("INSPECT_READY")
f:Hide()

--- Set Unit Info ---
local function SetUnitInfo(gear, spec)
	if (not gear and not spec) then return end

	local _, unit = GameTooltip:GetUnit()
	if (not unit or UnitGUID(unit) ~= currentGUID) then return end

	local gearLine, specLine
	for i = 2, GameTooltip:NumLines() do
		local line = _G["GameTooltipTextLeft"..i]
		local text = line:GetText()

		if (text) then
			if (strfind(text, gearPrefix)) then
				gearLine = line
			elseif (strfind(text, specPrefix)) then
				specLine = line
			end
		end
	end

	if (gear) then
		gear = prefixColor..gearPrefix..detailColor..gear
		if (gearLine) then
			gearLine:SetText(gear)
		else
			GameTooltip:AddLine(gear)
		end
	end

	if (spec) then
		spec = prefixColor..specPrefix..detailColor..spec
		if (specLine) then
			specLine:SetText(spec)
		else
			GameTooltip:AddLine(spec)
		end
	end

	GameTooltip:Show()
end

--- Player Specialization ---
local function PlayerSpec()
	if (UnitLevel("player") <= 10) then return NONE end

	local specIndex = GetSpecialization()
	if (specIndex) then
		return select(2, GetSpecializationInfo(specIndex))
	else
		return NONE
	end
end

--- Player Gear Info ---
local function PlayerGear()
	local _, gear = GetAverageItemLevel()
	if (gear > 0) then
		return format("%.1f", gear) 
	else
		return 0
	end
end

--- Unit Specialization ---
local function UnitSpec(unit)
	if (not unit or UnitGUID(unit) ~= currentGUID) then return end
	if (UnitLevel(unit) <= 10) then return NONE end

	local specID = GetInspectSpecialization(unit)
	if (specID and specID > 0) then
		return select(2, GetSpecializationInfoByID(specID))
	end
end

--- Unit Gear Info ---
local function UnitGear(unit)
	if (not unit or UnitGUID(unit) ~= currentGUID) then return end
	local gear, unknown, boa, pvp = LIL:GetUnitItemLevel(unit)

	if (gear > 0) then gear = format("%.1f", gear) end
	if (unknown == 0) then
		if (boa > 0) then gear = gear.." |cffe6cc80"..boa.." BOA" end
		if (pvp > 0) then gear = gear.." |cffa335ee"..pvp.." PVP" end
		return gear
	else
		if (gear == 0) then gear = FAILED end
		gear = gear.." |cffff0000"..unknown.." "..UNKNOWN
		return nil, gear
	end
end

--- Scan Current Unit ---
local function ScanUnit(unit, forced)
	if (UnitIsUnit(unit, "player")) then
		SetUnitInfo(PlayerGear(), PlayerSpec())
	else
		if (not unit or UnitGUID(unit) ~= currentGUID) then return end
		local Time, cachedGear, cachedSpec = GetTime()
		local timeSinceLastInspect = Time - lastInspectRequest
		inspectUpdate = not FreeUI_ftipUnitDB[currentGUID] or IsShiftKeyDown() or forced

		if (FreeUI_ftipUnitDB[currentGUID]) then
			if (Time - (FreeUI_ftipUnitDB[currentGUID].Update or 0) > 1800) then
				inspectUpdate = true
			else
				if ((FreeUI_ftipUnitDB[currentGUID].ScanUnit or 0) > 0) then
					if (not FreeUI_ftipUnitDB[currentGUID].Spec) then
						FreeUI_ftipUnitDB[currentGUID].Spec = UnitSpec(unit)
					end

					if (not FreeUI_ftipUnitDB[currentGUID].Gear) then
						FreeUI_ftipUnitDB[currentGUID].Gear = UnitGear(unit)
					end
				end

				cachedSpec = FreeUI_ftipUnitDB[currentGUID].Spec
				cachedGear = FreeUI_ftipUnitDB[currentGUID].Gear

				if (not cachedSpec) then
					if (Time - lastScanRequest > 3.5) then
						cachedSpec = FAILED
					end
				end

				if (not cachedGear) then
					if (Time - lastScanRequest > 3.5) then
						_, cachedGear = UnitGear(unit)
					elseif (timeSinceLastInspect > 1.5) then
						inspectUpdate = true
					end
				elseif (cachedGear == 0) then
					inspectUpdate = true
					cachedGear = nil
				end
			end
		end

		if (cachedGear or cachedSpec) then
			SetUnitInfo(cachedGear or LFG_LIST_LOADING, cachedSpec or LFG_LIST_LOADING)
		end

		if (not inspectUpdate) then
			if (cachedGear and cachedSpec) then return end
			if (UnitAffectingCombat("player")) then return end
		end

		if (not UnitIsVisible(unit)) then return end
		if (UnitIsDeadOrGhost("player") or UnitOnTaxi("player")) then return end
		if (InspectFrame and InspectFrame:IsShown()) then return end

		SetUnitInfo(LFG_LIST_LOADING, cachedSpec or LFG_LIST_LOADING)

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
	if (unit ~= "player") then return end

	local total, equip = GetAverageItemLevel()
	if (total > 0) then total = format("%.1f", total) end
	if (equip > 0) then equip = format("%.1f", equip) end

	local ilvl = equip
	if (equip ~= total) then
		ilvl = equip.." / "..total
	end

	PaperDollFrame_SetItemLevel(CharacterStatsPane.ItemLevelFrame, unit)
	CharacterStatsPane.ItemLevelCategory:Show()
	CharacterStatsPane.ItemLevelFrame:Show()
	CharacterStatsPane.ItemLevelFrame.Value:SetText(ilvl)
	CharacterStatsPane.AttributesCategory:SetPoint("TOP", CharacterStatsPane.ItemLevelFrame, "BOTTOM", 0, -10)
end)

--- Handle Events ---
f:SetScript("OnEvent", function(self, event, ...)
    if (event == "UPDATE_MOUSEOVER_UNIT" and CanInspect("mouseover")) then
		lastScanRequest = GetTime()
		currentUNIT, currentGUID = "mouseover", UnitGUID("mouseover")
		if (FreeUI_ftipUnitDB[currentGUID]) then
			FreeUI_ftipUnitDB[currentGUID].ScanUnit = 0
		end
		nextScanRequest = 0.5
		ScanUnit(currentUNIT)
	elseif (event == "INSPECT_READY") then
		local guid = ...
		if (guid == currentGUID) then
			if (not FreeUI_ftipUnitDB[currentGUID]) then
				FreeUI_ftipUnitDB[currentGUID] = {}
			end

			local spec = UnitSpec(currentUNIT)
			local gear = UnitGear(currentUNIT)

			FreeUI_ftipUnitDB[currentGUID].Gear = gear
			FreeUI_ftipUnitDB[currentGUID].Spec = spec
			FreeUI_ftipUnitDB[currentGUID].Update = GetTime()
			FreeUI_ftipUnitDB[currentGUID].Inspect = (FreeUI_ftipUnitDB[currentGUID].Inspect or 0) + (spec and 1 or 0)
			FreeUI_ftipUnitDB[currentGUID].ScanUnit = FreeUI_ftipUnitDB[currentGUID].ScanUnit or 0

			if (FreeUI_ftipUnitDB[currentGUID].Inspect <= 1 and (not spec or gear == 0)) then
				ScanUnit(currentUNIT, true)
			elseif (not (gear and spec)) then
				ScanUnit(currentUNIT)
			else
				SetUnitInfo(gear, spec)
			end
		end
	elseif (event == "UNIT_INVENTORY_CHANGED") then
		local unit = ...
		if (UnitGUID(unit) == currentGUID) then
			ScanUnit(unit, true)
		end
	end
end)

f:SetScript("OnUpdate", function(self, elapsed)
	if (currentUNIT and UnitGUID(currentUNIT) == currentGUID) then
		if (inspectUpdate) then
			nextInspectRequest = nextInspectRequest - elapsed
			if (nextInspectRequest > 0) then return end
			self:Hide()

			lastInspectRequest = GetTime()
			NotifyInspect(currentUNIT)
		else
			nextScanRequest = nextScanRequest + elapsed
			if (nextScanRequest < 0.5) then return end
			self:Hide()

			if (FreeUI_ftipUnitDB[currentGUID]) then
				FreeUI_ftipUnitDB[currentGUID].ScanUnit = (FreeUI_ftipUnitDB[currentGUID].ScanUnit or 0) + 1
				nextScanRequest = 0.5 - min(0.5, FreeUI_ftipUnitDB[currentGUID].ScanUnit / 10)
			else
				nextScanRequest = 0.5
			end
			ScanUnit(currentUNIT)
		end
	end
end)