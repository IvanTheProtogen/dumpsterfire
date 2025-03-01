-- Slightly modified version of Annabypasser to make it comfy

local RS = game:GetService("ReplicatedStorage")
if RS:FindFirstChild("DefaultChatSystemChatEvents") then 
	if RS.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest") then 
		if RS.DefaultChatSystemChatEvents.SayMessageRequest:IsA("RemoteEvent") then 
			local remote = RS.DefaultChatSystemChatEvents.SayMessageRequest
			local old;old = hookfunction(remote.FireServer, function(inst, ...)
				local allow = true
				if inst == remote then 
					local args = {...}
					if args[1]=="AnnaBypasser\8Loaded\8Made\8By\8Anna\8- rebrand.ly/AnnaBypasser -\8updates:\8https://di\224\184\163cord.gg/VrSHuQQBPh" and args[2]=="All" then 
						allow = false 
					end 
				end 
				if allow then 
					return old(inst, ...) 
				end 
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
