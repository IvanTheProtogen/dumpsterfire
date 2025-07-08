local xasemote = {}

-- those hash, encrypt and decrypt functions aren't cryptographically secure
-- but although, you can still replace them with military-grade ones like SHA-256 and AES-256
-- by directly modifying the returned `xasemote` table
function xasemote.hash(input)
	input = tostring(input)
	local x = 0
	for i=1,#input do
		x = x + input:byte(i)
	end
	return ('d'):pack(math.sin(math.sin(x)*x)*x)
end
function xasemote.encrypt(data,key)
	data,key = tostring(data),tostring(key)
	local datab,keyb = {},{}
	for sym in data:gmatch(".") do
		table.insert(datab,sym)
	end
	for sym in key:gmatch(".") do
		table.insert(keyb,sym)
	end
	for i=1,#datab do
		datab[i] = string.char((datab[i]:byte()+keyb[(i % #keyb)+1]:byte())%256)
	end
	return table.concat(datab)
end
function xasemote.decrypt(data,key)
	data,key = tostring(data),tostring(key)
	local datab,keyb = {},{}
	for sym in data:gmatch(".") do
		table.insert(datab,sym)
	end
	for sym in key:gmatch(".") do
		table.insert(keyb,sym)
	end
	for i=1,#datab do
		datab[i] = string.char((datab[i]:byte()-keyb[(i % #keyb)+1]:byte())%256)
	end
	return table.concat(datab)
end


local players = game:GetService("Players")

function xasemote.genkey(plr)
	local key = 0
	for _,str in {
		game.JobId,
		plr.Name,
		plr.DisplayName,
		('d'):pack(game.PlaceId),
		('d'):pack(plr.AccountAge),
		('d'):pack(plr.UserId),
		tostring(game.PlaceId),
		tostring(plr.AccountAge),
		tostring(plr.UserId)
	} do 
		for i=1,#str do 
			key = key + str:byte(i)
		end
	end 
	return xasemote.hash(key)
end 

function xasemote.pack(plr,data)
	assert(typeof(plr)=='Instance' and plr.ClassName=='Player','player type')
	data = tostring(data)
	local hashB = xasemote.hash(data)
	local key = xasemote.genkey(plr)
	local hashC = xasemote.hash(key)
	data = xasemote.encrypt(data,key)
	local hashA = xasemote.hash(data)
	return data,hashA,hashB,hashC
end 

function xasemote.unpack(plr,data,hashA,hashB,hashC)
	assert(typeof(plr)=='Instance' and plr.ClassName=='Player','player type')
	assert(type(data)=='string','data type')
	assert(type(hashA)=='string','decrypt hash type')
	assert(type(hashB)=='string','encrypt hash type')
	assert(type(hashC)=='string','key hash type')
	local key = xasemote.genkey(plr)
	local checkC = xasemote.hash(key)
	assert(checkC==hashC,'key check')
	local checkB = xasemote.hash(data)
	assert(checkB==hashB,'encrypt check')
	data = xasemote.decrypt(data,key)
	local checkA = xasemote.hash(data)
	assert(checkA==hashA,'decrypt check')
	return data 
end 

return xasemote 
