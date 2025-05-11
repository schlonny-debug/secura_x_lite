local Players = game:GetService("Players")
print([[this game uses:

 ____                             __  __  _     _ _       
/ ___|  ___  ___ _   _ _ __ __ _  \ \/ / | |   (_) |_ ___ 
\___ \ / _ \/ __| | | | '__/ _` |  \  /  | |   | | __/ _ \
 ___) |  __/ (__| |_| | | | (_| |  /  \  | |___| | ||  __/
|____/ \___|\___|\__,_|_|  \__,_| /_/\_\ |_____|_|\__\___|

]])

local MAX_WALKSPEED = 16
local MAX_JUMPPOWER = 50
local MAX_HIPHEIGHT = 2
local CHECK_INTERVAL = 1
local MAX_HEALTH = 100

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		task.wait(1)
		local humanoid = character:FindFirstChildWhichIsA("Humanoid")
		local root = character:FindFirstChild("HumanoidRootPart")
		if not humanoid or not root then return end

		while character:IsDescendantOf(game) and player:IsDescendantOf(Players) do
			if humanoid.WalkSpeed > MAX_WALKSPEED + 1 then
				player:Kick("Speed exploit")
				break
			end
			if humanoid.JumpPower > MAX_JUMPPOWER + 1 then
				player:Kick("JumpPower exploit")
				break
			end
			if humanoid.HipHeight > MAX_HIPHEIGHT then
				player:Kick("HipHeight exploit")
				break
			end
			if humanoid.Health > MAX_HEALTH then
				player:Kick("Health exploit")
				break
			end
			if humanoid:GetState() == Enum.HumanoidStateType.StrafingNoPhysics then
				player:Kick("Noclip exploit")
				break
			end
			if character:FindFirstChildOfClass("Decal") and character:FindFirstChildOfClass("Decal").Transparency == 1 then
				player:Kick("Invisibility exploit")
				break
			end
			task.wait(CHECK_INTERVAL)
		end
	end)
end)

-- this version is ultra limited since its free.
--(this will not be updated)
