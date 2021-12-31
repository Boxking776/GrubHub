local UIMODULE = {}

UIMODULE.LoadChangelogs = function(Date,UpdateNum)

for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
    if v.Name == "UpdateLog" then v:Destroy() end
end

local UpdateLog = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local UICorner = Instance.new("UICorner")
local UIPadding = Instance.new("UIPadding")
local bg = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local bg_2 = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local Close = Instance.new("ImageButton")
local pattern = Instance.new("ImageLabel")
local UICorner_4 = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Desc = Instance.new("TextLabel")
local Changes = Instance.new("ScrollingFrame")
local UIPadding_2 = Instance.new("UIPadding")
local UIListLayout = Instance.new("UIListLayout")
local Ok = Instance.new("ImageButton")
local TextLabel = Instance.new("TextLabel")
local UIPadding_3 = Instance.new("UIPadding")
local UIPadding_4 = Instance.new("UIPadding")

UpdateLog.Name = "UpdateLog"
UpdateLog.Parent = game:GetService("Players").LocalPlayer.PlayerGui
UpdateLog.ResetOnSpawn = false

Frame.Parent = UpdateLog
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0.300000012, 185, 0.300000012, 185)

UIAspectRatioConstraint.Parent = Frame
UIAspectRatioConstraint.AspectRatio = 1.200

UICorner.CornerRadius = UDim.new(0.075000003, 0)
UICorner.Parent = Frame

UIPadding.Parent = Frame
UIPadding.PaddingBottom = UDim.new(0, 10)
UIPadding.PaddingLeft = UDim.new(0, 10)
UIPadding.PaddingRight = UDim.new(0, 10)
UIPadding.PaddingTop = UDim.new(0, 10)

bg.Name = "bg"
bg.Parent = Frame
bg.AnchorPoint = Vector2.new(0.5, 0.5)
bg.BackgroundColor3 = Color3.fromRGB(28, 69, 82)
bg.BorderSizePixel = 0
bg.Position = UDim2.new(0.5, 0, 0.50999999, 0)
bg.Rotation = -4.500
bg.Size = UDim2.new(1.01999998, 0, 1.04999995, 0)
bg.ZIndex = -4

UICorner_2.CornerRadius = UDim.new(0.100000001, 0)
UICorner_2.Parent = bg

bg_2.Name = "bg"
bg_2.Parent = Frame
bg_2.AnchorPoint = Vector2.new(0.5, 0.5)
bg_2.BackgroundColor3 = Color3.fromRGB(59, 177, 252)
bg_2.BorderSizePixel = 0
bg_2.Position = UDim2.new(0.494416177, 0, 0.519999981, 0)
bg_2.Rotation = -2.000
bg_2.Size = UDim2.new(1.01422346, 0, 1.02999997, 0)
bg_2.ZIndex = -3

UICorner_3.CornerRadius = UDim.new(0.100000001, 0)
UICorner_3.Parent = bg_2

Close.Name = "Close"
Close.Parent = Frame
Close.AnchorPoint = Vector2.new(0.5, 0.5)
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.BorderSizePixel = 0
Close.Position = UDim2.new(1.00276768, 0, -0.0161652602, 0)
Close.Size = UDim2.new(0.168692216, 0, 0.201093659, 0)
Close.ZIndex = 50
Close.AutoButtonColor = false
Close.Image = "rbxassetid://8083670964"
Close.HoverImage = "rbxassetid://8083671080"
Close.PressedImage = "rbxassetid://8083671233"
Close.ScaleType = Enum.ScaleType.Fit

pattern.Name = "pattern"
pattern.Parent = Frame
pattern.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
pattern.BackgroundTransparency = 1.000
pattern.BorderSizePixel = 0
pattern.Size = UDim2.new(1, 0, 1, 0)
pattern.ZIndex = 3
pattern.Image = "rbxassetid://6511368117"
pattern.ImageColor3 = Color3.fromRGB(59, 180, 255)
pattern.ImageTransparency = 0.950
pattern.ScaleType = Enum.ScaleType.Tile
pattern.TileSize = UDim2.new(0, 100, 0, 100)

UICorner_4.CornerRadius = UDim.new(0.100000001, 0)
UICorner_4.Parent = pattern

Title.Name = "Title"
Title.Parent = Frame
Title.AnchorPoint = Vector2.new(0, 1)
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.Position = UDim2.new(-0.0441533104, 0, 0.0571333915, -12)
Title.Rotation = -2.000
Title.Size = UDim2.new(0.650637329, 0, 0.15178515, 0)
Title.ZIndex = 3
Title.Font = Enum.Font.FredokaOne
Title.Text = "Welcome!"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 18.000
Title.TextStrokeColor3 = Color3.fromRGB(28, 69, 82)
Title.TextStrokeTransparency = 0.000
Title.TextWrapped = true
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextYAlignment = Enum.TextYAlignment.Bottom

Desc.Name = "Desc"
Desc.Parent = Frame
Desc.AnchorPoint = Vector2.new(0.5, 0)
Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Desc.BackgroundTransparency = 1.000
Desc.BorderSizePixel = 0
Desc.Position = UDim2.new(0.5, 0, 0.0329999998, 0)
Desc.Size = UDim2.new(0.800000012, 0, 0.100000001, 0)
Desc.ZIndex = 10
Desc.Font = Enum.Font.FredokaOne
Desc.Text = "Update "..tostring(UpdateNum).." ("..Date..")"
Desc.TextColor3 = Color3.fromRGB(59, 177, 252)
Desc.TextScaled = true
Desc.TextSize = 18.000
Desc.TextWrapped = true

