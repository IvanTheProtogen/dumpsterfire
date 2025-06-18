-- EZ Instant ProximityPrompt Fire

local function setup(x)
	if x:IsA("ProximityPrompt") then
		x.Enabled = true
		x.HoldDuration = 0
		x:GetPropertyChangedSignal("Enabled"):Connect(function()
			if not x.Enabled then
				x.Enabled = true
			end
		end)
		x:GetPropertyChangedSignal("HoldDuration"):Connect(function()
			if x.HoldDuration ~= 0 then
				x.HoldDuration = 0
			end
		end)
	end
end

game.DescendantAdded:Connect(setup)
for i,v in game:GetDescendants()do setup(v)end
