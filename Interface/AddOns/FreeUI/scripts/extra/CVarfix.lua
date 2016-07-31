C_Timer.After(.1, function() -- need to wait a bit
	if not InCombatLockdown() then
		-- 血条最远显示距离，7.0默认是60，7.0以前是40
		SetCVar("nameplateMaxDistance", 60)
		-- 禁止显示不在屏幕内单位的血条(血条贴在屏幕边缘)
		SetCVar("nameplateOtherTopInset", -1)
		SetCVar("nameplateOtherBottomInset", -1)
		-- tab的行为改回7.0以前，优先tab最近的单位
		SetCVar("TargetPriorityAllowAnyOnScreen", 0)
		SetCVar("Targetnearestuseold", 1)
		SetCVar("floatingCombatTextCombatDamageDirectionalScale", 1)
	end
end)