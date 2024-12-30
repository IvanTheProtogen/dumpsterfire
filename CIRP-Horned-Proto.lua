local ExtraAbilities=getgenv().ExtraAbilities or loadstring(game:HttpGet("http://github.com/IvanTheProtogen/ExtraAbilities/raw/main/main.lua"))();

local lolname = " Ḥ͎ọ͎ṛ͎ṇ͎ỵ͎ ͎Р͎ṛ͎ọ͎ṭ͎ọ͎ɡ͎ẹ͎ṇ͎~͎ 💙"
local events = game:GetService("ReplicatedStorage").Events
local function changeDecal(...)return events.Morph:FireServer({...})end
local function changeName(...)return events.RPNAME:FireServer(...)end

task.spawn(function()
	local tbl = {"///\\\\\\///", "\\///\\\\\\//", "\\\\///\\\\\\/", "\\\\\\///\\\\\\", "/\\\\\\///\\\\", "//\\\\\\///\\"}
	while true do
		for i,v in pairs(tbl) do
			changeName(v..lolname)
			task.wait(0.1)
		end
	end
end)

local decal = 15237022207

task.spawn(function()
	local sinny = 0
	while task.wait(1/3) do
		sinny = sinny+1
		local sinsin = math.sin(sinny)
		local skibidi = sinsin*0.2
		changeDecal(decal, 6+skibidi, 6-skibidi)
	end
end)
