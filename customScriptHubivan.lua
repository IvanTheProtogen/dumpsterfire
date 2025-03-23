-- it's a lazy script hub, not so user friendly but simple
-- made for myself personally

if customScriptHubivan then 
	return 
end 
getgenv().customScriptHubivan = true 

local src = [[

local ExtraAbilities=getgenv().ExtraAbilities or loadstring(game:HttpGet("http://github.com/IvanTheProtogen/ExtraAbilities/raw/main/main.lua"))();

local coregui = game:GetService("CoreGui")

if coregui:FindFirstChild("customScriptHubivan") then
	coregui.customScriptHubivan:Destroy()
end

if not pcall(listfiles, "customScriptHubivan") then
	makefolder("customScriptHubivan")
end
if not pcall(listfiles, "customScriptHubivan/autoexec") then
	makefolder("customScriptHubivan/autoexec")
end
local function getfiles()
	return listfiles("customScriptHubivan")
end
local function filename(name)
	local s = #("customScriptHubivan/")
	return string.sub(name, s+1)
end
local function getfilesAE()
	return listfiles("customScriptHubivan/autoexec")
end
local function runfile(name)
	local suc,func = pcall(loadstring, readfile(name))
	if not suc then return suc,func end
	return pcall(func)
end

local gui = Instance.new("ScreenGui", coregui)
gui.Name = "customScriptHubivan"
gui.DisplayOrder = 15
gui.ResetOnSpawn = false

local bubble = Instance.new("TextButton", gui)
bubble.Name = "bubble"
bubble.Size = UDim2.new(0,30,0,30)
bubble.Position = UDim2.new(0.25,-15,1,-40)
bubble.BorderSizePixel = 0
bubble.BackgroundColor3 = Color3.fromRGB(27,27,27)
bubble.Text = ""

local icon = Instance.new("TextLabel", bubble)
icon.Name = "icon"
icon.Font = Enum.Font.Ubuntu
icon.BorderSizePixel = 0
icon.Position = UDim2.new(0.5,0,0.5,0)
icon.Text = "S"
icon.TextSize = 16
icon.TextColor3 = Color3.new(1,1,1)

task.spawn(function()
	local x = 0
	while task.wait() do
		gui.bubble.Rotation = x/2
		gui.bubble.Position = UDim2.new(0.25,-15,1,-45-(math.sin(x/30)*10))
		gui.bubble.icon.Rotation = -(x/2)
		x=x+1
	end
end)

gui.bubble.MouseButton1Click:Connect(function()
	gui.topbar.Visible = not gui.topbar.Visible
end)

local topbar = Instance.new("TextLabel", gui)
topbar.Name = "topbar"
topbar.BorderSizePixel = 0
topbar.BackgroundColor3 = Color3.fromRGB(27,27,27)
topbar.Size = UDim2.new(0,400,0,15)
topbar.Position = UDim2.new(0.5,-200,0.5,-(255/2))
topbar.Active = true
topbar.Draggable = true
topbar.Font = Enum.Font.Ubuntu
topbar.Text = "Ivan's Custom Script Hub"
topbar.TextColor3 = Color3.new(1,1,1)
topbar.Visible = false

local main = Instance.new("Frame", topbar)
main.Name = "main"
main.BorderSizePixel = 0
main.BackgroundColor3 = Color3.fromRGB(31,31,31)
main.Size = UDim2.new(0,400,0,240)
main.Position = UDim2.new(0,0,0,15)
main.Active = true

local scroll = Instance.new("ScrollingFrame", main)
scroll.Name = "scroll"
scroll.BorderSizePixel = 0
scroll.BackgroundColor3 = Color3.fromRGB(27,27,27)
scroll.Size = UDim2.new(0,380,0,220)
scroll.Position = UDim2.new(0,10,0,10)
scroll.Active = true 
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

local file = Instance.new("TextButton")
file.Archivable = true
file.Size = UDim2.new(0,380,0,25)
file.BackgroundColor3 = Color3.fromRGB(24,24,24)
file.BorderSizePixel = 0
file.TextColor3 = Color3.new(1,1,1)
file.TextXAlignment = Enum.TextXAlignment.Left

local function displayfile(name)
	local file = file:Clone()
	local scroll = gui.topbar.main.scroll
	file.Parent = scroll
	file.Text = filename(name)
	file.Position = UDim2.new(0,0,0,(5*#scroll:GetChildren())+(25*#scroll:GetChildren()))
	file.MouseButton1Click:Connect(function()
		local resp = ExtraAbilities.NotifyRequest("Select action", "Select action to do with the file", "Data To Clipboard", "Execute now")
		if resp == "Execute now" then
			runfile(name)
		else if resp == "Data To Clipboard" then
			setclipboard(readfile(name))
		end end
	end)
end

for i,v in getfiles() do
	if not isfolder(v) then
		displayfile(v)
	end
end

for i,v in getfilesAE() do
	task.spawn(runfile,v)
end

]]

queueonteleport(src)
loadstring(src)() 
