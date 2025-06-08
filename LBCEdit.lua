local prettytable;function prettytable(tbl,idt)
	if type(tbl)~="table"then return end
	for i,v in next,tbl do
		print(idt,i,"--",v)
		prettytable(v,idt.."\t")
	end
end

local manual = {
	"",
	"Hi, welcome to the manual! Here's how the commands work:",
	"",
	">(Pointer Location) -- Sets the pointer's location across the bytecode.",
	">+(Value) -- Increments the pointer by the value, default value is 1.",
	">-(Value) -- Decrememts the pointer by the value, default value is 1.",
	"'(Character) -- Assigns a character to the pointed byte.",
	"\\(ASCII) -- Same thing with '(CHAR), but takes in the ASCII code.",
	"\\x(HEX) -- Same thing with \\(ASCII), but takes in the HEX code.",
	"!(Byte amount) -- Allocates bytes on the pointer's location, default amount is 1.",
	"!>(Byte amount) -- Allocates bytes at the end of the bytecode, default amount is 1.",
	"?(Byte amount) -- Deallocates bytes on the pointer's location, default amount is 1.",
	"%(Range) -- Expands the view of the bytecode, default range is 2.",
	"$ -- Validates the bytecode, checking if it's executable or not.",
	"x -- Exits the program, along with printing out the resulted bytecode.",
	"m -- The manual itself!"
}

local function init(dmp)
	print("LBCEdit -- I/O-controlled Lua closure analysis")
	print("Type 'm' to see the manual on using this program.")
	print("Lua version:",_VERSION,"\n")
	-- input fixes
	if type(dmp) == "function" then 
		dmp = string.dump(dmp)
	end
	-- split dump
	local bytes = {}
	for byte in dmp:gmatch(".") do
		table.insert(bytes,byte:byte())
	end
	-- run
	local pointer = 1
	local range = 2
	while true do
		-- print dump
		print("SIZE: ",#bytes," || POINTER: ",pointer)
		for idx=pointer-range,pointer+range do
			local offset = " "
			if idx==pointer then offset=">" end
			local byte = bytes[idx]
			local hex = "??"
			if byte then 
				hex = string.format("%x",byte):upper()
				if #hex ~= 2 then 
					hex = "0"..hex
				end
				byte = string.char(byte)
			end
			print(offset,hex," -- ",byte)
		end
		-- take and execute user input
		io.write("\nACTION: ")
		local input = io.read()
		if input:sub(1,1) == "'" then
			bytes[pointer] = input:sub(2,2):byte() or bytes[pointer]
		elseif input:sub(1,2):lower() == "\\x" then
			bytes[pointer] = tonumber(input:sub(3),16) or bytes[pointer]
		elseif input:sub(1,1) == "\\" then
			bytes[pointer] = tonumber(input:sub(2)) or bytes[pointer]
		elseif input:sub(1,2) == ">+" then
			pointer = pointer + (tonumber(input:sub(3)) or 1)
		elseif input:sub(1,2) == ">-" then
			pointer = pointer - (tonumber(input:sub(3)) or 1)
		elseif input:sub(1,1) == ">" then
			pointer = tonumber(input:sub(2)) or pointer
		elseif input:sub(1,1) == "%" then 
			range = tonumber(input:sub(2)) or 2
		elseif input:sub(1,2) == "!>" then
			local times = tonumber(input:sub(3)) or 1
			for i=1,times do
				table.insert(bytes,0)
			end
		elseif input:sub(1,1) == "!" then
			local times = tonumber(input:sub(2)) or 1
			local newbytes = {}
			for idx,byte in next,bytes do
				if idx == pointer then
					for i=1,times do
							table.insert(newbytes,0)
					end
				end
				table.insert(newbytes,byte)
			end
			bytes = nil
			bytes = newbytes
			newbytes = nil
		elseif input:sub(1,1) == "?" then
			local times = tonumber(input:sub(2)) or 1
			for i=1,times do 
				table.remove(bytes,pointer)
				if pointer == #bytes+1 then
					pointer = pointer - 1 
				end
			end
		elseif input:sub(1,1):lower() == "x" then
			break
		elseif input:sub(1,1) == "$" then
			io.write("\n")
			local func,suc = ""
			for _,byte in next,bytes do
				func = func..string.char(byte)
			end
			suc,func = pcall(load or loadstring, func)
			if not suc or not func then 
				print("Bytecode invalid, reason:",func)
			else
				while true do 
					io.write("Bytecode valid, should it be ran? (Y/N) ")
					local input = io.read():lower():sub(1,1)
          if input == "y" then
						local tm = os.clock()
						local result = {pcall(func)}
						print("\nTIME TAKEN:",os.clock()-tm)
						print("RESULT:\n")
						prettytable(result,"")
						break
					elseif input == "n" then
						print("Execution cancelled")
						break
					end
				end
			end
		elseif input:sub(1,1):lower() == "m" then
			print(table.concat(manual,"\n"))
		end
		io.write("\n")
	end
	print("\nProgram has stopped, here's the full result:")
	print("\\"..table.concat(bytes,"\\"))
end

return init
