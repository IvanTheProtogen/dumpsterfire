local function gelu(x)
    return x*(1/(1+math.exp(-x*1.704)))
end
local function geluDeriv(x)
    local k = 1.704
    local s = 1/(1+math.exp(-k*x))
    return s+x*k*s*(1-s)
end
