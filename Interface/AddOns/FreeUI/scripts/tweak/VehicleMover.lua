-- vehicle seat indicator
hooksecurefunc(VehicleSeatIndicator,"SetPoint",function(_,_,parent)
	if (parent == "MinimapCluster") or (parent == _G["MinimapCluster"]) then
		VehicleSeatIndicator:ClearAllPoints()
			VehicleSeatIndicator:SetPoint("LEFT", UIParent, "LEFT", 45, 120)
		end

end)