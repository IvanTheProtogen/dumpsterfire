-- this time, the code is made by me
-- training would be custom, it's all upto you

-- getgenv().NeuralNetwork=getgenv().NeuralNetwork or loadstring(game:HttpGet("https://raw.githubusercontent.com/IvanTheProtogen/dumpsterfire/refs/heads/main/NeuralNetwork.lua"))();

getgenv().Neuron=getgenv().Neuron or loadstring(game:HttpGet("https://raw.githubusercontent.com/IvanTheProtogen/dumpsterfire/refs/heads/main/ArtificialNeuron.lua"))();

NeuralNetwork = {}
NeuralNetwork.__index = NeuralNetwork

function NeuralNetwork.new(data)
    local self = setmetatable({}, NeuralNetwork)
    self.layers = data
    return self
end

function NeuralNetwork:activate(inputs)
    local prevOutput = inputs
    for _,layer in ipairs(self.layers) do
        local memorize = prevOutput
        prevOutput = {}
        for __,neuron in ipairs(layer) do
            prevOutput[__] = neuron:activate(memorize)
        end
    end
    return prevOutput
end

return NeuralNetwork
