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
