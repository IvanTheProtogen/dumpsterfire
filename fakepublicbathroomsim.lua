game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RagdollState")game:GetService("ReplicatedStorage"):WaitForChild("RP_Name") -- this is for check

local function create(class,prop)
	local obj = Instance.new(class)
	for i,v in prop do
		obj[i] = v
	end
	return obj
end

local gui = create("ScreenGui",{
Name = "_ALAALA",
Parent = game:GetService("CoreGui"),
ResetOnSpawn = false,
IgnoreGuiInset = true
})
local menubar = create("TextButton",{
Parent = gui,
AnchorPoint = Vector2.new(0.5,0),
BackgroundColor3 = Color3.fromRGB(27,27,27),
BorderSizePixel = 0,
Text = "epik mod menu",
TextColor3 = Color3.new(1,1,1),
Size = UDim2.new(0,100,0,20),
Position = UDim2.new(0.4,0,0,10)
})
local frame = create("Frame",{
Parent = menubar,
Size = UDim2.new(1,0,0,100),
Position = UDim2.new(0,0,1,0),
BorderSizePixel = 0,
BackgroundColor3 = Color3.fromRGB(45,45,45)
})
local antiragdoll = create("TextButton",{
Parent = frame,
AnchorPoint = Vector2.new(0.5,0),
BackgroundColor3 = Color3.fromRGB(27,27,27),
BorderSizePixel = 0,
Text = "Anti-Ragdoll",
TextColor3 = Color3.new(0,1,0),
Position = UDim2.new(0.5,0,0,3),
Size = UDim2.new(0.9,0,0,15)
})
local taserspam = create("TextButton",{
Parent = frame,
AnchorPoint = Vector2.new(0.5,0),
BackgroundColor3 = Color3.fromRGB(27,27,27),
BorderSizePixel = 0,
Text = "Taser Spam",
TextColor3 = Color3.new(1,0,0),
Position = UDim2.new(0.5,0,0,21),
Size = UDim2.new(0.9,0,0,15)
})
local taseall = create("TextButton",{
Parent = frame,
AnchorPoint = Vector2.new(0.5,0),
BackgroundColor3 = Color3.fromRGB(27,27,27),
BorderSizePixel = 0,
Text = "Tase All",
TextColor3 = Color3.new(1,1,1),
Position = UDim2.new(0.5,0,0,39),
Size = UDim2.new(0.9,0,0,15)
})
local taserwall = create("TextButton",{
Parent = frame,
AnchorPoint = Vector2.new(0.5,0),
BackgroundColor3 = Color3.fromRGB(27,27,27),
BorderSizePixel = 0,
Text = "Taser Wall",
TextColor3 = Color3.new(1,1,1),
Position = UDim2.new(0.5,0,0,57),
Size = UDim2.new(0.9,0,0,15)
})
local bringplayer = create("TextBox",{
Parent = frame,
AnchorPoint = Vector2.new(0.5,0),
BackgroundColor3 = Color3.fromRGB(27,27,27),
BorderSizePixel = 0,
Text = "",
PlaceholderText = "Bring player...",
PlaceholderColor3 = Color3.new(0.5,0.5,0.5),
TextColor3 = Color3.new(1,1,1),
Position = UDim2.new(0.5,0,0,73),
Size = UDim2.new(0.9,0,0,15),
ClearTextOnFocus = false
})
local label = create("TextLabel",{
Parent = frame,
AnchorPoint = Vector2.new(0,0),
TextSize = 5,
BorderSizePixel = 0,
Text = "Made by IvanTheSkid >wO",
TextColor3 = Color3.new(0.5,0.5,0.5),
Position = UDim2.new(0.5,0,1,0),
TextYAlignment = Enum.TextYAlignment.Bottom
})

frame.Visible = false
menubar.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
end)

