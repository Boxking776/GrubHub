
for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "GrubHub" then
    v:Destroy()
    end
end

local UICorner = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")
local SideButton = Instance.new("ImageButton")
local Line = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local CreditTitle = Instance.new("TextLabel")
local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
local Bar = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local Close = Instance.new("ImageButton")
local UIListLayout = Instance.new("UIListLayout")
local Mini = Instance.new("ImageButton")
local Mode = Instance.new("ImageButton")
local UICorner_4 = Instance.new("UICorner")
local Line_2 = Instance.new("Frame")
local Fade = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local Title_2 = Instance.new("TextLabel")
local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")
local Selections = Instance.new("Frame")
local UIListLayout_2 = Instance.new("UIListLayout")
local Version = Instance.new("TextLabel")
local UITextSizeConstraint_4 = Instance.new("UITextSizeConstraint")
local Close_2 = Instance.new("ImageButton")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local Tab = Instance.new("ScrollingFrame")
local UIListLayout_3 = Instance.new("UIListLayout")
local ColorPickers = Instance.new("Frame")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local GroupService = game:GetService("GroupService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local Chat = game:GetService("Chat")

local Assets = loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxking776/GrubHub/main/modules/return/Assets"))()

repeat wait() until Assets ~= nil

local Player = Players.LocalPlayer

local Mouse = Player:GetMouse()
local OceanLib = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Pages = Instance.new("Frame")
local Side = Instance.new("Frame")
local Overlay = Instance.new("Frame")

local Settings = {
	Name = "GrubHub",
	UIVer = "5.2",

	Cooldown = false
}

local Library = {}

function Library:ToggleSide()
	if not Settings.Cooldown then
		Settings.Cooldown = true
		if Side.Visible then
			Side:TweenPosition(UDim2.new(-.3, 0, 0, 0), "Out", "Quad", .5)
			wait(.5)
			Side.Visible = false
			Settings.Cooldown = false
		else
			Side:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", .5)
			Side.Visible = true
			wait(.5)
			Settings.Cooldown = false
		end
	end
end

function Library:ChangeMode(Mode)
	if Mode == "Black" then
		Main.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
		TopBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		Bar.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
		Side.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	elseif Mode == "White" then
		Main.BackgroundColor3 = Color3.fromRGB(175, 175, 175)
		TopBar.BackgroundColor3 = Color3.fromRGB(125, 125, 125)
		Bar.BackgroundColor3 = Color3.fromRGB(114, 114, 114)
		Side.BackgroundColor3 = Color3.fromRGB(114, 114, 114)
	end
end

function Library:Terminate()
	if not Settings.Cooldown then
		Settings.Cooldown = true
		Main:TweenPosition(UDim2.new(0.255, 0, 1, 0), "Out", "Quad", .4)
		wait(.4)
		Main.Parent:Destroy()
	end
end

function Library:Draggable(frame, parent)
        
    parent = parent or frame
    
    -- stolen from wally or kiriot, kek
    local dragging = false
    local dragInput, mousePos, framePos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = parent.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            parent.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end)
end

