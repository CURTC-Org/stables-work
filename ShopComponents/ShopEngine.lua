local ReplicatedStorage = game:GetService("ReplicatedStorage")

local MerchBooth = require(ReplicatedStorage:WaitForChild("MerchBooth"))

local items = {
	201686108,
	201685685,
	201686851,
	201686500,
	201687350,
}

for _, assetId in ipairs(items) do
	local success, errorMessage = pcall(function()
		MerchBooth.addItemAsync(assetId, Enum.InfoType.GamePass)
	end)
	if not success then
		print(errorMessage)
	end
end