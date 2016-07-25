C_Timer.After(.1, function() -- need to wait a bit
	if not InCombatLockdown() then
		-- set distance back to 40 (down from 60)
		SetCVar("nameplateMaxDistance", 60)

		-- stop nameplates from clamping to screen
		SetCVar("nameplateOtherTopInset", -1)
		SetCVar("nameplateOtherBottomInset", -1)
	end
end)