task.spawn(function() -- FREE POLICE ROLE YAYYYY
	while true do
		local btn = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("RoleSelect"):WaitForChild("ScrollingFrame"):WaitForChild("Police"):WaitForChild("RoleName")
		local rmt = game:GetService("ReplicatedStorage"):WaitForChild("RoleManagerEvent")
		local cln = btn:Clone()
		cln.Parent = btn.Parent
		btn:Destroy()
		btn = nil 
		cln.Text = "Claim"
		local claimed = false
		cln.MouseButton1Click:Connect(function()
			if claimed then
				rmt:FireServer("UnclaimRole","Police")
				cln.Text = "Claim"
				claimed = false
			else 
				rmt:FireServer("ClaimRole","Police")
				cln.Text = "Unclaim"
				claimed = true
			end
		end)
		while cln do task.wait(1) end 
		task.wait()
	end
end)

local antiragdoll_active = true 
local function antiragdoll_func()
	local lp = game:GetService("Players").LocalPlayer
	local rmt = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RagdollState")
	local fs = rmt.FireServer 
	local function aaa()
		fs(rmt,false)
		lp.Character["Local Ragdoll"].Disabled=true 
	end
	while antiragdoll_active do 
		pcall(aaa)
		task.wait(0.05)
	end 
	lp.Character["Local Ragdoll"].Disabled=false
end

local taserspam_active = false
local function taserspam_func()
	local rmt = game:GetService("ReplicatedStorage"):WaitForChild("RoleManagerEvent")
	local fs = rmt.FireServer 
	local lp = game:GetService("Players").LocalPlayer
	local function catcher(inst)
		if inst:IsA("Tool") then 
			if inst.Name == "Taser" then
				inst.Parent = lp.Character 
				task.wait()
				inst:Activate()
				task.wait()
				inst.Parent = workspace 
			elseif inst.Name == "Handcuffs" then 
				inst:Destroy()
			end 
		end
	end 
	local bkpk = lp:WaitForChild("Backpack")
	local con = bkpk.ChildAdded:Connect(catcher)
	while taserspam_active do 
		fs(rmt,"ClaimRole","Police")
		for _,inst in bkpk:GetChildren() do 
			task.spawn(catcher,inst)
			_,inst = nil 
		end 
		task.wait()
	end 
	if con then pcall(con.Disconnect,con)end
	task.wait(1)
	local rmtt = game:GetService("ReplicatedStorage"):WaitForChild("DeleteDupes")
	for i=1,10 do 
		fs(rmt,"UnclaimRole","Police")
		fs(rmtt)
		task.wait(0.1)
	end 
end 

