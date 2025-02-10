-- This is a demonstration of my own complex activation function called "Piecewise Universal Unit".
-- (PwUU for short!)

-- The formula for PwUU is:
-- f(n, p, x) = min(((tanh(x)*2n)+(x*(2-2n)))/2, 0) + max(0, ((tanh(x)*2p)+(x*(2-2p)))/2)

-- Fun Fact!!!
-- If you'll set `n` to `1.5` and `p` to `-0.5`, PwUU would behave similarly to Swish! ( x*sigmoid(x) )

-- skidded out from AI, cuz idk anything about implementing a neuron lol
-- well, i added it a little.. so yeah

Neuron = {}
Neuron.__index = Neuron

function Neuron.new(activFunc, weights, bias)
    local self = setmetatable({}, Neuron)
    self.activFunc = activFunc
    self.weights = weights
    self.bias = bias
    return self
end

function Neuron:activate(inputs)
    assert(#inputs==#self.weights, "amount of inputs should be equal to amount of weights")
    local sum = 0
    for i = 1, #inputs do
        sum = sum + inputs[i] * self.weights[i]
    end
    sum = sum + self.bias
    return self.activFunc(sum)
end

function Neuron:train(inputs, reward, learningRate, gamma, nextInputs)
    local output = self:activate(inputs)
    local target = reward
    if nextInputs then
        local nextOutput = self:activate(nextInputs)
        target = reward + gamma * nextOutput
    end
    local error = target - output
    for i = 1, #self.weights do
        self.weights[i] = self.weights[i] + learningRate * error * inputs[i]
    end
    self.bias = self.bias + learningRate * error
    return output
end

-- THERE WE GO!!!

local function CreateCAF(n,p)
    return function(x)
        return math.min((math.tanh(x)*2*n)+(x*(2-(2*n)))/2, 0) + math.max(0, ((math.tanh(x)*2*p)+(x*(2-(2*p))))/2)
    end
end

local neuronS = Neuron.new(CreateCAF(1,1), {0.5, 0.5}, 0.5)
local neuronL = Neuron.new(CreateCAF(0,0), {0.5, 0.5}, 0.5)
local neuronU = Neuron.new(CreateCAF(0.5,0.5), {0.5, 0.5}, 0.5)

local times = 0
while times < 1000000 do
    local a = math.random(0,10)/10
    local b = math.random(0,10)/10
    local x = a-b
    neuronS:train({a,b},x,0.1)
    neuronL:train({a,b},x,0.1)
    neuronU:train({a,b},x,0.1)
    times=times+1
end

print("Smooth Neuron: 0.5 - 0.3 =",neuronS:activate({0.5,0.3})) -- 0.27
print("Linear Neuron: 0.5 - 0.3 =",neuronL:activate({0.5,0.3})) -- 0.20
print("Universal Neuron: 0.5 - 0.3 =",neuronU:activate({0.5,0.3})) -- 0.24
