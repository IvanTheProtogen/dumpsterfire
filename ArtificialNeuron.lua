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

return Neuron
