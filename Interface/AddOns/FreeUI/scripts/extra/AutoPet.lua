local F, C, L = unpack(select(2, ...))

local eventframe = CreateFrame('Frame')
eventframe:SetScript('OnEvent', function(self, event, ...)
	eventframe[event](self, ...)
end)

--Random Pet
local function SummonPet(fav)
	C_Timer.After(3, function() 
		local active = C_PetJournal.GetSummonedPetGUID()
		if not active and not UnitOnTaxi("player") then		
			if fav then
				C_PetJournal.SummonRandomPet(false)
			else
				C_PetJournal.SummonRandomPet(true)
			end
		end		
	end)
end

--if autopet then
	eventframe:RegisterEvent("PLAYER_ENTERING_WORLD")
	eventframe:RegisterEvent("PLAYER_CONTROL_GAINED")
	eventframe:RegisterEvent("UNIT_EXITED_VEHICLE")
	eventframe:RegisterEvent("PLAYER_ALIVE")

	function eventframe:PLAYER_ENTERING_WORLD()
		SummonPet()
	end

	function eventframe:PLAYER_CONTROL_GAINED()
		SummonPet()
	end

	function eventframe:UNIT_EXITED_VEHICLE()
		SummonPet()
	end

	function eventframe:PLAYER_ALIVE()
		SummonPet()
	end
--end

--[[-----------------------------------------------------------------------------
LFG Call to Arms rewards
-------------------------------------------------------------------------------]]

--744 Random Timewalker Dungeon 
--788 Random Warlords of Draenor Dungeon 
--789 Random Warlords of Draenor Heroic 

-- if LFGRewards then
 	eventframe:RegisterEvent("LFG_UPDATE_RANDOM_INFO")
-- end

local LFG_Timer = 0

function eventframe:LFG_UPDATE_RANDOM_INFO()
	local eligible, forTank, forHealer, forDamage = GetLFGRoleShortageRewards(789, LFG_ROLE_SHORTAGE_RARE)
	local IsTank, IsHealer, IsDamage = C_LFGList.GetAvailableRoles()
	
	local ingroup, tank, healer, damager, result
	
	tank = IsTank and forTank and "|cff00B2EE"..TANK.."|r" or ""
	healer = IsHealer and forHealer and "|cff00EE00"..HEALER.."|r" or ""
	damager = IsDamage and forDamage and "|cff00EE00"..DAMAGER.."|r" or ""
	
	if IsInGroup(LE_PARTY_CATEGORY) or IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
		ingroup = true
	end
	
	if ((IsTank and forTank) or (IsHealer and forHealer) or (IsDamage and forDamage)) and not ingroup then
		if  GetTime() - LFG_Timer > 20 then -- 不要刷屏！
			PlaySoundFile("Sound\\Interface\\RaidWarning.wav")
			RaidNotice_AddMessage(RaidWarningFrame, format(LFG_CALL_TO_ARMS, tank.." "..healer.." "..damager), ChatTypeInfo["RAID_WARNING"])
			print(format(LFG_CALL_TO_ARMS, tank.." "..healer.." "..damager))
			LFG_Timer = GetTime()
		end
	end
end

