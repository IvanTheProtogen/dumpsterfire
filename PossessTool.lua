-- POSSESS TOOL
-- Works on any humanoid
-- Only if you're the network owner

local lp = game:GetService("Players").LocalPlayer
local mouse = lp:GetMouse()

local tool
local function main(char)

if tool and tool.Parent then return tool end
local possessed = false

tool = Instance.new("Tool")
tool.Name = "Possess"
tool.ToolTip = "Possess some character by clicking on them."
tool.RequiresHandle = false
tool.Activated:Connect(function()
	local trg = mouse.Target
	while trg~=workspace or trg~=game or trg~=nil do
		trg=trg.Parent
		if trg:IsA("Model") and trg:FindFirstChildOfClass("Humanoid") then
			possessed = true
			tool.Name = "Unpossess"
			tool.ToolTip = "Equip to unpossess."
			tool.Parent = lp.Backpack
			lp.Character = trg
			workspace.CurrentCamera.CameraSubject = trg:FindFirstChildOfClass("Humanoid")
			return
		end
	end
end)
tool.Equipped:Connect(function()
	if possessed then
		possessed = false
tool.Name = "Possess"
tool.ToolTip = "Possess some character by clicking on them."
		tool.Parent = lp.Backpack
		lp.Character = char
		workspace.CurrentCamera.CameraSubject = char:FindFirstChildOfClass("Humanoid")
	end
end)
tool.Parent = lp:WaitForChild("Backpack")
return tool

end

lp.CharacterAdded:Connect(main)
pcall(main,lp.Character)
