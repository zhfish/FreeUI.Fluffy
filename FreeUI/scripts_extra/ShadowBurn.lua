
if select(2, UnitClass("player")) ~= "WARLOCK" then
	return
end
 
local f = CreateFrame("frame","xanShadowBurn_frame",UIParent)
f:SetScript("OnEvent", function(self, event, ...) if self[event] then return self[event](self, event, ...) end end)

local isShown = false

local TimerOnUpdate = function(self, time)
	--only do this if we even have the shadowburn spell in our spellbook and we can attack the target
	if UnitName("target") and UnitGUID("target") and UnitCanAttack("player", "target") and IsSpellKnown(17877) then
		self.OnUpdateCounter = (self.OnUpdateCounter or 0) + time
		if self.OnUpdateCounter < 0.05 then return end
		self.OnUpdateCounter = 0
		
		if UnitIsDeadOrGhost("target") then
			isShown = false
			SpellActivationOverlay_HideOverlays(SpellActivationOverlayFrame, 17877)
			f:SetScript("OnUpdate", nil)
			return
		end
		
		local percent = UnitHealth("target") / UnitHealthMax("target") * 100
		if percent <= 20 and isShown == false then
			isShown = true --this is to prevent spamming of it while the mob is still under 20
			--SpellActivationOverlay_ShowOverlay(SpellActivationOverlayFrame, 17877, "TEXTURES\\SPELLACTIVATIONOVERLAYS\\Berserk.BLP", "LEFT", 1, 255, 255, 255, false, false)
			SpellActivationOverlay_ShowOverlay(SpellActivationOverlayFrame, 17877, "TEXTURES\\SPELLACTIVATIONOVERLAYS\\Sudden_Death.BLP", "LEFT", 1, 255, 255, 255, false, false)
		elseif percent <= 20 and isShown == true then
			--do nothing
		else
			isShown = false
			SpellActivationOverlay_HideOverlays(SpellActivationOverlayFrame, 17877)
		end
	else
		SpellActivationOverlay_HideOverlays(SpellActivationOverlayFrame, 17877)
		f:SetScript("OnUpdate", nil)
		isShown = false
		return
	end
	
end

function f:PLAYER_LOGIN()

	f:RegisterEvent("PLAYER_TARGET_CHANGED")
	
	self:UnregisterEvent("PLAYER_LOGIN")
	self.PLAYER_LOGIN = nil
end

function f:PLAYER_TARGET_CHANGED()
	--only do this if we even have the shadowburn spell in our spellbook and we can attack the target
	if UnitName("target") and UnitGUID("target") and UnitIsEnemy("player", "target") and IsSpellKnown(17877) then
		isShown = false
		f:SetScript("OnUpdate", TimerOnUpdate)
	end
end


if IsLoggedIn() then f:PLAYER_LOGIN() else f:RegisterEvent("PLAYER_LOGIN") end