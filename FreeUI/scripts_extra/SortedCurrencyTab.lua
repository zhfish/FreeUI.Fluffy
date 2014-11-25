--[[

	Sorted Currency Tab - version 1.0 (11/24/14)
	Kirsia - Dalaran (US)

	Change Log
	==========
	1.0		- Initial Release
	==========

]]--

local SCT = CreateFrame("Frame")

local WoD = "Warlords of Draenor" -- needs to localize
local DaR = "Dungeon and Raid"

local oldGetCurrencyListInfo = GetCurrencyListInfo
local oldExpandCurrencyList = ExpandCurrencyList
local oldGetCurrencyListLink = GetCurrencyListLink
local oldSetCurrencyUnused = SetCurrencyUnused
local oldSetCurrencyBackpack = SetCurrencyBackpack
local oldGameTooltipSetCurrencyToken = GameTooltip.SetCurrencyToken

sct_data = {}

SCT.InitList = function(self)
	wipe(sct_data)

	for i=1,GetCurrencyListSize() do
		tinsert(sct_data,i)
	end

	local isMovingWoD = false
	local offset = 1
	local isMovingDaR = false
	local count = 0

	for i=1,#sct_data do
		local name, isHeader = GetCurrencyListInfo(i-count)

		--print (i, i-count, name, isHeader)

		if isHeader then -- found a header, stop moving currencies
			isMovingWoD = name == WoD
			isMovingDaR = name == DaR
		end

		if isMovingWoD then
			tinsert(sct_data, offset, sct_data[i-count]) -- insert at start, after # of already moved currencies
			tremove(sct_data,i-count+1) -- +1 since we added before
			offset = offset + 1
		elseif isMovingDaR then
			tinsert(sct_data, sct_data[i-count]) -- insert at end
			tremove(sct_data,i-count)
			count = count + 1
			--print("Count:", count)
		end
	end
end

GetCurrencyListInfo = function(index)
	if index < 1 then
		return nil
	elseif index > #sct_data then
		return oldGetCurrencyListInfo(index) -- just pass their index
	end

	return oldGetCurrencyListInfo(sct_data[index])
end

ExpandCurrencyList = function(index, value)
	if index < 1 then
		return nil
	elseif index > #sct_data then
		return oldExpandCurrencyList(index, value) -- just pass their index
	end
	local returnValues = { oldExpandCurrencyList(sct_data[index], value) }

	SCT:InitList()

	return unpack(returnValues)
end

GetCurrencyListLink = function(index)
	if index < 1 then
		return nil
	elseif index > #sct_data then
		return oldGetCurrencyListLink(index) -- just pass their index
	end

	return oldGetCurrencyListLink(sct_data[index])
end

SetCurrencyUnused = function(index, value)
	if index < 1 then
		return nil
	elseif index > #sct_data then
		return oldSetCurrencyUnused(index, value) -- just pass their index
	end
	local returnValues = { oldSetCurrencyUnused(sct_data[index], value) }

	SCT:InitList()

	return unpack(returnValues)
end

SetCurrencyBackpack = function(index, value)
	if index < 1 then
		return nil
	elseif index > #sct_data then
		return oldSetCurrencyBackpack(index, value) -- just pass their index
	end

	return oldSetCurrencyBackpack(sct_data[index], value)
end

GameTooltip.SetCurrencyToken = function(self, index)
	if index < 1 then
		return nil
	elseif index > #sct_data then
		return oldGameTooltipSetCurrencyToken(GameTooltip, index) -- just pass their index
	end

	return oldGameTooltipSetCurrencyToken(GameTooltip, sct_data[index])
end

SCT:RegisterEvent("PLAYER_ENTERING_WORLD")
SCT:SetScript("OnEvent", function(self, event)
	--print("Success");
	self:InitList()
end)