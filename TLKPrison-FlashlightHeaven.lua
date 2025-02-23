-- FLASHLIGHT HEAVEN

if game.PlaceId ~= 6933626061 then
	return error("Wrong game!", 0)
end

local ExtraAbilities=getgenv().ExtraAbilities or loadstring(game:HttpGet("http://github.com/IvanTheProtogen/ExtraAbilities/raw/main/main.lua"))();

local active = false

ExtraAbilities.Chat("FLASHLIGHT HEAVEN made by IvanTheProtogen~")
task.spawn(function()
while true do
ExtraAbilities.NotifyRequest("FLASHLIGHT HEAVEN", "Made by IvanTheProtogen on GitHub.", "START")
active = true
ExtraAbilities.NotifyRequest("FLASHLIGHT HEAVEN", "Made by IvanTheProtogen on GitHub.", "STOP")
active = false
end
end)

while true do
if active then
pcall(function()

local myself = game:GetService("Players").LocalPlayer
local BP = myself.Backpack
local char = myself.Character

local CD = game:GetService("Workspace").Tools.Flashlight:FindFirstChildOfClass("ClickDetector")

local function GetFL()
	return BP:FindFirstChild("Flashlight") or char.Flashlight
end

while active do
	pcall(function()
		local FL = GetFL()
		FL.Parent = char
		FL.Parent = workspace
		fireclickdetector(CD)
	end)
	task.wait()
end

end)
end
task.wait()
end
