-- No UI, since this is a prototype 

-- Epik script data corruptor

local part = [[local queueonteleport = function()end
local queue_on_teleport = function()end
]]

local target = loadstring(part..game:HttpGet('https://github.com/EdgeIY/infiniteyield/raw/master/source'))

local function modify(tbl, rarity, intensity)
	local tbll = {}
	for i,v in next, tbl do
		if typeof(v) == "number" then
			if math.random(1,rarity) == 1 then
				tbll[i] = v+(((math.random(0,1)*2)-1)*(intensity*math.random()))
			end
		end
	end
	return tbll
end

local function main(func, rarity, intensity)
	local tbl = modify(getconstants(func), rarity, intensity)
	for i,v in next, tbl do
		setconstant(func, i, v)
	end
	local tbll = getprotos(func)
	for i,v in next, tbll do
		local tblll = modify(getconstants(v), rarity, intensity)
		for x,y in next, tblll do
			setconstant(v, x, y)
		end
	end
	return func
end

getgenv().IY_LOADED = nil
main(target, 1, 10)()
getgenv().IY_LOADED = nil