function Library:Load(Name)
	
    local ImageId = Assets['MenuOpenIcon']

	if ImageId then
		SideButton.Image = tostring(ImageId)
	else
		warn("Error loading UI Library")
	end

	OceanLib.Name = "GrubHub"
	OceanLib.Parent = game:GetService("CoreGui")
	OceanLib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Library:Draggable(TopBar, Main)
	Library:ChangeMode("Black")

	Main.Name = "Main"
	Main.Parent = OceanLib
	Main.BorderSizePixel = 0
	Main.ClipsDescendants = false
	Main.Selectable = true
	Main.Size = UDim2.new(0.250, 0, 0.325, 0)
	UICorner.Parent = Main

    Overlay.Name = "Overlay"
    Overlay.Parent = Main
	
    Overlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Overlay.BackgroundTransparency = 1.000
    Overlay.ClipsDescendants = true
    Overlay.Size = UDim2.new(0.998521745, 0, 0.998857379, 0)
    Overlay.ZIndex = 5
	ColorPickers.Name = "ColorPickers"
	ColorPickers.Parent = Main
	ColorPickers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ColorPickers.BackgroundTransparency = 1.000
	ColorPickers.Position = UDim2.new(1.03418326, 0, -0.00358013413, 0)
	ColorPickers.Size = UDim2.new(0.23284857, 0, 0.304311395, 0)
	TopBar.Name = "TopBar"
	TopBar.Parent = Main
	TopBar.BorderSizePixel = 0
	TopBar.Position = UDim2.new(-0.000638484955, 0, -0.00149841304, 0)
	TopBar.Size = UDim2.new(1, 0, 0.146666661, 0)
	TopBar.ZIndex = 2
	Bar.Name = "Bar"
	Bar.Parent = TopBar
	Bar.Position = UDim2.new(0.800359368, 0, 0.181818187, 0)
	Bar.Size = UDim2.new(0.17578125, 0, 0.636363626, 0)
	Bar.ZIndex = 3
	Side.Name = "Side"
	Side.Parent = Overlay
	Side.BorderSizePixel = 0
	Side.Size = UDim2.new(0.263671875, 0, 1, 0)
	Side.Visible = false
	Side.ZIndex = 5
	UICorner_3.Parent = Bar
	UICorner_2.Parent = TopBar
	SideButton.Name = "SideButton"
	SideButton.Parent = TopBar
	SideButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SideButton.BackgroundTransparency = 1.000
	SideButton.Position = UDim2.new(0.0244444441, 0, 0.181818187, 0)
	SideButton.Size = UDim2.new(0.0546875, 0, 0.636363626, 0)
	SideButton.ZIndex = 3
	Line.Name = "Line"
	Line.Parent = TopBar
	Line.BackgroundColor3 = Color3.fromRGB(113, 113, 113)
	Line.BackgroundTransparency = 0.750
	Line.BorderSizePixel = 0
	Line.Position = UDim2.new(0, 0, 1, 0)
	Line.Size = UDim2.new(1, 0, 0.0454545468, 0)
	Line.ZIndex = 3
	Title.Name = "Title"
	Title.Parent = TopBar
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.105046876, 0, 0.181818187, 0)
	Title.Size = UDim2.new(0.63671875, 0, 0.340909094, 0)
	Title.ZIndex = 3
	Title.Font = Enum.Font.GothamSemibold
	Title.Text = "Epic Script Here"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextScaled = true
	Title.TextSize = 14.000
	Title.TextWrapped = true
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.TextYAlignment = Enum.TextYAlignment.Top
	UITextSizeConstraint.Parent = Title
	UITextSizeConstraint.MaxTextSize = 15
	CreditTitle.Name = "CreditTitle"
	CreditTitle.Parent = TopBar
	CreditTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CreditTitle.BackgroundTransparency = 1.000
	CreditTitle.Position = UDim2.new(0.105046876, 0, 0.531818211, 0)
	CreditTitle.Size = UDim2.new(0.63671875, 0, 0.340909094, 0)
	CreditTitle.ZIndex = 3
	CreditTitle.Font = Enum.Font.Highway
	CreditTitle.Text = "By Ocean Hub"
	CreditTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
	CreditTitle.TextScaled = true
	CreditTitle.TextSize = 14.000
	CreditTitle.TextWrapped = true
	CreditTitle.TextXAlignment = Enum.TextXAlignment.Left
	CreditTitle.TextYAlignment = Enum.TextYAlignment.Top
	UITextSizeConstraint_2.Parent = CreditTitle
	UITextSizeConstraint_2.MaxTextSize = 15
	Close.Name = "Close"
	Close.Parent = Bar
	Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Close.BackgroundTransparency = 1.000
	Close.LayoutOrder = 3
	Close.Position = UDim2.new(0.791666687, 0, 0, 0)
	Close.Size = UDim2.new(0.277777791, 0, 0.892857134, 0)
	Close.Image = "rbxassetid://3944676352"
	Close.ScaleType = Enum.ScaleType.Fit
	UIListLayout.Parent = Bar
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	UIListLayout.Padding = UDim.new(0, 2)
	Mini.Name = "Mini"
	Mini.Parent = Bar
	Mini.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Mini.BackgroundTransparency = 1.000
	Mini.LayoutOrder = 2
	Mini.Position = UDim2.new(0.791666687, 0, 0, 0)
	Mini.Size = UDim2.new(0.277777791, 0, 0.892857134, 0)
	Mini.Image = "rbxassetid://4384401360"
	Mini.ScaleType = Enum.ScaleType.Fit
	Mode.Name = "Mode"
	Mode.Parent = Bar
	Mode.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Mode.BackgroundTransparency = 1.000
	Mode.LayoutOrder = 1
	Mode.Position = UDim2.new(0.791666687, 0, 0, 0)
	Mode.Size = UDim2.new(0.277777791, 0, 0.892857134, 0)
	Mode.Image = "rbxassetid://4483363084"
	Mode.ScaleType = Enum.ScaleType.Fit
	UICorner_4.Parent = Side
	Line_2.Name = "Line"
	Line_2.Parent = Side
	Line_2.BackgroundColor3 = Color3.fromRGB(113, 113, 113)
	Line_2.BackgroundTransparency = 0.750
	Line_2.BorderSizePixel = 0
	Line_2.Position = UDim2.new(1, 0, 0, 0)
	Line_2.Size = UDim2.new(0.0148148146, 0, 1, 0)
	Line_2.ZIndex = 6
	Fade.Name = "Fade"
	Fade.Parent = Side
	Fade.BackgroundColor3 = Color3.fromRGB(113, 113, 113)
	Fade.BackgroundTransparency = 0.750
	Fade.BorderSizePixel = 0
	Fade.Position = UDim2.new(1.00740743, 0, 0, 0)
	Fade.Size = UDim2.new(0.622222245, 0, 1, 0)
	Fade.ZIndex = 6
	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(45, 45, 45)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(45, 45, 45))}
	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient.Parent = Fade
	Title_2.Name = "Title"
	Title_2.Parent = Side
	Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title_2.BackgroundTransparency = 1.000
	Title_2.Position = UDim2.new(0.107000001, 0, 0.0350000001, 0)
	Title_2.Size = UDim2.new(0.762962937, 0, 0.0500000007, 0)
	Title_2.ZIndex = 6
	Title_2.Font = Enum.Font.GothamSemibold
	Title_2.Text = "Menu"
	Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title_2.TextScaled = true
	Title_2.TextSize = 14.000
	Title_2.TextWrapped = true
	Title_2.TextXAlignment = Enum.TextXAlignment.Left
	Title_2.TextYAlignment = Enum.TextYAlignment.Top
	UITextSizeConstraint_3.Parent = Title_2
	UITextSizeConstraint_3.MaxTextSize = 15
	Selections.Name = "Selections"
	Selections.Parent = Side
	Selections.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Selections.BackgroundTransparency = 1.000
	Selections.Position = UDim2.new(0.0927078798, 0, 0.12696971, 0)
	Selections.Size = UDim2.new(0.851851881, 0, 0.75999999, 0)
	Selections.ZIndex = 6
	UIListLayout_2.Parent = Selections
	UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_2.Padding = UDim.new(0, 4)
	Version.Name = "Version"
	Version.Parent = Side
	Version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Version.BackgroundTransparency = 1.000
	Version.Position = UDim2.new(0.0930000022, 0, 0.935000002, 0)
	Version.Size = UDim2.new(0.851851881, 0, 0.043333333, 0)
	Version.ZIndex = 3
	Version.Font = Enum.Font.Highway
	Version.Text = "Grubhub V1.0"
	Version.TextColor3 = Color3.fromRGB(180, 180, 180)
	Version.TextScaled = true
	Version.TextSize = 14.000
	Version.TextWrapped = true
	Version.TextXAlignment = Enum.TextXAlignment.Left
	Version.TextYAlignment = Enum.TextYAlignment.Top
	UITextSizeConstraint_4.Parent = Version
	UITextSizeConstraint_4.MaxTextSize = 13
	Close_2.Name = "Close"
	Close_2.Parent = Side
	Close_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Close_2.BackgroundTransparency = 1.000
	Close_2.LayoutOrder = 3
	Close_2.Position = UDim2.new(0.791666567, 0, 0.0301682074, 0)
	Close_2.Size = UDim2.new(0.153185338, 0, 0.0548318252, 0)
	Close_2.ZIndex = 6
	Close_2.Image = "rbxassetid://4370337241"
	Close_2.ScaleType = Enum.ScaleType.Fit
	UIAspectRatioConstraint.Parent = Main
	UIAspectRatioConstraint.AspectRatio = 1.707
	Pages.Name = "Pages"
	Pages.Parent = Main
	Pages.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Pages.BackgroundTransparency = 1.000
	Pages.ClipsDescendants = true
	Pages.Position = UDim2.new(0, 0, 0.180000007, 0)
	Pages.Size = UDim2.new(0.998046875, 0, 0.796666682, 0)
	Tab.Name = "Tab"
	Tab.Parent = Pages
	Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tab.BackgroundTransparency = 1.000
	Tab.BorderSizePixel = 0
	Tab.Selectable = false
	Tab.Size = UDim2.new(1, 0, 1, 0)
	Tab.CanvasSize = UDim2.new(0, 0, 3.5, 0)
	Tab.ScrollBarThickness = 2
	UIListLayout_3.Parent = Tab
	UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_3.Padding = UDim.new(0, 6)
	UICorner.Parent = Main
	--// Init Setting Strings
	Side.Version.Text = Settings.Name.." V"..Settings.UIVer
	TopBar.CreditTitle.Text = "By "..Settings.Name
	TopBar.Title.Text = Name

	Side.Position = UDim2.new(-.3, 0, 0, 0)

	--// Buttons
	TopBar.SideButton.MouseButton1Click:Connect(function()
		Library:ToggleSide()
	end)

	Side.Close.MouseButton1Click:Connect(function()
		Library:ToggleSide()
	end)

	TopBar.Bar.Close.MouseButton1Click:Connect(function()
		Library:Terminate()
	end)
	local curr = false
	TopBar.Bar.Mode.MouseButton1Click:Connect(function()
		curr = not curr
		if curr then Library:ChangeMode("Black")
		else Library:ChangeMode("White") end
	end)

	if not Side.Visible then
		Library:ToggleSide()
	end
