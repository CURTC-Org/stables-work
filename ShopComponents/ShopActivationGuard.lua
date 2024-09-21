local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")

local MerchBooth = require(ReplicatedStorage:WaitForChild("MerchBooth"))

MerchBooth.toggleCatalogButton(false)

local function setupRegion(region: BasePart)
	region.Touched:Connect(function(otherPart)
		local character = Players.LocalPlayer.Character
		if character and otherPart == character.PrimaryPart then
			MerchBooth.openMerchBooth()
		end
	end)

	region.TouchEnded:Connect(function(otherPart)
		local character = Players.LocalPlayer.Character
		if character and otherPart == character.PrimaryPart then
			MerchBooth.closeMerchBooth()
		end
	end)
end

-- Iterate through existing tagged shop regions
for _, region in CollectionService:GetTagged("ShopRegion") do
	setupRegion(region)
end
-- Detect when non-streamed shop regions stream in
CollectionService:GetInstanceAddedSignal("ShopRegion"):Connect(setupRegion)