game:service("NetworkClient"):SetOutgoingKBPSLimit(0)

local NS = settings():service("NetworkSettings")
local IRL = "IncomingReplicationLag"
local lagswitch
local red = Color3.new(1,0,0)
local green = Color3.new(0,1,0)

local rgui = game:service("CoreGui"):WaitForChild("RobloxGui")
if rgui:FindFirstChild("lagswitch") then
	for _,v in rgui:GetChildren() do
		if v.Name=="lagswitch" then v:Destroy() end
	end
end
local btn = Instance.new("TextButton",rgui)
btn.Name = "lagswitch"
btn.AnchorPoint = Vector2.new(0.5,1)
btn.Size = UDim2.new(0,80,0,20)
btn.Position = UDim2.new(0.25,65,1,-10)
btn.BackgroundColor3 = Color3.new(0.07,0.07,0.07)
btn.BorderSizePixel = 0
btn.TextColor3 = red
btn.Text = "Lagswitch"
btn.Active = true

local con = btn.MouseButton1Click:Connect(function()
	lagswitch = not lagswitch
	if lagswitch then
		btn.TextColor3 = green
		NS[IRL] = math.huge
		return
	end
	btn.TextColor3 = red
	NS[IRL] = 0
end)

btn.Destroying:Once(function()
	con:Disconnect()
	NS[IRL] = 0
end)

NS[IRL] = 0
