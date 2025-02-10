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

local function relu(x)
    return math.max(0,x)
end

local neurons = {}
for i=1,16 do
    local hh = {}
    for h=1,16 do
        table.insert(hh,math.random())
    end
    neurons[i] = Neuron.new(relu, hh, math.random())
end

local ToChar = {}
for i=1,26 do
    ToChar[i] = string.char(i+96)
end
ToChar[0] = " "

local FromChar = {}
for i,v in pairs(ToChar) do
    FromChar[v] = i
end

local function ToNeuronData(txt)
    local tbl = {}
    for i=1,16 do
        local ltr = string.sub(txt,i,i)
        if ltr=="" or ltr==nil then 
            ltr = " "
        end
        table.insert(tbl, FromChar[string.lower(ltr)]/26)
    end
    return tbl
end

local function ToReadableText(tbl)
    local txt = ""
    for i,v in pairs(tbl) do
        local hehe = ToChar[math.modf(v*26)] or " "
        txt = txt..hehe
    end
    return txt
end

local function ActivateNetwork(data)
    local tbl = {}
    for i,v in pairs(neurons) do
        table.insert(tbl, v:activate(data))
    end
    return tbl
end

local function TrainNetwork(data, targetdata, lrate)
    for i,v in pairs(neurons) do
        v:train(data,targetdata[i],lrate)
    end
end

local trainingdata = {
    ["hello"] = "shut up",
    ["fuck you"] = "kill yourself", -- Don't ask why'd I add this.
    ["are you ai"] = "nope"
}

for i=1,10000 do
    for i,v in pairs(trainingdata) do 
        TrainNetwork(ToNeuronData(i),ToNeuronData(v),0.5)
    end
end

local request = "hello"
local response = ToReadableText(ActivateNetwork(ToNeuronData(request)))

print("Request:",request)
print("Response:",response)
