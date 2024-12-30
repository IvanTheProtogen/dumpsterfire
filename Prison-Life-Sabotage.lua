local handle = game:GetService("Players").LocalPlayer.Character["Key card"].Handle
local doors = workspace.Doors

ExtraAbilities.Chat("SABOTAGE INITIATED ////////// SECURITY HAS BEEN BREACHED")

game:GetService("Players").LocalPlayer.Character.Humanoid.Died:Once(function()
	ExtraAbilities.Chat("SABOTAGE FIXED ////////// SECURITY HAS BEEN RESTORED")
end)

while true do
for i,v in pairs(doors:GetChildren()) do
if v:FindFirstChild("block") then
if v.block:FindFirstChild("hitbox") then
if v.block.hitbox:IsA("BasePart") then
handle.Position = v.block.hitbox.Position
task.wait()
end
end
end
end
task.wait()
end
