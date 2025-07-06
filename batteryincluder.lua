--[[

BATTERYINCLUDER 

The Lua module that provides all functions Lua devs need.

- <count: number> bi.count(obj: table) -- Returns the amount of items in the table. It is more suitable than `#obj`, if you wanna know the true item amount.
- <key: any> bi.find(obj: table, trg: any, usekeys: boolean) -- Searches for the given value or key in the table, returns the key or boolean.
- <key: any> bi.funcfind(obj: table, func: function) -- `bi.find`, but it uses a custom function to find given value and/or key.
- <nil> bi.clear(obj: table) -- Emptifies the given table.
- <dest: table> bi.copy(dest: table, src: table, includemt: boolean) -- Copies items from `src` to `dest` and returns `dest`. Can strap the metatable from `src` onto `dest`.
- <obj: table> bi.clone(obj: table, includemt: boolean) -- Returns a clone of the given table. Shortcut to `bi.copy({},obj)`.
- <result: table> bi.split(str: string, delimiter: string) -- Splits the string and returns the table containing all slices.
- <merged: table> bi.dictmerge(obj: table, add: table, override: boolean) -- Returns a merge of 2 tables, mostly compatible with dictionaries. If `override` is `true`, then already existing items in `obj` will be replaced with items in `add`.
- <merged: table> bi.arraymerge(obj: table, add: table) -- Returns a merge of 2 tables, mostly compatible with arrays.
- <result: table> bi.filter(obj: table, filter: table|function, usekeys: boolean) -- Returns a filtered version of `obj`. If `filter` is a `table`, then existing keys or values in `obj` will be removed if they also exist in `filter`. `filter` as a `function` allows custom filtering.
- <keys: table> bi.keys(obj: table) -- Returns a table of keys in `obj`.
- <sum: number> bi.sum(t: table) -- Returns a sum of all numbers in `t`.
- <result: table> bi.arraycorrect(obj: table) -- Returns a clone of `obj`, where the indexes are corrected. For example, `{[1]='a',[3]='b',[10]='c'}` can be corrected into `{[1]='a',[2]='b',[3]='c'}`.
- <objCreator: function> bi.class(funcs: table) -- Python-inspired class creator. Useful for OOP.
- <type: string> bi.tabletype(obj: table) -- Indicates if the given table is an array or dictionary.
- <reversed: table> bi.reverse(obj: table) -- Returns a reversed version of a given table, recommended for array use only.
- <result: table> bi.nodupe(obj: table) -- Returns a clone of a given table with no duplicates, recommended for array use only.

TIP: Declare `obj = nil` after using any `obj` that is temporary, so the garbage collector can remove the object from the memory easier, once the reference is nullified.

]]

local bi = {}

local rawget = rawget or function(obj,idx)return obj[idx]end 
local rawset = rawset or function(obj,idx,val)obj[idx]=val end 
local rawequal = rawequal or function(a,b)return a==b end 

function bi.count(obj)
	local count = 0
	for i,v in next,obj do 
		count = count + 1 
	end 
	return count 
end 

function bi.find(obj,trg,usekeys)
	if usekeys then 
		for idx,val in next,obj do 
			if rawequal(idx,trg) then 
				return true 
			end 
		end 
		return false 
	else 
		for idx,val in next,obj do 
			if rawequal(val,trg) then 
				return idx 
			end 
		end
	end 
end 

function bi.funcfind(obj,func)
	for idx,val in next,obj do 
		if func(idx,val) then 
			return idx 
		end 
	end 
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

function bi.clone(obj,includemt)
	return bi.copy({},obj,includemt)
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
		if not rawequal(rawget(obj,idx),nil) then 
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
				if bi.find(filter,idx) then 
					rawset(obj,idx,nil)
				end 
			else 
				if bi.find(filter,val) then 
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

function bi.tabletype(obj)
	for key,_ in next,obj do 
		if type(key)~="number" then 
			return "dictionary"
		end 
	end 
	return "array"
end 

function bi.reverse(obj)
	local new,obj = {},bi.arraycorrect(obj)
	for i=#obj,1,-1 do 
		table.insert(new,rawget(obj,i))
	end 
	obj = nil 
	return new 
end 

function bi.nodupe(obj)
	local new = {} 
	for _,val in next,obj do 
		if not bi.find(new,val) then 
			table.insert(new,val)
		end 
	end 
	return new 
end 

return bi
