local remote = game:GetService("ReplicatedStorage").BloxbizRemotes.CatalogOnApplyOutfit 
local remote2 = game:GetService("ReplicatedStorage").BloxbizRemotes.CatalogOnResetOutfit
local x = 0
local size = 1
local active = true 
local mode = 1

task.spawn(function()
while active do 
local args 
if mode == 1 then 
args = {
    [1] = {
        ["WalkAnimation"] = 5319909330,
        ["Accessories"] = {
            [1] = {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 12114581505,
                ["Position"] = Vector3.new(0, 0, 0),
                ["Scale"] = Vector3.new(1, 1, 1),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Front
            },
            [2] = {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 14103139737,
                ["Position"] = Vector3.new(0, 0, 0),
                ["Scale"] = Vector3.new(1, 1, 1),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Back
            },
            [3] = {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 14991646689,
                ["Position"] = Vector3.new(0, 0, 0),
                ["Scale"] = Vector3.new(1, 1, 1),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Neck
            },
            [4] = {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 12114570675,
                ["Position"] = Vector3.new(0, 0, 0),
                ["Scale"] = Vector3.new(1, 1, 1),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Shoulder
            },
            [5] = {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 15295909184,
                ["Position"] = Vector3.new(0, 0, 0),
                ["Scale"] = Vector3.new(1, 1, 1),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Hat
            },
            [6] = {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 12114574600,
                ["Position"] = Vector3.new(0, 0, 0),
                ["Scale"] = Vector3.new(1, 1, 1),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Shoulder
            },
            [7] = {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 607702162,
                ["Position"] = Vector3.new(0, 0, 0),
                ["Scale"] = Vector3.new(1, 1, 1),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Hat
            },
            [8] = {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 11714797755,
                ["Position"] = Vector3.new(0, 0, 0),
                ["Scale"] = Vector3.new(1, 1, 1),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Hat
            },
            [9] = {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 7485974573,
                ["Position"] = Vector3.new(0, 0, 0),
                ["Scale"] = Vector3.new(1, 1, 1),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Waist
            },
            [10] = {
                ["Rotation"] = Vector3.new(-90, 0, 180),
                ["AssetId"] = 123708205722564,
                ["Position"] = Vector3.new(0, 0.75, -1-(2/3)),
                ["Scale"] = Vector3.new(2/3, 2/3, 2/3),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Waist
            },
            [11] = {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 16682314865,
                ["Position"] = Vector3.new(0.15,-0.25,-1.3),
                ["Scale"] = Vector3.new(1.25,1.25,1.25),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Waist
            },
            [12] = {
                ["Rotation"] = Vector3.new(0,0,0),
                ["AssetId"] = 14447854357,
                ["Position"] = Vector3.new(-0.15,-0.25,-1.3),
                ["Scale"] = Vector3.new(1.25,1.25,1.25),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Waist
            },
            [13] = {
                ["Rotation"] = Vector3.new(0, 90, 120),
                ["AssetId"] = 17165122954,
                ["Position"] = Vector3.new(0.4, -0.2, -0.2),
                ["Scale"] = Vector3.new(1, 1, 1),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Back
            },
            [14] = {
                ["Rotation"] = Vector3.new(25, 180, 0),
                ["AssetId"] = 120703065106664,
                ["Position"] = Vector3.new(0.3, 0, 0.3),
                ["Scale"] = Vector3.new(0.5, 0.5, 0.5),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Waist
            },
            [15] = {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 12421057027,
                ["Position"] = Vector3.new(0, 1, -0.8),
                ["Scale"] = Vector3.new(0.175, 0.175, 0.125),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Waist
            },
            [16] = {
                ["Rotation"] = Vector3.new(0, 0, 180),
                ["AssetId"] = 7669629724,
                ["Position"] = Vector3.new(0, 1.55, -0.8),
                ["Scale"] = Vector3.new(0.1, 0.3, 0.1),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Waist
            },
            [17] = {
                ["Rotation"] = Vector3.new(0, 0+x, 0),
                ["AssetId"] = 18839688816,
                ["Position"] = Vector3.new(2, 0.5+(math.sin((math.pi/180)*x)/2), -0.5),
                ["Scale"] = Vector3.new(0.5, 0.5, 0.5),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Hat
            }
        },
        ["RightLegColor"] = nil --[[Color3]],
        ["MoodAnimation"] = 0,
        ["LeftLegColor"] = nil --[[Color3]],
        ["JumpAnimation"] = 5319917561,
        ["ProportionScale"] = 0.5,
        ["BodyTypeScale"] = 0.30000001192092896*size,
        ["ClimbAnimation"] = 5319931619,
        ["LeftArmColor"] = nil --[[Color3]],
        ["Face"] = 0,
        ["Pants"] = 11752024081,
        ["RightArmColor"] = nil --[[Color3]],
        ["DepthScale"] = 1*size,
        ["WidthScale"] = 1*size,
        ["SwimAnimation"] = 5319927054,
        ["RightArm"] = 0,
        ["GraphicTShirt"] = 0,
        ["Head"] = 0,
        ["Shirt"] = 11752023381,
        ["RightLeg"] = 0,
        ["RunAnimation"] = 5319900634,
        ["Torso"] = 48474356,
        ["FallAnimation"] = 5319914476,
        ["TorsoColor"] = nil --[[Color3]],
        ["IdleAnimation"] = 619511648,
        ["LeftArm"] = 0,
        ["HeadScale"] = 1*size,
        ["HeightScale"] = 1*size,
        ["HeadColor"] = nil --[[Color3]],
        ["LeftLeg"] = 0
    }
}
else if mode == 2 then 
args = {
    {
        ["WalkAnimation"] = 658831143,
        ["Accessories"] = {
            {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 14021729331,
                ["Position"] = Vector3.new(0, 0, 0),
                ["Scale"] = Vector3.new(1, 1, 1),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Neck
            },
            {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 12114574600,
                ["Position"] = Vector3.new(0, 0, 0),
                ["Scale"] = Vector3.new(1, 1, 1),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Shoulder
            },
            {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 12114570675,
                ["Position"] = Vector3.new(0, 0, 0),
                ["Scale"] = Vector3.new(1, 1, 1),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Shoulder
            },
            {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 5674226663,
                ["Position"] = Vector3.new(0, 0, 0),
                ["Scale"] = Vector3.new(1, 1, 1),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Back
            },
            {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 9058146317,
                ["Position"] = Vector3.new(0, 0, 0),
                ["Scale"] = Vector3.new(1, 1, 1),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Hat
            },
            {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 12114581505,
                ["Position"] = Vector3.new(0, 0, 0),
                ["Scale"] = Vector3.new(1, 1, 1),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Front
            },
            {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 14516297893,
                ["Position"] = Vector3.new(0, 0, 0),
                ["Scale"] = Vector3.new(1, 1, 1),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Waist
            },
            {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 12830338562,
                ["Position"] = Vector3.new(0, 0, 0),
                ["Scale"] = Vector3.new(1, 1, 1),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Waist
            },
            {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 12830343073,
                ["Position"] = Vector3.new(0, 0, 0),
                ["Scale"] = Vector3.new(1, 1, 1),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Waist
            },
            {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 85954860706918,
                ["Position"] = Vector3.new(0, 0, 0),
                ["Scale"] = Vector3.new(1, 1, 1),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Waist
            },
            {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 14447854357,
                ["Position"] = Vector3.new(-0.5, 0.9, -1.8+0.5),
                ["Scale"] = Vector3.new(2.6, 2.2, 2.75-0.5),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Front
            },
            {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 86938172725445,
                ["Position"] = Vector3.new(0.5, 1.5, -2+0.5),
                ["Scale"] = Vector3.new(1.8, 1.5, 1.5-0.5),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Front
            },
            {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 14447888901,
                ["Position"] = Vector3.new(-0.75,1.3,-1.5),
                ["Scale"] = Vector3.new(0.75,0.75,0.75),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Front
            },
            {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 16782862794,
                ["Position"] = Vector3.new(0.75,1.3,-1.7),
                ["Scale"] = Vector3.new(0.85,0.85,0.85),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Front
            },
            {
                ["Rotation"] = Vector3.new(0, 0, 0),
                ["AssetId"] = 17714492082,
                ["Position"] = Vector3.new(0,0+((math.sin((math.pi/45)*x)/2)+0.5),0),
                ["Scale"] = Vector3.new(1,1,1),
                ["IsLayered"] = false,
                ["AccessoryType"] = Enum.AccessoryType.Hat
            }
        },
        ["RightLegColor"] = nil --[[Color3]],
        ["MoodAnimation"] = 0,
        ["LeftLegColor"] = nil --[[Color3]],
        ["JumpAnimation"] = 658832070,
        ["ProportionScale"] = 1,
        ["BodyTypeScale"] = 0.15*size,
        ["ClimbAnimation"] = 658833139,
        ["LeftArmColor"] = nil --[[Color3]],
        ["Face"] = 144075659,
        ["Pants"] = 9111488101,
        ["RightArmColor"] = nil --[[Color3]],
        ["DepthScale"] = 0.85*size,
        ["WidthScale"] = 0.8*size,
        ["SwimAnimation"] = 658832807,
        ["RightArm"] = 0,
        ["GraphicTShirt"] = 0,
        ["Head"] = 0,
        ["Shirt"] = 9111486907,
        ["RightLeg"] = 0,
        ["RunAnimation"] = 658830056,
        ["Torso"] = 48474356,
        ["FallAnimation"] = 658831500,
        ["TorsoColor"] = nil --[[Color3]],
        ["IdleAnimation"] = 619511648,
        ["LeftArm"] = 0,
        ["HeadScale"] = 0.85*size,
        ["HeightScale"] = 0.9*size,
        ["HeadColor"] = nil --[[Color3]],
        ["LeftLeg"] = 0
    }
}
else args={} end end

remote:FireServer(unpack(args))
pcall(function()
local humanoid = game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid")
humanoid.WalkSpeed = 16*size
humanoid.JumpPower = 50*size
workspace.Gravity = 196.1999969482422*size
end)
x=x+5
task.wait(1/20)
end
end)

ClientAdmin=loadstring(game:HttpGet("http://github.com/IvanTheProtogen/ClientAdmin/raw/main/main.lua"))();

local config = {}
config.Commands = {}

function config.Commands.size(args)
	size = tonumber(args[1]) or 1
end

function config.Commands.mode(args)
	mode = tonumber(args[1]) or 0 
	task.wait(0.5)
	remote2:FireServer()
end

function config.Commands.stop()
	active = false
	config.Commands = {}
end

ClientAdmin(config)
