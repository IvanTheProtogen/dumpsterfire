-- Slightly modified version of Annabypasser to make it comfy

local canTalk = false

local RS = game:GetService("ReplicatedStorage")
if RS:FindFirstChild("DefaultChatSystemChatEvents") then 
	if RS.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest") then 
		if RS.DefaultChatSystemChatEvents.SayMessageRequest:IsA("RemoteEvent") then 
			local remote = RS.DefaultChatSystemChatEvents.SayMessageRequest
			local old;old = hookfunction(remote.FireServer, function(inst, ...)
				if inst == remote then 
					if not canTalk then 
						return 
					end 
				end 
				return old(inst, ...) 
			end) 
		end 
	end 
end

task.spawn(loadstring(game:HttpGet("https://raw.githubusercontent.com/AnnaRoblox/AnnaBypasser/refs/heads/main/AnnaBypasser.lua",true)))

local gui = game:GetService("CoreGui"):WaitForChild("AnnaBypasser")
local children = gui.Frame:GetChildren()
children[2].ClearTextOnFocus = false
children[4].ClearTextOnFocus = false
children[3].MouseButton1Click:Connect(function()
	task.wait()
	children[2].Text = ""
end)
Instance.new("UIScale",gui).Scale = 0.6
gui.Frame.Position = UDim2.new(0,1280,0,0)

task.wait(0.5)
canTalk = true
