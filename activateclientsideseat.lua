local function activateclientsideseat(seat)
	local occupant
	local touchedhmd = {}
	local weld
	seat.Touched:Connect(function(part)
		if not (occupant and occupant:IsDescendantOf(game)) and not seat.Disabled then
			if occupant and not occupant:IsDescendantOf(workspace) then
				pcall(table.remove, touchedhmd, table.find(touchedhmd, occupant))
				occupant = nil
				if weld then
					weld:Destroy()
					weld = nil
				end
			end
			local hmd = part.Parent:FindFirstChildOfClass("Humanoid")
			if hmd and not table.find(touchedhmd,hmd) then
				hmd.RootPart.CFrame = seat.CFrame:ToWorldSpace(CFrame.new(0,(seat.Size.Y / 2)+(hmd.RootPart.Size.Y / 2),0))
				hmd.Sit = true
				weld = Instance.new("WeldConstraint")
				weld.Parent = seat
				weld.Part0 = seat
				weld.Part1 = hmd.RootPart
				hmd:GetPropertyChangedSignal("Sit"):Once(function()
					if not hmd.Sit then
						weld:Destroy()
					end
				end)
				occupant = hmd
				weld.Destroying:Once(function()
					weld = nil
					occupant = nil
					task.wait(3)
					table.remove(touchedhmd,table.find(touchedhmd,hmd))
				end)
				table.insert(touchedhmd,hmd)
			end
		end
	end)
end 

return activateclientsideseat
