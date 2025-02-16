-- 100% made by DeepSeek R1...
-- ...cuz im a skid :3

-- getgenv().NeuralNetwork=getgenv().NeuralNetwork or loadstring(game:HttpGet("https://raw.githubusercontent.com/IvanTheProtogen/dumpsterfire/refs/heads/main/NeuralNetwork.lua"))();

NeuralNetwork = {
    new = function(self, inputSize, hiddenLayers, outputSize, options)
        local nn = {}
        options = options or {}
        
        nn.learningRate = options.learningRate or 0.01
        nn.activation = options.activation or function(x) return math.tanh(x) end
        nn.activationDeriv = options.activationDeriv or function(y) return 1 - y^2 end
        nn.outputActivation = options.outputActivation or function(x) return x end
        nn.outputDeriv = options.outputDeriv or function(y) return 1 end

        local function createMatrix(rows, cols)
            local m = {}
            for i = 1, rows do
                m[i] = {}
                for j = 1, cols do
                    m[i][j] = (math.random() - 0.5) * 0.1
                end
            end
            return m
        end

        nn.layers = {}
        local prevSize = inputSize
        for _, size in ipairs(hiddenLayers) do
            table.insert(nn.layers, {
                weights = createMatrix(size, prevSize),
                biases = createMatrix(size, 1)
            })
            prevSize = size
        end
        table.insert(nn.layers, {
            weights = createMatrix(outputSize, prevSize),
            biases = createMatrix(outputSize, 1)
        })

        function nn:forward(input)
            local function matMulVec(m, v)
                local result = {}
                for i = 1, #m do
                    local sum = 0
                    for j = 1, #m[i] do
                        sum = sum + m[i][j] * v[j]
                    end
                    result[i] = sum
                end
                return result
            end

            self.activations = {input}
            for i, layer in ipairs(self.layers) do
                local preact = matMulVec(layer.weights, self.activations[i])
                for j = 1, #preact do preact[j] = preact[j] + layer.biases[j][1] end
                
                local activation = {}
                if i == #self.layers then
                    for k = 1, #preact do activation[k] = self.outputActivation(preact[k]) end
                else
                    for k = 1, #preact do activation[k] = self.activation(preact[k]) end
                end
                
                table.insert(self.activations, activation)
            end
            return self.activations[#self.activations]
        end

        function nn:backwardPropagation(target)
            local function transpose(m)
                local t = {}
                for i = 1, #m[1] do
                    t[i] = {}
                    for j = 1, #m do
                        t[i][j] = m[j][i]
                    end
                end
                return t
            end

            local output = self.activations[#self.activations]
            local delta = {}
            for i = 1, #output do
                delta[i] = (output[i] - target[i]) * self.outputDeriv(output[i])
            end

            for i = #self.layers, 1, -1 do
                local layer = self.layers[i]
                local gradWeights = {}
                for j = 1, #delta do
                    gradWeights[j] = {}
                    for k = 1, #self.activations[i] do
                        gradWeights[j][k] = delta[j] * self.activations[i][k]
                    end
                end

                for j = 1, #layer.weights do
                    for k = 1, #layer.weights[j] do
                        layer.weights[j][k] = layer.weights[j][k] - self.learningRate * gradWeights[j][k]
                    end
                    layer.biases[j][1] = layer.biases[j][1] - self.learningRate * delta[j]
                end

                if i > 1 then
                    local newDelta = {}
                    local weightsT = transpose(layer.weights)
                    for j = 1, #weightsT do
                        newDelta[j] = 0
                        for k = 1, #weightsT[j] do
                            newDelta[j] = newDelta[j] + weightsT[j][k] * delta[k]
                        end
                        newDelta[j] = newDelta[j] * self.activationDeriv(self.activations[i][j])
                    end
                    delta = newDelta
                end
            end
        end

        function nn:backwardReinforce(action, reward)
            local output = self.activations[#self.activations]
            local oneHot = {}
            for i = 1, #output do
                oneHot[i] = (i == action) and 1 or 0
            end

            local delta = {}
            for i = 1, #output do
                delta[i] = (oneHot[i] - output[i]) * reward
            end

            for i = #self.layers, 1, -1 do
                local layer = self.layers[i]
                local gradWeights = {}
                for j = 1, #delta do
                    gradWeights[j] = {}
                    for k = 1, #self.activations[i] do
                        gradWeights[j][k] = delta[j] * self.activations[i][k]
                    end
                end

                for j = 1, #layer.weights do
                    for k = 1, #layer.weights[j] do
                        layer.weights[j][k] = layer.weights[j][k] + self.learningRate * gradWeights[j][k]
                    end
                    layer.biases[j][1] = layer.biases[j][1] + self.learningRate * delta[j]
                end

                if i > 1 then
                    local newDelta = {}
                    local weightsT = {}
                    for x = 1, #layer.weights[1] do
                        weightsT[x] = {}
                        for y = 1, #layer.weights do
                            weightsT[x][y] = layer.weights[y][x]
                        end
                    end
                    
                    for j = 1, #weightsT do
                        newDelta[j] = 0
                        for k = 1, #weightsT[j] do
                            newDelta[j] = newDelta[j] + weightsT[j][k] * delta[k]
                        end
                        newDelta[j] = newDelta[j] * self.activationDeriv(self.activations[i][j])
                    end
                    delta = newDelta
                end
            end
        end

        return nn
    end
}

return NeuralNetwork