local function taseall_func()
	local plrs = game:GetService("Players")
	local getplrs = plrs.GetPlayers 
	local lp = plrs.LocalPlayer
	local bkpk = lp:WaitForChild("Backpack")
	local char = lp.Character
	local taser = bkpk:FindFirstChild("Taser")
	if not taser then 
		game:GetService("ReplicatedStorage"):WaitForChild("RoleManagerEvent"):FireServer("ClaimRole","Police")
		taser = bkpk:WaitForChild("Taser")
	end 
	local function aaa()
		local pp = getplrs(plrs)
		if #pp < 2 then task.wait()end 
		taser.Handle.Position = pp[math.random(2,#pp)].Character.HumanoidRootPart.Position 
		task.wait()
	end
	while char and char.Parent and taser and taser.Parent do 
		if taser.Parent ~= char then taser.Parent = char end 
		taser:Activate()
		pcall(aaa)
	end
end 

local function taserwall_func()
	local rmt = game:GetService("ReplicatedStorage"):WaitForChild("RoleManagerEvent")
	local lp = game:GetService("Players").LocalPlayer 
	local char = lp.Character or lp.CharacterAdded:Wait() and lp.Character 
	local bkpk = lp:WaitForChild("Backpack")
	local tasers = {}
	local WIDTH = 15 
	local HEIGHT = 9 
	local TOTAL = WIDTH*HEIGHT
	for _=1,TOTAL do 
		rmt:FireServer("ClaimRole","Police")
	end 
	while #tasers < TOTAL and char and char.Parent do 
		for _,tool in bkpk:GetChildren() do 
			if tool:IsA("Tool") and tool.Name=="Taser" and not table.find(tasers,tool) then 
				table.insert(tasers,tool)
			end 
		end 
		task.wait() 
	end 
	local forX = WIDTH/2 - 0.5 
	local forY = HEIGHT/2 - 0.5
	local i = 1
	for x=-forX,forX do 
		for y=-forY,forY do 
			tasers[i].GripPos = Vector3.new(x,y,0)
			i = i + 1
		end 
	end 
	for _,taser in tasers do 
		taser.Parent = char 
		for __,part in taser:GetDescendants() do 
			if part:IsA("BasePart") then 
				part.CanCollide = false 
				part.CanTouch = false 
			end
		end
	end 
	while char and char.Parent do 
		for _,taser in tasers do 
			taser.Parent = char 
			taser:Activate()
		end 
		task.wait(0.25)
	end 
end 

local function bringplayer_func(plr)
	local RS = game:GetService("ReplicatedStorage")
	local plrs = game:GetService("Players")
	local lp = plrs.LocalPlayer
	local char = lp.Character
	local hrp = char.Humanoid.RootPart
	local bkpk = lp.Backpack
	RS.RoleManagerEvent:FireServer("ClaimRole", "Police")
	local cuffs = bkpk:WaitForChild("Handcuffs")
	local ogcf = hrp.CFrame
	local trg = plr.Character.Humanoid.RootPart
	local continue = false
	RS.CuffConfirm.OnClientEvent:Once(function()
		continue = true
	end)
	task.spawn(function()
		local i = 1
		while i<=3 and char and char.Parent and not continue do
			cuffs.Parent = char
			task.wait(1)
			cuffs.Parent = bkpk
			task.wait(0.2)
			i=i+1
		end
		continue = true
	end)
	while char and char.Parent and not continue do
		local vel = trg.Velocity
		vel = CFrame.new(-vel.X/3, -vel.Y/3, -vel.Z/3)
		hrp.CFrame = trg.CFrame:ToWorldSpace(vel)
		cuffs.Parent = char
		RS.CuffRequest:FireServer(plr)
		task.wait()
	end
	RS.GrabRequest:FireServer()
	task.wait(0.3)
	hrp.CFrame = ogcf
	task.wait(0.5)
	RS.UnGrabRequest:FireServer()
	cuffs.Parent = bkpk
	RS.ToolUnequipped:FireServer()
	for i=1,5 do RS.RoleManagerEvent:FireServer	("UnclaimRole", "Police")end
end

antiragdoll.MouseButton1Click:Connect(function()
	antiragdoll_active = not antiragdoll_active 
	if antiragdoll_active then 
		antiragdoll.TextColor3 = Color3.new(0,1,0)
		antiragdoll_func()
	else 
		antiragdoll.TextColor3 = Color3.new(1,0,0)
	end
end)

taserspam.MouseButton1Click:Connect(function()
	taserspam_active = not taserspam_active 
	if taserspam_active then 
		taserspam.TextColor3 = Color3.new(0,1,0)
		taserspam_func()
	else 
		taserspam.TextColor3 = Color3.new(1,0,0)
	end 
end)

bringplayer.FocusLost:Connect(function(enter)
	if enter then 
		local pattern = bringplayer.Text:lower()
		for i,v in game:GetService("Players"):GetPlayers() do 
			if v.Name:lower():sub(1,#pattern)==pattern or v.DisplayName:lower():sub(1,#pattern)==pattern then 
				bringplayer.Text = ""
				return bringplayer_func(v)
			end 
		end 
		for i=1,3 do 
			bringplayer.TextColor3 = Color3.new(1,0,0)
			task.wait(0.25)
			bringplayer.TextColor3 = Color3.new(1,1,1)
			task.wait(0.25)
		end 
	end 
end)

taseall.MouseButton1Click:Connect(taseall_func)
taserwall.MouseButton1Click:Connect(taserwall_func)

antiragdoll_func()
