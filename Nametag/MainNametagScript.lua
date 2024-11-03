-- REMOVE THIS LINE WHEN DOWNLOADED
-- YOU ARE SUPPOSED TO PUT THIS SCRIPT AT SERVERSCRIPTSERVICE, AND THE BILLBOARD UI AT REPLICATEDSTORAGE

local Storage = game:GetService("ReplicatedStorage")
local NameTag = Storage.Tags
local Whitelisted = {"stablestream", "2codeDev", "FrankieFms", "NafjanBoy", "FabulousTrophies", "ddrxpyz", "SilverPlatinums", "Piam100", "Emiratti"}

game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(char)
		local isWhitelisted = false
		for _, username in ipairs(Whitelisted) do
			if player.Name == username then
				isWhitelisted = true
				break
			end
		end

		local tag = NameTag:Clone()
		tag.Parent = char.HumanoidRootPart

		if player.MembershipType == Enum.MembershipType.Premium then
			if player.HasVerifiedBadge or isWhitelisted then
				print("Has Premium and is verified")
				tag.TextLabel.Text = utf8.char(0xE001) .. " " .. player.DisplayName .. "" .. utf8.char(0xE000)
			else
				print("Has Premium")
				tag.TextLabel.Text = utf8.char(0xE001) .. " " .. player.DisplayName
			end
		else
			if player.HasVerifiedBadge or isWhitelisted then
				print("Is verified")
				tag.TextLabel.Text = player.DisplayName .. "" .. utf8.char(0xE000)
			else
				print("Normal player")
				tag.TextLabel.Text = player.DisplayName
			end
		end

		char.Humanoid.DisplayDistanceType = "None"
	end)
end)
