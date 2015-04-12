local F, C = unpack(select(2, ...))

local ShowTreasures = C.general.showtreasures

-- toggle treasures "197" POIs
hooksecurefunc("WorldMapFrame_Update",function()
	if not ShowTreasures then
		for i=1,GetNumMapLandmarks() do
			if select(3,GetMapLandmarkInfo(i))==197 then
				_G["WorldMapFramePOI"..i]:Hide()
			end
		end
	end
end)
