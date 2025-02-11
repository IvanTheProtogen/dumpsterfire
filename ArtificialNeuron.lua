print("Hello World!")-- skidded out from AI, cuz idk anything about implementing a neuron lol
-- well, i edited it a little.. so yeah 

-- getgenv().Neuron=getgenv().Neuron or loadstring(game:HttpGet("https://raw.githubusercontent.com/IvanTheProtogen/dumpsterfire/refs/heads/main/ArtificialNeuron.lua"))();

Neuron = {}
Neuron.__index = Neuron

function Neuron.new(activFunc, derivFunc, weights, bias)
    local self = setmetatable({}, Neuron)
    self.activFunc = activFunc
    self.derivFunc = derivFunc -- if you DONT want to use the derivative, set it as function()return 1 end.
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
    -- gamma and nextInputs are optional
    local output = self:activate(inputs)
    local target = reward
    if nextInputs then
        local nextOutput = self:activate(nextInputs)
        target = reward + gamma * nextOutput
    end
    local gradient = self.derivFunc(output)*(target-output)
    for i = 1, #self.weights do
        self.weights[i] = self.weights[i] + learningRate * gradient * inputs[i]
    end
    self.bias = self.bias + learningRate * gradient
    return output
end

return Neuron
