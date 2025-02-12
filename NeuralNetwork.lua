-- worked together with DeepSeek to make this
-- the neural network would learn with the infamous backpropagation method

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
    for _, layer in ipairs(self.layers) do
        local memorize = prevOutput
        prevOutput = {}
        for __, neuron in ipairs(layer) do
            prevOutput[__] = neuron:activate(memorize)
        end
    end
    return prevOutput
end

function NeuralNetwork:train(inputs, targets, learning_rate) -- 100% AI-made
    -- Forward pass: store outputs and sums for each layer
    local layerOutputs = {inputs}
    local layerSums = {}

    for i, layer in ipairs(self.layers) do
        local outputs = {}
        local sums = {}
        for j, neuron in ipairs(layer) do
            local output, sum = neuron:activate(layerOutputs[i])
            outputs[j] = output
            sums[j] = sum
        end
        table.insert(layerOutputs, outputs)
        table.insert(layerSums, sums)
    end

    -- Calculate output errors
    local outputErrors = {}
    for i, output in ipairs(layerOutputs[#layerOutputs]) do
        outputErrors[i] = targets[i] - output
    end

    -- Backward pass: calculate deltas and update weights
    local deltas = {}
    for i = #self.layers, 1, -1 do
        deltas[i] = {}
        for j, neuron in ipairs(self.layers[i]) do
            if i == #self.layers then
                -- Output layer
                deltas[i][j] = outputErrors[j] * neuron.derivFunc(layerSums[i][j])
            else
                -- Hidden layer
                local sum = 0
                for k, nextNeuron in ipairs(self.layers[i + 1]) do
                    sum = sum + nextNeuron.weights[j] * deltas[i + 1][k]
                end
                deltas[i][j] = sum * neuron.derivFunc(layerSums[i][j])
            end

            -- Update weights and bias
            for k, input in ipairs(layerOutputs[i]) do
                neuron.weights[k] = neuron.weights[k] + learning_rate * deltas[i][j] * input
            end
            neuron.bias = neuron.bias + learning_rate * deltas[i][j]
        end
    end
end

return NeuralNetwork
