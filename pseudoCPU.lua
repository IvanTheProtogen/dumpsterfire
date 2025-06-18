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

local function emulate(ram,imem,ip)
	ip = ip or 1
	while true do 
		local previp = ip
		ip = process(ram,ip,imem[ip] or {"JMP",-1})
		if ip == -1 then
			return ram
		elseif previp == ip then
			ip = ip + 1
		end
	end
end

return emulate,process
