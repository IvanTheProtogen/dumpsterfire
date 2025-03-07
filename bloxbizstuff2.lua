local remote = game:GetService("ReplicatedStorage").BloxbizRemotes.CatalogOnApplyOutfit
local x = 0

while true do
local args = {
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
        ["BodyTypeScale"] = 0.15,
        ["ClimbAnimation"] = 658833139,
        ["LeftArmColor"] = nil --[[Color3]],
        ["Face"] = 144075659,
        ["Pants"] = 9111488101,
        ["RightArmColor"] = nil --[[Color3]],
        ["DepthScale"] = 0.85,
        ["WidthScale"] = 0.8,
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
        ["HeadScale"] = 0.85,
        ["HeightScale"] = 0.9,
        ["HeadColor"] = nil --[[Color3]],
        ["LeftLeg"] = 0
    }
}

remote:FireServer(unpack(args))
x=x+5
task.wait(1/20)
end
