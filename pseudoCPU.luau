local function process(ram,ip,instr)
	if instr[1] == "IF1" then
		if ram[instr[2]] then
			return process(ram,ip,instr[3])
		end
	elseif instr[1] == "IF0" then
		if not ram[instr[2]] then
			return process(ram,ip,instr[3])
		end
	elseif instr[1] == "FLP" then 
		ram[instr[2]] = not ram[instr[2]]
		return ip
	elseif instr[1] == "JMP" then
		return instr[2]
	else
		error("invalid instruction... (IP: "..tostring(ip)..")")
	end
end

local function emulate(data)
	assert(type(data)=="table", "expected table, got "..typeof(data))
	if not data.ram then
		warn("RAM is not assigned")
		data.ram = {}
	else assert(type(data.ram)=="table", "RAM must be a table, not "..typeof(data.ram)) end
	assert(type(data.imem)=="table", "IMEM must be table, not "..typeof(data.imem))
	data.ip = data.ip or 1
	data.skip = data.skip or 1
	data.process = data.process or process
	data.wait = data.wait or task.wait
	while not data.stop do
		for i=1,data.skip do
			local previp = data.ip
			data.ip = data.process(data.ram,data.ip,data.imem[data.ip] or {"JMP",-1})
			if data.ip == -1 then
				return data
			elseif previp == data.ip then
				data.ip = data.ip + 1
			end
		end
		data.wait(data.delay)
	end
	return data
end

return emulate,process
