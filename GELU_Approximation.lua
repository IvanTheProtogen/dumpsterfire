local function gelu(x)
    return x*(1/(1+math.exp(-x*1.704)))
end
local function geluDeriv(x)
    local x = -gelu(x)
    if x < 0 then
        return (gelu(x+0.75)*1.704)/2
    end
    return -((gelu(-x+0.75)*1.704)/2)
end
