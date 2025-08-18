local lp = game:service("Players").LocalPlayer
local rgui = game:service("CoreGui"):WaitForChild("RobloxGui")

if rgui:FindFirstChild("droptool") then
	for _,v in rgui:GetChildren() do
		if v.Name == "droptool" then
			v:Destroy()
		end
	end
end

local btn = Instance.new("TextButton",rgui)
btn.Name = "droptool"
btn.AnchorPoint = Vector2.new(0.5,1)
btn.Position = UDim2.new(0.5,0,1,-68)
btn.Size = UDim2.new(0,60,0,20)
btn.BorderSizePixel = 0
btn.BackgroundColor3 = Color3.new(0,0,0)
btn.BackgroundTransparency = 2/3
btn.TextColor3 = Color3.new(1,1,1)
btn.Text = "Drop"

local conA = game:service("RunService").Heartbeat:Connect(function()
	local char = lp.Character
	if char then
		local tool = char:FindFirstChildWhichIsA("Tool")
		btn.Visible = tool and tool.CanBeDropped
	end
end)

local conB = btn.MouseButton1Click:Connect(function()
	local char = lp.Character
	if char then
		local tool = char:FindFirstChildWhichIsA("Tool")
		if tool and tool.CanBeDropped then
			for _,v in char:GetChildren() do
				if v:IsA("Tool") then
					v.Parent = workspace
				end
			end
		end
	end
end)

btn.Destroying:Once(function()
	conA:Disconnect()conA=nil
	conB:Disconnect()conB=nil
end)
