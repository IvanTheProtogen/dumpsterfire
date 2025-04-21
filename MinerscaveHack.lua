-- A simple and minimalist Minerscave hack to get anyone started
-- By IvanTheSkid

-- Features included:
-- -- No Damage
-- -- Free X-Ray
-- -- FastBreak

-- Providing speed-focused optimization
-- The other movement stuff is to execute this in Infinite Yield: loopfb\loopws 30\flyjump\noclip\esp

-- ///// INITIALIZATION /////
-- all of this is essential for speed-focused optimization
local events = game:GetService("ReplicatedStorage").GameRemotes
local ABB = events.AcceptBreakBlock
local invoke = ABB.InvokeServer
local spawn = task.spawn
local wait = task.wait

local blocks = workspace.Blocks
local isa = blocks.IsA
local event = blocks.DescendantAdded
local connect = event.Connect
local GPCS = blocks.GetPropertyChangedSignal
local function antiDisableEsp(v)
	connect(GPCS(v, "Visible"), function()
		if not v.Visible then v.Visible = true end
	end)
end
local function espCheck(v)
	if isa(v, "BoxHandleAdornment") then
		v.Visible = true
		antiDisableEsp(v)
	end
end

-- ///// EXECUTION /////
events.Demo:Destroy() -- No Damage

for i,v in blocks:GetDescendants() do -- Free X-Ray
	spawn(espCheck, v)
end

connect(event, espCheck) -- Also Free X-Ray

while wait() do
	spawn(invoke, ABB) -- FastBreak
end

-- ===== CLEANUP NOT NEEDED DUE TO INFINITE LOOP =====
