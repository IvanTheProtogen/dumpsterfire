local function gelu(x)
    return x*(1/(1+math.exp(-x*1.704)))
end
local function geluDeriv(x)
    local s = 1/(1+math.exp(-x*1.704))
    return s+s*(1-s)
end