end

function Library:NewTab(Name, Image)
	local Frame = Instance.new("Frame")
	local ImageLabel = Instance.new("ImageLabel")
	local TextLabel = Instance.new("TextLabel")
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
	local TextButton = Instance.new("TextButton")
	Frame.Parent = Side.Selections
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BackgroundTransparency = 1.000
	Frame.LayoutOrder = 999
	Frame.Size = UDim2.new(1, 0, 0.0877192989, 0)
	ImageLabel.Name = "Icon"
	ImageLabel.Parent = Frame
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BackgroundTransparency = 1.000
	ImageLabel.Size = UDim2.new(0.175000012, 0, 1, 0)
	ImageLabel.ScaleType = Enum.ScaleType.Fit
	TextLabel.Name = "Title"
	TextLabel.Parent = Frame
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(0.243478253, 0, 0, 0)
	TextLabel.Size = UDim2.new(0.756864607, 0, 1, 0)
	TextLabel.Font = Enum.Font.GothamSemibold
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14.000
	TextLabel.TextWrapped = true
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	UITextSizeConstraint.Parent = TextLabel
	UITextSizeConstraint.MaxTextSize = 14
	TextButton.Name = "Press"
	TextButton.Parent = Frame
	TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.BackgroundTransparency = 1.000
	TextButton.Size = UDim2.new(1, 0, 1, 0)
	TextButton.Font = Enum.Font.SourceSans
	TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextButton.TextSize = 14.000
	TextButton.TextTransparency = 1.000

	local Tab = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	Tab.Parent = Pages
	Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tab.BackgroundTransparency = 1.000
	Tab.BorderSizePixel = 0
	Tab.Selectable = false
	Tab.Size = UDim2.new(1, 0, 1, 0)
	Tab.Visible = false
	Tab.CanvasSize = UDim2.new(0, 0, 3.5, 0)
	Tab.ScrollBarThickness = 2
	UIListLayout.Parent = Tab
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 6)
	
    if Assets[Image] ~= nil then
        Image = tostring(Assets[Image])
    else
        Image = ""
    end

	local Funcs = {}

	ImageLabel.Image = Image --"rbxassetid://4483345737"

	Tab.Name = Name
	Frame.Name = Name
	TextLabel.Text = Name

	ImageLabel.ImageTransparency = 0.2
	TextLabel.TextTransparency = 0.2

	TextButton.MouseButton1Click:Connect(function()
		if not Settings.Cooldown then
			Settings.Cooldown = true
			for i,v in pairs(Side.Selections:GetChildren()) do
				if v:IsA("Frame") then
					v.Icon.ImageTransparency = 0.2
					v.Title.TextTransparency = 0.2
				end
			end
			for i,v in pairs(Pages:GetChildren()) do
				if v:IsA("ScrollingFrame") then
					if v.Visible then
						v:TweenPosition(UDim2.new(0,0,1,0), "Out", "Quad", .1)
					end
					wait(.1)
					v.Visible = false
				end
			end
			ImageLabel.ImageTransparency = 0
			TextLabel.TextTransparency = 0
			Pages:FindFirstChild(Name).Position = UDim2.new(0,0,-1,0)
			Pages:FindFirstChild(Name).Visible = true
			Pages:FindFirstChild(Name):TweenPosition(UDim2.new(0,0,0,0), "Out", "Quad", .1)
			Settings.Cooldown = false
		end
	end)

	function Funcs:Label1(Text)
		local Frame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Title = Instance.new("TextLabel")
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
		Frame.Name = "Label1"
		Frame.Parent = Tab
		Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		Frame.Position = UDim2.new(0.0237154141, 0, 0, 0)
		Frame.Size = UDim2.new(0.943, 0, 0.036, 0)
		UICorner.Parent = Frame
		Title.Name = "Title"
		Title.Parent = Frame
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.Position = UDim2.new(0.0169133227, 0, 0.240000084, 0)
		Title.Size = UDim2.new(0.983086705, 0, 0, 15)
		Title.Font = Enum.Font.GothamBlack
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextScaled = true
		Title.TextSize = 14.000
		Title.TextWrapped = true
		Title.TextXAlignment = Enum.TextXAlignment.Left
		UITextSizeConstraint.Parent = Title
		UITextSizeConstraint.MaxTextSize = 15
		Title.Text = Text
	end

	function Funcs:Label2(TT, DC)
		local Label2 = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Title = Instance.new("TextLabel")
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
		local Desc = Instance.new("TextLabel")
		local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
		Label2.Name = TT
		Label2.Parent = Tab
		Label2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		Label2.Position = UDim2.new(0.0284999534, 0, 0.15177834, 0)
		Label2.Size = UDim2.new(0.943000019, 0, 0.107322164, 0)
		UICorner.Parent = Label2
		Title.Name = "Title"
		Title.Parent = Label2
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.Position = UDim2.new(0.016913319, 0, 0.0799999982, 0)
		Title.Size = UDim2.new(0.950457871, 0, 0.178223342, 0)
		Title.Font = Enum.Font.GothamBlack
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextScaled = true
		Title.TextSize = 14.000
		Title.TextWrapped = true
		Title.TextXAlignment = Enum.TextXAlignment.Left
		UITextSizeConstraint.Parent = Title
		UITextSizeConstraint.MaxTextSize = 15
		Desc.Name = "Desc"
		Desc.Parent = Label2
		Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Desc.BackgroundTransparency = 1.000
		Desc.Position = UDim2.new(0.016913319, 0, 0.330000013, 0)
		Desc.Size = UDim2.new(0.950457871, 0, 0.623781741, 0)
		Desc.Font = Enum.Font.Gotham
		Desc.TextColor3 = Color3.fromRGB(255, 255, 255)
		Desc.TextScaled = true
		Desc.TextSize = 16.000
		Desc.TextWrapped = true
		Desc.TextXAlignment = Enum.TextXAlignment.Left
		Desc.TextYAlignment = Enum.TextYAlignment.Top
		UITextSizeConstraint_2.Parent = Desc
		UITextSizeConstraint_2.MaxTextSize = 16

		Desc.Text = DC
		Title.Text = TT
	end

	function Funcs:Button(Name, Callback)
		local Button = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Title = Instance.new("TextLabel")
		local Press = Instance.new("TextButton")
		local touch = Instance.new("ImageLabel")
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
		Button.Name = Name
		Button.Parent = Tab
		Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		Button.Position = UDim2.new(0.0284999534, 0, 0.745503843, 0)
		Button.Size = UDim2.new(0.943000019, 0, 0.0445606485, 0)
		UICorner.Parent = Button
		Title.Name = "Title"
		Title.Parent = Button
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.Position = UDim2.new(0.0169133227, 0, 0.240000084, 0)
		Title.Size = UDim2.new(0.875113845, 0, 0.402, 0)
		Title.Font = Enum.Font.GothamSemibold
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextScaled = true
		Title.TextSize = 14.000
		Title.TextWrapped = true
		Title.TextXAlignment = Enum.TextXAlignment.Left
		Press.Name = "Press"
		Press.Parent = Button
		Press.Active = false
		Press.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Press.BackgroundTransparency = 1.000
		Press.Selectable = false
		Press.Size = UDim2.new(1, 0, 1, 0)
		Press.Font = Enum.Font.GothamSemibold
		Press.TextColor3 = Color3.fromRGB(255, 255, 255)
		Press.TextScaled = true
		Press.TextSize = 14.000
		Press.TextTransparency = 1.000
		Press.TextWrapped = true
		Press.TextXAlignment = Enum.TextXAlignment.Left
		touch.Name = "touch"
		touch.Parent = Button
		touch.AnchorPoint = Vector2.new(0.5, 0.5)
		touch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		touch.BackgroundTransparency = 1.000
		touch.Position = UDim2.new(0.954999983, 0, 0.5, 0)
		touch.Size = UDim2.new(0.0549999997, 0, 0.730000019, 0)
		touch.Image = "rbxassetid://3926305904"
		touch.ImageRectOffset = Vector2.new(85, 204)
		touch.ImageRectSize = Vector2.new(36, 36)
		touch.ImageTransparency = 0.200
		touch.ScaleType = Enum.ScaleType.Fit
		UITextSizeConstraint.Parent = Title
		UITextSizeConstraint.MaxTextSize = 15

		Title.Text = Name

		Press.MouseButton1Click:Connect(function(...)
			Callback(...)
		end)
	end

	function Funcs:Slider(Name, limit, func)
		local Slider = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Title = Instance.new("TextLabel")
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
		local Slider1 = Instance.new("ImageButton")
		local Title_2 = Instance.new("TextLabel")
		local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
		local Bar = Instance.new("ImageLabel")
		Slider.Name = "Slider"
		Slider.Parent = Tab
		Slider.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		Slider.Position = UDim2.new(0.0283757336, 0, 1.58179915, 0)
		Slider.Size = UDim2.new(0.94324851, 0, 0.0369232073, 0)
		UICorner.Parent = Slider
		Title.Name = "Title"
		Title.Parent = Slider
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.Position = UDim2.new(0.0169133861, 0, 0.240000412, 0)
		Title.Size = UDim2.new(0.312873214, 0, 0.517354548, 0)
		Title.Font = Enum.Font.GothamSemibold
		Title.Text = Name
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextScaled = true
		Title.TextSize = 14.000
		Title.TextWrapped = true
		Title.TextXAlignment = Enum.TextXAlignment.Left
		UITextSizeConstraint.Parent = Title
		UITextSizeConstraint.MaxTextSize = 15
		Slider1.Name = "Slider1"
		Slider1.Parent = Slider
		Slider1.Active = false
		Slider1.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
		Slider1.BackgroundTransparency = 1.000
		Slider1.Position = UDim2.new(0.358921111, 0, 0.240000412, 0)
		Slider1.Selectable = false
		Slider1.Size = UDim2.new(0.623578846, 0, 0.416666001, 0)
		Slider1.ZIndex = 56
		Slider1.Image = "rbxassetid://3570695787"
		Slider1.ImageColor3 = Color3.fromRGB(66, 66, 66)
		Slider1.ImageTransparency = 0.200
		Slider1.ScaleType = Enum.ScaleType.Slice
		Slider1.SliceCenter = Rect.new(100, 100, 100, 100)
		Slider1.SliceScale = 0.050
		Title_2.Name = "Title"
		Title_2.Parent = Slider1
		Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title_2.BackgroundTransparency = 1.000
		Title_2.Position = UDim2.new(0.0360213369, 0, 0, 0)
		Title_2.Size = UDim2.new(0.919336855, 0, 1, 0)
		Title_2.ZIndex = 58
		Title_2.Font = Enum.Font.GothamBold
		Title_2.Text = "50"
		Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title_2.TextScaled = true
		Title_2.TextSize = 14.000
		Title_2.TextTransparency = 0.200
		Title_2.TextWrapped = true
		Title_2.TextXAlignment = Enum.TextXAlignment.Left
		UITextSizeConstraint_2.Parent = Title_2
		UITextSizeConstraint_2.MaxTextSize = 14
		Bar.Name = "Bar"
		Bar.Parent = Slider1
		Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Bar.BackgroundTransparency = 1.000
		Bar.Size = UDim2.new(0, 0, 1, 0)
		Bar.ZIndex = 57
		Bar.Image = "rbxassetid://3570695787"
		Bar.ImageColor3 = Color3.fromRGB(216, 48, 48)
		Bar.ScaleType = Enum.ScaleType.Slice
		Bar.SliceCenter = Rect.new(100, 100, 100, 100)
		Bar.SliceScale = 0.050
		local slider = Slider1
		local bar = slider:WaitForChild('Bar')
		local label = slider:WaitForChild('Title')
		local padding = {}
		local active

		local function updatePadding()
			padding = {
				['Start'] = slider.AbsolutePosition.X,
				['End'] = slider.AbsolutePosition.X + slider.AbsoluteSize.X
			}
		end
		updatePadding()

		workspace.CurrentCamera:GetPropertyChangedSignal('ViewportSize'):Connect(function()
			wait(.5)
			updatePadding()
		end)
		label.Text = limit[1]

		local function updateSlider()
			local posX = math.clamp(Mouse.X, padding.Start, padding.End)
			local inverse_interpolation = (posX - padding.Start) / (padding.End - padding.Start)
			TweenService:Create(bar, TweenInfo.new(.2), {Size = UDim2.new(inverse_interpolation, 0, 1, 0)}):Play()

			local value = math.floor(limit[1] + (limit[2] - limit[1]) * inverse_interpolation + .5)
			label.Text = value
			func(value)
		end

		slider.MouseButton1Down:Connect(function()
			updatePadding()
			active = true
			updateSlider()
		end)
		UserInputService.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				active = false
			end
		end)

		Mouse.Move:Connect(function()
			updatePadding()
			if active then
				updateSlider()
			end
		end)
	end

	function Funcs:TextBox(Name, callback)
		local TextBox = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Title = Instance.new("TextLabel")
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
		local Box = Instance.new("ImageButton")
		local Title_2 = Instance.new("TextBox")
		local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
		TextBox.Name = "TextBox"
		TextBox.Parent = Tab
		TextBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		TextBox.Position = UDim2.new(0.0283757336, 0, 1.09596765, 0)
		TextBox.Size = UDim2.new(0.94324851, 0, 0.0494757593, 0)
		UICorner.Parent = TextBox
		Title.Name = "Title"
		Title.Parent = TextBox
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.Position = UDim2.new(0.0169133861, 0, 0.240000412, 0)
		Title.Size = UDim2.new(0.312873214, 0, 0.386095941, 0)
		Title.Font = Enum.Font.GothamSemibold
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextScaled = true
		Title.TextSize = 14.000
		Title.TextWrapped = true
		Title.TextXAlignment = Enum.TextXAlignment.Left
		UITextSizeConstraint.Parent = Title
		UITextSizeConstraint.MaxTextSize = 15
		Box.Name = "Box"
		Box.Parent = TextBox
		Box.Active = false
		Box.AnchorPoint = Vector2.new(0.5, 0.5)
		Box.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
		Box.BackgroundTransparency = 1.000
		Box.Position = UDim2.new(0.666000009, 0, 0.5, 0)
		Box.Selectable = false
		Box.Size = UDim2.new(0.624000013, 0, 0.600000024, 0)
		Box.ZIndex = 56
		Box.Image = "rbxassetid://3570695787"
		Box.ImageColor3 = Color3.fromRGB(66, 66, 66)
		Box.ImageTransparency = 0.200
		Box.ScaleType = Enum.ScaleType.Slice
		Box.SliceCenter = Rect.new(100, 100, 100, 100)
		Box.SliceScale = 0.050
		Title_2.Name = "Title"
		Title_2.Parent = Box
		Title_2.Active = false
		Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title_2.BackgroundTransparency = 1.000
		Title_2.Position = UDim2.new(0.0360213369, 0, 0, 0)
		Title_2.Selectable = false
		Title_2.Size = UDim2.new(0.919336855, 0, 1, 0)
		Title_2.ZIndex = 58
		Title_2.Font = Enum.Font.GothamBold
		Title_2.Text = "Insert Text Here"
		Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title_2.TextScaled = true
		Title_2.TextSize = 14.000
		Title_2.TextTransparency = 0.200
		Title_2.TextWrapped = true
		Title_2.TextXAlignment = Enum.TextXAlignment.Left
		UITextSizeConstraint_2.Parent = Title_2
		UITextSizeConstraint_2.MaxTextSize = 14

		Title.Text = Name

		Title_2.FocusLost:Connect(function()
			callback(Title_2.Text)
		end)
	end

	function Funcs:Toggle(Name, Default, Callback)
		local Toggle = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Title = Instance.new("TextLabel")
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
		local Press = Instance.new("TextButton")
		local state = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local Icon = Instance.new("ImageLabel")
		Toggle.Name = Name
		Toggle.Parent = Tab
		Toggle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		Toggle.Position = UDim2.new(0.0283757336, 0, 0.277501076, 0)
		Toggle.Size = UDim2.new(0.94324851, 0, 0.0392739475, 0)
		UICorner.Parent = Toggle
		Title.Name = "Title"
		Title.Parent = Toggle
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.Position = UDim2.new(0.0169133227, 0, 0.240000084, 0)
		Title.Size = UDim2.new(0.875113845, 0, 0.486388326, 0)
		Title.Font = Enum.Font.GothamSemibold
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextScaled = true
		Title.TextSize = 14.000
		Title.TextWrapped = true
		Title.TextXAlignment = Enum.TextXAlignment.Left
		UITextSizeConstraint.Parent = Title
		UITextSizeConstraint.MaxTextSize = 15
		Press.Name = "Press"
		Press.Parent = Toggle
		Press.Active = false
		Press.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Press.BackgroundTransparency = 1.000
		Press.Selectable = false
		Press.Size = UDim2.new(1, 0, 1, 0)
		Press.Font = Enum.Font.GothamSemibold
		Press.TextColor3 = Color3.fromRGB(255, 255, 255)
		Press.TextScaled = true
		Press.TextSize = 14.000
		Press.TextTransparency = 1.000
		Press.TextWrapped = true
		Press.TextXAlignment = Enum.TextXAlignment.Left
		state.Name = "state"
		state.Parent = Toggle
		state.AnchorPoint = Vector2.new(0.5, 0.5)
		state.BackgroundColor3 = Color3.fromRGB(216, 48, 48)
		state.Position = UDim2.new(0.954999983, 0, 0.5, 0)
		state.Size = UDim2.new(0.0549999997, 0, 0.730000019, 0)
		UICorner_2.Parent = state
		Icon.Name = "Icon"
		Icon.Parent = state
		Icon.AnchorPoint = Vector2.new(0.5, 0.5)
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
		Icon.Size = UDim2.new(1, 0, 1, 0)
		Icon.ImageTransparency = 0.200
		Icon.ScaleType = Enum.ScaleType.Fit

		Title.Text = Name
		Icon.Image = "rbxassetid://3944676352"
		local Bool = Default or false

		if Bool then
			Icon.Image = "rbxassetid://3944680095"
			state.BackgroundColor3 = Color3.fromRGB(44, 216, 44)
		elseif not Bool then
			Icon.Image = "rbxassetid://3944676352"
			state.BackgroundColor3 = Color3.fromRGB(216, 48, 48)
		end

		Press.MouseButton1Click:Connect(function()
			Bool = not Bool
			if Bool then
				Icon.Image = "rbxassetid://3944680095"
				state.BackgroundColor3 = Color3.fromRGB(44, 216, 44)
			elseif not Bool then
				Icon.Image = "rbxassetid://3944676352"
				state.BackgroundColor3 = Color3.fromRGB(216, 48, 48)
			end
			Callback(Bool)
		end)
	end
	function Funcs:Dropdown(Name, Drops, Callback)
		local Dropdown = Instance.new("Frame")
		local UICorner2 = Instance.new("UICorner")
		local Title = Instance.new("TextLabel")
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
		local Press = Instance.new("TextButton")
		local touch = Instance.new("ImageLabel")
		local ScrollingFrame = Instance.new("ScrollingFrame")
		Dropdown.Parent = Tab
		Dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		Dropdown.Position = UDim2.new(0.0284999534, 0, 0.745503843, 0)
		Dropdown.Size = UDim2.new(0.943000019, 0, 0.0445606485, 0)
		UICorner2.Parent = Dropdown
		Title.Name = "Title"
		Title.Parent = Dropdown
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.Position = UDim2.new(0.0169133227, 0, 0.240000084, 0)
		Title.Size = UDim2.new(0.875113785, 0, 0.40241468, 0)
		Title.Font = Enum.Font.GothamSemibold
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextScaled = true
		Title.TextSize = 14.000
		Title.TextWrapped = true
		Title.TextXAlignment = Enum.TextXAlignment.Left
		UITextSizeConstraint.Parent = Title
		UITextSizeConstraint.MaxTextSize = 15
		Press.Name = "Press"
		Press.Parent = Dropdown
		Press.Active = false
		Press.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Press.BackgroundTransparency = 1.000
		Press.Selectable = false
		Press.Size = UDim2.new(1, 0, 1, 0)
		Press.Font = Enum.Font.GothamSemibold
		Press.TextColor3 = Color3.fromRGB(255, 255, 255)
		Press.TextScaled = true
		Press.TextSize = 14.000
		Press.TextTransparency = 1.000
		Press.TextWrapped = true
		Press.TextXAlignment = Enum.TextXAlignment.Left
		touch.Name = "touch"
		touch.Parent = Dropdown
		touch.AnchorPoint = Vector2.new(0.5, 0.5)
		touch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		touch.BackgroundTransparency = 1.000
		touch.Position = UDim2.new(0.954999983, 0, 0.5, 0)
		touch.Size = UDim2.new(0.0549999997, 0, 0.730000019, 0)
		touch.Image = "rbxassetid://4384401360"
		touch.ImageTransparency = 0.200
		touch.ScaleType = Enum.ScaleType.Fit

		Title.Text = Name
		Dropdown.Name = Name

		local Holder = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		
		UIListLayout.Parent = Holder
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 6)
		Holder.Name = "Holder"
		Holder.Parent = Dropdown
		Holder.Active = true
		Holder.Visible = false
		Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Holder.BackgroundTransparency = 1.000
		Holder.BorderSizePixel = 0
		Holder.CanvasSize = UDim2.new(0,0,5,0)
		Holder.Position = UDim2.new(0.0261156242, 0, 0.342671841, 0)
		Holder.Size = UDim2.new(0.953, 0, 0.568, 0)
		Holder.ScrollBarThickness = 4

		local Dropped = false
		Press.MouseButton1Down:Connect(function()
			if not Dropped then
				Dropdown:TweenSize(UDim2.new(0.943, 0, .15, 0), "Out", "Quad", .25)
				Press.Size = UDim2.new(1, 0, .315, 0)
				touch.Size = UDim2.new(.055, 0, .212, 0)
				touch.Position = UDim2.new(.953, 0, .15, 0)
				Title.Size = UDim2.new(.875, 0, .15, 0)
				Title.Position = UDim2.new(.028, 0, .081, 0)
				Holder.Visible = true
			else
				Dropdown:TweenSize(UDim2.new(.943, 0, .0445, 0), "Out", "Quad", .25)
				Press.Size = UDim2.new(1, 0, 1, 0)
				touch.Size = UDim2.new(.054, 0, .73, 0)
				touch.Position = UDim2.new(.954, 0, .5, 0)
				Title.Size = UDim2.new(0.875, 0, 0.402, 0)
				Title.Position = UDim2.new(0.016, 0, 0.24, 0)
				Holder.Visible = false
			end
			wait(.25)
			Dropped = not Dropped
		end)

		for i,v in pairs(Drops) do
			local Dropdown = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local Title = Instance.new("TextLabel")
			local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
			local Press1 = Instance.new("TextButton")
			Dropdown.Parent = Holder
			Dropdown.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
			Dropdown.Position = UDim2.new(-0.0325674824, 0, 0, 0)
			Dropdown.Size = UDim2.new(0.949999988, 0, 0.05, 0)
			UICorner.Parent = Dropdown
			Title.Name = "Title"
			Title.Parent = Dropdown
			Title.AnchorPoint = Vector2.new(0, 0.5)
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0.0299999993, 0, 0.5, 0)
			Title.Size = UDim2.new(0.970000029, 0, 0.600000024, 0)
			Title.Font = Enum.Font.GothamSemibold
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextScaled = true
			Title.TextSize = 14.000
			Title.TextWrapped = true
			Title.TextXAlignment = Enum.TextXAlignment.Left
			UITextSizeConstraint.Parent = Title
			UITextSizeConstraint.MaxTextSize = 15
			Press1.Name = "Press"
			Press1.Parent = Dropdown
			Press1.Active = false
			Press1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Press1.BackgroundTransparency = 1.000
			Press1.Selectable = false
			Press1.Size = UDim2.new(1, 0, 1, 0)
			Press1.Font = Enum.Font.GothamSemibold
			Press1.TextColor3 = Color3.fromRGB(255, 255, 255)
			Press1.TextScaled = true
			Press1.TextSize = 14.000
			Press1.TextTransparency = 1.000
			Press1.TextWrapped = true
			Press1.TextXAlignment = Enum.TextXAlignment.Left

			Title.Text = v
			Dropdown.Name = v

			Press1.MouseButton1Down:Connect(function()
				Callback(v)
			end)
		end
	end
    function Funcs:ColorPicker(Name, callback) 
		local Picker = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Title = Instance.new("TextLabel")
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
		local Press = Instance.new("TextButton")
		local ColourDisplay = Instance.new("ImageLabel")
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		Picker.Parent = Tab
		Picker.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		Picker.Position = UDim2.new(0.0284999534, 0, 0.745503843, 0)
		Picker.Size = UDim2.new(0.943000019, 0, 0.0445606485, 0)
		UICorner.Parent = Picker
		Title.Name = "Title"
		Title.Parent = Picker
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.Position = UDim2.new(0.0169133227, 0, 0.240000084, 0)
		Title.Size = UDim2.new(0.875113785, 0, 0.40241468, 0)
		Title.Font = Enum.Font.GothamSemibold
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextScaled = true
		Title.TextSize = 14.000
		Title.TextWrapped = true
		Title.TextXAlignment = Enum.TextXAlignment.Left
		UITextSizeConstraint.Parent = Title
		UITextSizeConstraint.MaxTextSize = 15
		Press.Name = "Press"
		Press.Parent = Picker
		Press.Active = false
		Press.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Press.BackgroundTransparency = 1.000
		Press.Selectable = false
		Press.Size = UDim2.new(0.679040372, 0, 1, 0)
		Press.Font = Enum.Font.GothamSemibold
		Press.TextColor3 = Color3.fromRGB(255, 255, 255)
		Press.TextScaled = true
		Press.TextSize = 14.000
		Press.TextTransparency = 1.000
		Press.TextWrapped = true
		Press.TextXAlignment = Enum.TextXAlignment.Left
		ColourDisplay.Name = "ColourDisplay"
		ColourDisplay.Parent = Picker
		ColourDisplay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ColourDisplay.BackgroundTransparency = 1.000
		ColourDisplay.BorderSizePixel = 0
		ColourDisplay.Position = UDim2.new(0.934939981, 0, 0.125418425, 0)
		ColourDisplay.Size = UDim2.new(0.0549999997, 0, 0.730000019, 0)
		ColourDisplay.ZIndex = 2
		ColourDisplay.Image = "rbxassetid://3570695787"
		ColourDisplay.ScaleType = Enum.ScaleType.Slice
		ColourDisplay.SliceCenter = Rect.new(100, 100, 100, 100)
		ColourDisplay.SliceScale = 0.050
		UIAspectRatioConstraint.Parent = ColourDisplay

        local Selector = Instance.new("Frame")
        local DarknessPicker = Instance.new("ImageButton")
        local UIGradient = Instance.new("UIGradient")
        local Slider = Instance.new( "ImageLabel")
        local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
        local ColourWheel = Instance.new("ImageButton")
        local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
        local Picker = Instance.new("ImageLabel")
        local UICorner = Instance.new("UICorner")
        Selector.Parent = ColorPickers
        Selector.Active = true
        Selector.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        Selector.Size = UDim2.new(1, 0, 1, 0)
        Selector.Visible = false
        Selector.ZIndex = 15
        DarknessPicker.Name = "DarknessPicker"
        DarknessPicker.Parent = Selector
        DarknessPicker.Active = false
        DarknessPicker.AnchorPoint = Vector2.new(0.5, 0.5)
        DarknessPicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        DarknessPicker.BackgroundTransparency = 1.000
        DarknessPicker.BorderSizePixel = 0
        DarknessPicker.Position = UDim2.new(0.83246398, 0, 0.476588726, 0)
        DarknessPicker.Selectable = false
        DarknessPicker.Size = UDim2.new(0.200781047, 0, 0.897739112, 0)
        DarknessPicker.ZIndex = 16
        DarknessPicker.Image = "rbxassetid://3570695787"
        DarknessPicker.ScaleType = Enum.ScaleType.Slice
        DarknessPicker.SliceCenter = Rect.new(100, 100, 100, 100)
        DarknessPicker.SliceScale = 0.120
        UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
        UIGradient.Rotation = 90
        UIGradient.Parent = DarknessPicker
        Slider.Name = "Slider"
        Slider.Parent = DarknessPicker
        Slider.AnchorPoint = Vector2.new(0.5, 0.5)
        Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Slider.BackgroundTransparency = 1.000
        Slider.BorderSizePixel = 0
        Slider.Position = UDim2.new(0.491197795, 0, 0.0733607039, 0)
        Slider.Size = UDim2.new(1.28656352, 0, 0.0265010502, 0)
        Slider.ZIndex = 17
        Slider.Image = "rbxassetid://3570695787"
        Slider.ImageColor3 = Color3.fromRGB(255, 74, 74)
        Slider.ScaleType = Enum.ScaleType.Slice
        Slider.SliceCenter = Rect.new(100, 100, 100, 100)
        Slider.SliceScale = 0.120
        UIAspectRatioConstraint.Parent = DarknessPicker
        UIAspectRatioConstraint.AspectRatio = 0.157
        ColourWheel.Name = "ColourWheel"
        ColourWheel.Parent = Selector
        ColourWheel.Active = false
        ColourWheel.AnchorPoint = Vector2.new(0.5, 0.5)
        ColourWheel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ColourWheel.BackgroundTransparency = 1.000
        ColourWheel.BorderSizePixel = 0
        ColourWheel.Position = UDim2.new(0.387709975, 0, 0.477724642, 0)
        ColourWheel.Selectable = false
        ColourWheel.Size = UDim2.new(0.648710012, 0, 0.844554842, 0)
        ColourWheel.ZIndex = 16
        ColourWheel.Image = "http://www.roblox.com/asset/?id=6020299385"
        UIAspectRatioConstraint_2.Parent = ColourWheel
        UIAspectRatioConstraint_2.AspectRatio = 1.000
        Picker.Name = "Picker"
        Picker.Parent = ColourWheel
        Picker.AnchorPoint = Vector2.new(0.5, 0.5)
        Picker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Picker.BackgroundTransparency = 1.000
        Picker.BorderSizePixel = 0
        Picker.Position = UDim2.new(0.5, 0, 0.5, 0)
        Picker.Size = UDim2.new(0.0900257826, 0, 0.0900257975, 0)
        Picker.ZIndex = 17
        Picker.Image = "http://www.roblox.com/asset/?id=3678860011"
        UICorner.Parent = Selector

        Selector.Name = Name
		Picker.Name = Name
		Title.Text = Name

        local buttonDown = false
        local movingSlider = false

        local Visible = false
        Press.MouseButton1Click:Connect(function()
            for i,v in pairs(ColorPickers:GetChildren()) do
                if v.Visible then v.Visible = false end
            end
            Visible = not Visible
            if not Visible then
                Selector.Visible = true
            else
                Selector.Visible = false
            end
        end)


        local function updateColour(centreOfWheel)
            local colourPickerCentre = Vector2.new(Picker.AbsolutePosition.X + (Picker.AbsoluteSize.X/2), Picker.AbsolutePosition.Y + (Picker.AbsoluteSize.Y/2))
            local h = (math.pi - math.atan2(colourPickerCentre.Y - centreOfWheel.Y, colourPickerCentre.X - centreOfWheel.X)) / (math.pi * 2)
            local s = (centreOfWheel - colourPickerCentre).Magnitude / (ColourWheel.AbsoluteSize.X/2)
            local v = math.abs((DarknessPicker.Slider.AbsolutePosition.Y - DarknessPicker.Slider.AbsolutePosition.Y) / DarknessPicker.Slider.AbsoluteSize.Y - 1)
            
            
            local hsv = Color3.fromHSV(math.clamp(h, 0, 1), math.clamp(s, 0, 1), math.clamp(v, 0, 1))
            
            
            ColourDisplay.ImageColor3 = hsv
            callback(hsv)
            DarknessPicker.UIGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, hsv), 
                ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
            }
        end
        ColourWheel.MouseButton1Down:Connect(function()
            buttonDown = true
        end)
        
        DarknessPicker.MouseButton1Down:Connect(function()
            movingSlider = true
        end)
        
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
            buttonDown = false
            movingSlider = false
        end)
        
        
        UserInputService.InputChanged:Connect(function(input)
            if input.UserInputType ~= Enum.UserInputType.MouseMovement then return end
            local mousePos = UserInputService:GetMouseLocation() - Vector2.new(0, game:GetService("GuiService"):GetGuiInset().Y)
            local centreOfWheel = Vector2.new(ColourWheel.AbsolutePosition.X + (ColourWheel.AbsoluteSize.X/2), ColourWheel.AbsolutePosition.Y + (ColourWheel.AbsoluteSize.Y/2))
            local distanceFromWheel = (mousePos - centreOfWheel).Magnitude
            
            if distanceFromWheel <= ColourWheel.AbsoluteSize.X/2 and buttonDown then
                Picker.Position = UDim2.new(0, mousePos.X - ColourWheel.AbsolutePosition.X, 0, mousePos.Y - ColourWheel.AbsolutePosition.Y)
            elseif movingSlider then
                DarknessPicker.Slider.Position = UDim2.new(DarknessPicker.Slider.Position.X.Scale, 0, 0, 
                    math.clamp(mousePos.Y - DarknessPicker.AbsolutePosition.Y, 0, DarknessPicker.AbsoluteSize.Y)
                )	
            end
            updateColour(centreOfWheel)
        end)
	end
	return Funcs
end

return Library
