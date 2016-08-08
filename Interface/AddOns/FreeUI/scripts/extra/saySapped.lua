local F, C, L = unpack(select(2, ...))

if not C.automation.saySapped then return end

-- Say Sapped

local DefsSapped=CreateFrame("Frame")
local DefsSappedEventHandlers={}
local playerName=nil

local function DefsSappedRestingCheck()
	if IsResting() then
		if DefsSapped:IsEventRegistered("COMBAT_LOG_EVENT_UNFILTERED") then DefsSapped:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED") end
		if DefsSapped:IsEventRegistered("PLAYER_REGEN_DISABLED") then DefsSapped:UnregisterEvent("PLAYER_REGEN_DISABLED") end
		if DefsSapped:IsEventRegistered("PLAYER_REGEN_ENABLED") then DefsSapped:UnregisterEvent("PLAYER_REGEN_ENABLED") end
	else
		if not DefsSapped:IsEventRegistered("PLAYER_REGEN_DISABLED") then DefsSapped:RegisterEvent("PLAYER_REGEN_DISABLED") end
		if not DefsSapped:IsEventRegistered("PLAYER_REGEN_ENABLED") then DefsSapped:RegisterEvent("PLAYER_REGEN_ENABLED") end
		if not InCombatLockdown() and not DefsSapped:IsEventRegistered("COMBAT_LOG_EVENT_UNFILTERED") then DefsSapped:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED") end
	end
end

local function DefsSappedPlayerEnteringWorld()
	local _,instanceType,_,_,_,_,_,instanceMapID=GetInstanceInfo() --> Leaving InstanceMapID for edge cases if any ever arise.  Need to check on Ashran==1191 Tol Barad=732 >>> and not instanceMapID==1191 and not instanceMapID==732
	if instanceType=="scenario" or instanceType=="party" or instanceType=="raid" then --> Disables while in a scenario, dungeon, or a raid.
		if DefsSapped:IsEventRegistered("ZONE_CHANGED") then
			DefsSapped:UnregisterEvent("ZONE_CHANGED")
			DefsSapped:UnregisterEvent("ZONE_CHANGED_INDOORS")
			DefsSapped:UnregisterEvent("ZONE_CHANGED_NEW_AREA")
		end
		if DefsSapped:IsEventRegistered("COMBAT_LOG_EVENT_UNFILTERED") then DefsSapped:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED") end
		if DefsSapped:IsEventRegistered("PLAYER_REGEN_DISABLED") then DefsSapped:UnregisterEvent("PLAYER_REGEN_DISABLED") end
		if DefsSapped:IsEventRegistered("PLAYER_REGEN_ENABLED") then DefsSapped:UnregisterEvent("PLAYER_REGEN_ENABLED") end
	elseif instanceType=="arena" or instanceType=="pvp" then --> Disables checking for resting state in arenas and battlegrounds.
		if DefsSapped:IsEventRegistered("ZONE_CHANGED") then
			DefsSapped:UnregisterEvent("ZONE_CHANGED")
			DefsSapped:UnregisterEvent("ZONE_CHANGED_INDOORS")
			DefsSapped:UnregisterEvent("ZONE_CHANGED_NEW_AREA")
		end
		if not DefsSapped:IsEventRegistered("PLAYER_REGEN_DISABLED") then DefsSapped:RegisterEvent("PLAYER_REGEN_DISABLED") end
		if not DefsSapped:IsEventRegistered("PLAYER_REGEN_ENABLED") then DefsSapped:RegisterEvent("PLAYER_REGEN_ENABLED") end
		if not InCombatLockdown() and not DefsSapped:IsEventRegistered("COMBAT_LOG_EVENT_UNFILTERED") then DefsSapped:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED") end
	else --> Enables everywhere else and checks for resting state 5 seconds after changing zones or subzones.
		if not DefsSapped:IsEventRegistered("ZONE_CHANGED") then
			DefsSapped:RegisterEvent("ZONE_CHANGED")
			DefsSapped:RegisterEvent("ZONE_CHANGED_INDOORS")
			DefsSapped:RegisterEvent("ZONE_CHANGED_NEW_AREA")
		end
		DefsSappedRestingCheck()
	end
end

local function DefsSapped_event_Handler(self,event,...)
	return DefsSappedEventHandlers[event](...)
end

function DefsSappedEventHandlers.COMBAT_LOG_EVENT_UNFILTERED(_,event,_,_,sourceName,_,_,_,destName,_,_,spellID)
	if spellID==6770 and destName==playerName and (event=="SPELL_AURA_APPLIED" or event=="SPELL_AURA_REFRESH") then
		SendChatMessage("{rt8} Sapped {rt8}","SAY")
		if sourceName then
			DEFAULT_CHAT_FRAME:AddMessage("Sapped by: "..sourceName)
		end
	end
end

function DefsSappedEventHandlers.PLAYER_ENTERING_WORLD()
	DefsSappedPlayerEnteringWorld()
end

function DefsSappedEventHandlers.PLAYER_LOGIN()
	playerName=GetUnitName("player")
	DefsSapped:UnregisterEvent("PLAYER_LOGIN")
end

function DefsSappedEventHandlers.PLAYER_REGEN_DISABLED()
	DefsSapped:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
end

function DefsSappedEventHandlers.PLAYER_REGEN_ENABLED()
	DefsSapped:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
end

function DefsSappedEventHandlers.ZONE_CHANGED()
	C_Timer.After(5,DefsSappedRestingCheck)
end

function DefsSappedEventHandlers.ZONE_CHANGED_INDOORS()
	C_Timer.After(5,DefsSappedRestingCheck)
end

function DefsSappedEventHandlers.ZONE_CHANGED_NEW_AREA()
	C_Timer.After(5,DefsSappedRestingCheck)
end

DefsSapped:RegisterEvent("PLAYER_ENTERING_WORLD")
DefsSapped:RegisterEvent("PLAYER_LOGIN")
DefsSapped:SetScript("OnEvent",DefsSapped_event_Handler)