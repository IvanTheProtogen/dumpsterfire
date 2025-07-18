-- Delta UI Enhancer
-- By IvanTheSkid
-- [[[[[ WORK IN PROGRESS ]]]]]

-- dont execute if it's already executed
assert(not getgenv().deltaenhui)
getgenv().deltaenhui = true

-- make sure it's running with Delta
assert(identifyexecutor and gethui and identifyexecutor():sub(1,5)=="Delta")

-- retrieve delta's GUI
local dltgui
repeat
	for _,v in gethui():GetChildren() do
		if v:FindFirstChild("IsTween") and v:FindFirstChild("UILibrary") and v:FindFirstChild("MainScript") then
			dltgui = v
			break
		end
	end
	if not dltgui then
		task.wait()
	end
until dltgui

-- functionalize delta's console
local conelem = dltgui.Console.ConsoleElements
do
	local ui = conelem.Parent.RobloxConsole.Console.ScrollingFrame.Header
	game:GetService("LogService").MessageOut:Connect(function(msg,tp)
		local item
		if tp == Enum.MessageType.MessageError then
			item = conelem.Error:Clone()
		elseif tp == Enum.MessageType.MessageWarning then
			item = conelem.Warn:Clone()
		elseif tp == Enum.MessageType.MessageInfo then
			item = conelem.Info:Clone()
		else
			item = conelem.Output:Clone()
		end
		item.Content.Text = msg
		item.Visible = true
		item.Parent = ui
		item = nil
	end)
	ui.Parent.Parent.Parent.Buttons.Clear.MouseButton1Click:Connect(function()
		for _,v in ui:GetChildren() do
			if v:IsA("Frame") then
				v:Destroy()
				v = nil
			end
		end
	end)
end
-- seriously, who needs RConsole?
