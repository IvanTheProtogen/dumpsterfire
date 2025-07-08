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
children[2].FocusLost:Connect(function(enterPressed)
	if enterPressed then
		task.wait()
		children[2].Text = ""
	end
end)
Instance.new("UIScale",gui).Scale = 0.6
gui.Frame.Position = UDim2.new(0,1551,0,-84)

local chat = game:GetService("Chat")
local function trickster(msg)
	return msg 
end 
hookfunction(chat.FilterStringAsync, trickster)
hookfunction(chat.FilterStringForBroadcast, trickster)

task.wait(0.5)
canTalk = true
