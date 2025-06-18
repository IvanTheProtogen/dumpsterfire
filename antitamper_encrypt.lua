local function antitamper(str)
    local num = 1
    local switch = true
    for i=1,#str do
        i=str:sub(i,i):byte()
        if i == 0 then 
            i = 1 
        end
        if switch then 
            num = num*i
        else
            num = num/i
        end
        switch = not switch
    end
    return num*math.sin(num)
end
local function encrypt(str,seq)
    local len = #seq
    local tbl = {}
    local idx = 1
    for i=1,#str do 
        table.insert(tbl,string.char((str:sub(i,i):byte()+seq[idx])%256))
        if idx == len then 
            idx = 1 
        else 
            idx = idx + 1
        end
    end
    return table.concat(tbl)
end 
return antitamper,encrypt