Changes.Name = "Changes"
Changes.Parent = Frame
Changes.Active = true
Changes.AnchorPoint = Vector2.new(0, 1)
Changes.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Changes.BackgroundTransparency = 1.000
Changes.BorderSizePixel = 0
Changes.Position = UDim2.new(0, 0, 0.74000001, 0)
Changes.Size = UDim2.new(1, 0, 0.600000024, 0)
Changes.ZIndex = 15
Changes.BottomImage = "rbxassetid://5722186442"
Changes.MidImage = "rbxassetid://5722187782"
Changes.TopImage = "rbxassetid://5722188468"
Changes.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar

UIPadding_2.Parent = Changes
UIPadding_2.PaddingBottom = UDim.new(0, 11)
UIPadding_2.PaddingLeft = UDim.new(0, 5)
UIPadding_2.PaddingRight = UDim.new(0, 10)
UIPadding_2.PaddingTop = UDim.new(0, 11)

UIListLayout.Parent = Changes
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

Ok.Name = "Ok"
Ok.Parent = Frame
Ok.AnchorPoint = Vector2.new(0.5, 0.5)
Ok.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Ok.BackgroundTransparency = 1.000
Ok.BorderSizePixel = 0
Ok.Position = UDim2.new(0.5, 0, 0.875, 0)
Ok.Size = UDim2.new(0.5, 0, 0.224999994, 0)
Ok.ZIndex = 6
Ok.AutoButtonColor = false
Ok.Image = "rbxassetid://6869680115"
Ok.HoverImage = "rbxassetid://6903539993"
Ok.PressedImage = "rbxassetid://6903534547"
Ok.ScaleType = Enum.ScaleType.Slice
Ok.SliceCenter = Rect.new(55, 55, 95, 95)

TextLabel.Parent = Ok
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.ZIndex = 7
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = "Discord"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextStrokeColor3 = Color3.fromRGB(17, 58, 72)
TextLabel.TextWrapped = true

UIPadding_3.Parent = Ok
UIPadding_3.PaddingBottom = UDim.new(0.100000001, 0)
UIPadding_3.PaddingLeft = UDim.new(0.0250000004, 0)
UIPadding_3.PaddingRight = UDim.new(0.0250000004, 0)
UIPadding_3.PaddingTop = UDim.new(0.100000001, 0)

UIPadding_4.Parent = UpdateLog
UIPadding_4.PaddingTop = UDim.new(0, -18)

Ok.MouseButton1Down:Connect(function()
local openingMusicitf86te = Instance.new("Sound",game:GetService("SoundService"))
openingMusicitf86te.SoundId = "rbxassetid://7222026049"
openingMusicitf86te.Volume = 1.5
openingMusicitf86te.PlayOnRemove = true
openingMusicitf86te.Playing = false
openingMusicitf86te:Destroy()
end)

Close.MouseButton1Down:Connect(function()
    local openingMusicitf86te = Instance.new("Sound",game:GetService("SoundService"))
    openingMusicitf86te.SoundId = "rbxassetid://7222026049"
    openingMusicitf86te.Volume = 1.5
    openingMusicitf86te.PlayOnRemove = true
    openingMusicitf86te.Playing = false
    openingMusicitf86te:Destroy()
    wait(1.2)
    Frame:TweenPosition(UDim2.new(1.5, 0,0, 1.5))
    wait(2)
    UpdateLog:Destroy()
end)
    
wait(0.25)

local openingMusicitf86te = Instance.new("Sound",game:GetService("SoundService"))
openingMusicitf86te.SoundId = "rbxassetid://8160978920"
openingMusicitf86te.PlayOnRemove = true
openingMusicitf86te.Playing = false
openingMusicitf86te.PlaybackSpeed = 1.1
openingMusicitf86te:Destroy()
    
end

UIMODULE.AddLog = function(Text,Mode)
    
    local starterString = ""
    if Mode == true then starterString = "[+] " end
    if Mode == false then starterString = "[-] " end
    if Mode == nil then starterString = "[~] " end
    
    local fullText = ""
    if Mode ~= "SUBTITLE" or Mode ~= "MISC" then
    fullText = starterString..Text
    end
    
    if Mode == "SUBTITLE" then
        fullText = " ~ "..Text.." ~ "
    end
    
    if Mode == "MISC" then
        fullText = Text
    end
    
    local Change = Instance.new("Frame")
    local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
    local Label = Instance.new("TextLabel")
    
    Change.Name = "Change"
    Change.Parent = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("UpdateLog"):WaitForChild("Frame"):WaitForChild("Changes")
    Change.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Change.BorderSizePixel = 0
    Change.Size = UDim2.new(1, 0, 0, 100)
    
    UIAspectRatioConstraint.Parent = Change
    UIAspectRatioConstraint.AspectRatio = 10.000
    
    Label.Name = "Label"
    Label.Parent = Change
    Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Label.BackgroundTransparency = 1.000
    Label.BorderSizePixel = 0
    Label.Size = UDim2.new(1, 0, 1, 0)
    Label.Font = Enum.Font.FredokaOne
    Label.TextColor3 = Color3.fromRGB(59, 177, 252)
    Label.TextScaled = true
    Label.TextSize = 18.000
    Label.TextWrapped = true
    Label.Text = fullText
end

UIMODULE.FunctionEnabled = true

return UIMODULE
