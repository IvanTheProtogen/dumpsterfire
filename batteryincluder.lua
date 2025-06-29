local bi = {}

function bi.count(obj)
	local count = 0
	for i,v in next,obj do 
		count = count + 1 
	end 
	return count 
end 

function bi.clear(obj)
	for idx,_ in next,obj do 
		rawset(obj,idx,nil)
	end 
	return obj
end 

function bi.copy(dest,src,includemt)
	dest = bi.clear(dest)
	for idx,val in next,src do 
		rawset(dest,idx,val)
	end 
	if includemt then 
		setmetatable(dest,getmetatable(src))
	end 
	return dest 
end 

function bi.split(str, delimiter)
	if #delimiter > 0 then 
		local result,from = {},1
		local delim_from,delim_to = str:find(delimiter,from)
		while delim_from do
			table.insert(result,str:sub(from,delim_from-1))
			from = delim_to+1
			delim_from,delim_to = str:find(delimiter,from)
		end
		table.insert(result,str:sub(from))
		return result
	else 
		local t = {}
		for sym in str:gmatch(".") do 
			table.insert(t,sym)
		end 
		return t 
	end 
end 

function bi.dictmerge(obj,add,override)
	local obj = bi.copy({},obj)
	if override == nil then 
		override = true 
	end 
	for idx,val in next,add do 
		if obj[idx]~=nil then 
			if override then 
				rawset(obj,idx,val)
			end 
		else 
			rawset(obj,idx,val)
		end 
	end 
	return obj 
end 

function bi.arraymerge(obj,add)
	local new = bi.copy({},obj)
	for _,val in next,add do 
		table.insert(new,val)
	end 
	return new 
end 

function bi.filter(obj,filter,usekeys)
	local obj = bi.copy({},obj)
	if type(filter) == "function" then 
		for idx,val in next,obj do 
			if filter(idx,val) then 
				rawset(obj,idx,val) 
			end 
		end 
	elseif type(filter) == "table" then 
		for idx,val in next,obj do 
			if usekeys then 
				if table.find(filter,idx) then 
					rawset(obj,idx,nil)
				end 
			else 
				if table.find(filter,val) then 
					rawset(obj,idx,nil)
				end 
			end 
		end 
	else 
		return error('expected table or function, got '..type(filter))
	end
	return obj 
end 

function bi.keys(obj)
	local new = {}
	for idx,_ in next,obj do 
		table.insert(new,idx)
	end 
	return new 
end 

function bi.sum(t)
	local sum = 0 
	for _,val in next,t do 
		sum = sum + val 
	end 
	return sum 
end 

function bi.arraycorrect(obj)
	local new = {}
	for _,val in next,obj do 
		table.insert(new,val)
	end 
	return new 
end 

function bi.class(funcs)
	local __init__ = funcs.__init__
	funcs.__index = funcs
	return function(...)
		local obj = setmetatable({},funcs)
		if __init__ then 
			__init__(obj,...)
		end 
		return obj
	end
end 

return bi
