-- skidded from AI, cuz idk shit about implementing an artificial neuron.
Neuron = {}
Neuron.__index = Neuron

function Neuron:new(input_size)
    local obj = {}
    setmetatable(obj, self)
    obj.weights = {}
    for i = 1, input_size do
        obj.weights[i] = math.random()
    end
    obj.bias = math.random()
    obj.learning_rate = 0.1
    return obj
end

function Neuron:sigmoid(x) -- oh yeah, this "sigmoid" has been replaced with ReLU by me now
    return math.max(0,x)
end

function Neuron:sigmoid_derivative(x) -- same shit
    if x < 0 then
        return 0
    end
    return 1
end

-- holy shit, ReLU is so fucking simple yet so amazing

function Neuron:feedforward(inputs)
    local weighted_sum = 0
    for i = 1, #inputs do
        weighted_sum = weighted_sum + (inputs[i] * self.weights[i])
    end
    weighted_sum = weighted_sum + self.bias
    self.output = self:sigmoid(weighted_sum)
    return self.output
end

function Neuron:train(inputs, target_output)
    local output = self:feedforward(inputs)
    local error = target_output - output
    for i = 1, #inputs do
        self.weights[i] = self.weights[i] + (self.learning_rate * error * self:sigmoid_derivative(output) * inputs[i])
    end
    self.bias = self.bias + (self.learning_rate * error * self:sigmoid_derivative(output))
    return output
end
