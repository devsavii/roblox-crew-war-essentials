-- Crew War Essentials Script Hub
-- Made by japneas

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CrewWarEssentialsGui"
screenGui.ResetOnSpawn = false
screenGui.ZIndex = 100
screenGui.Parent = playerGui

-- Create main container frame (centered)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
mainFrame.ZIndex = 101
mainFrame.Parent = screenGui

-- Add rounded corners effect with UICorner
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 15)
uiCorner.Parent = mainFrame

-- Add shadow effect with UIStroke
local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(0, 0, 0)
uiStroke.Thickness = 2
uiStroke.Parent = mainFrame

-- Image container (top section)
local imageContainer = Instance.new("Frame")
imageContainer.Name = "ImageContainer"
imageContainer.Size = UDim2.new(1, 0, 0, 150)
imageContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
imageContainer.BorderSizePixel = 0
imageContainer.ZIndex = 102
imageContainer.Parent = mainFrame

local imageCorner = Instance.new("UICorner")
imageCorner.CornerRadius = UDim.new(0, 15)
imageCorner.Parent = imageContainer

-- Display uploaded image
local imageLabel = Instance.new("ImageLabel")
imageLabel.Name = "UploadedImage"
imageLabel.Size = UDim2.new(1, -20, 1, -10)
imageLabel.Position = UDim2.new(0, 10, 0, 5)
imageLabel.BackgroundTransparency = 1
imageLabel.ImageScaleType = Enum.ScaleType.Fit
imageLabel.ZIndex = 103
-- NOTE: Replace this with your actual image ID
imageLabel.Image = "rbxassetid://0" -- Placeholder - update with your uploaded image ID
imageLabel.Parent = imageContainer

-- Title text (centered in middle)
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, -20, 0, 80)
titleLabel.Position = UDim2.new(0, 10, 0.35, -40)
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 40
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Text = "crew war essentials"
titleLabel.TextScaled = true
titleLabel.ZIndex = 102
titleLabel.Parent = mainFrame

-- Loading bar background
local loadingBarBg = Instance.new("Frame")
loadingBarBg.Name = "LoadingBarBackground"
loadingBarBg.Size = UDim2.new(0, 300, 0, 6)
loadingBarBg.Position = UDim2.new(0.5, -150, 0, 200)
loadingBarBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
loadingBarBg.BorderSizePixel = 0
loadingBarBg.ZIndex = 102
loadingBarBg.Parent = mainFrame

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(0, 3)
barCorner.Parent = loadingBarBg

-- Loading bar fill
local loadingBar = Instance.new("Frame")
loadingBar.Name = "LoadingBarFill"
loadingBar.Size = UDim2.new(0, 0, 1, 0)
loadingBar.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
loadingBar.BorderSizePixel = 0
loadingBar.ZIndex = 103
loadingBar.Parent = loadingBarBg

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(0, 3)
fillCorner.Parent = loadingBar

-- Credit text (bottom right)
local creditLabel = Instance.new("TextLabel")
creditLabel.Name = "CreditLabel"
creditLabel.Size = UDim2.new(0, 200, 0, 20)
creditLabel.Position = UDim2.new(1, -210, 1, -30)
creditLabel.BackgroundTransparency = 1
creditLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
creditLabel.TextSize = 12
creditLabel.Font = Enum.Font.GothamBold
creditLabel.Text = "made by japneas"
creditLabel.TextXAlignment = Enum.TextXAlignment.Right
creditLabel.ZIndex = 102
creditLabel.Parent = mainFrame

-- Smooth loading bar animation
local function animateLoadingBar()
    local duration = 3 -- 3 seconds to load
    local startTime = tick()
    
    while tick() - startTime < duration do
        local elapsed = tick() - startTime
        local progress = elapsed / duration
        
        loadingBar:TweenSize(
            UDim2.new(progress, 0, 1, 0),
            Enum.EasingDirection.InOut,
            Enum.EasingStyle.Quad,
            0.1,
            true
        )
        
        wait(0.01)
    end
    
    -- Complete the loading bar
    loadingBar:TweenSize(
        UDim2.new(1, 0, 1, 0),
        Enum.EasingDirection.InOut,
        Enum.EasingStyle.Quad,
        0.2,
        true
    )
end

-- Start loading animation
animateLoadingBar()

-- Optional: Add fade out after loading completes
wait(3.5)
mainFrame:TweenSize(
    UDim2.new(0, 400, 0, 300),
    Enum.EasingDirection.InOut,
    Enum.EasingStyle.Quad,
    0.5,
    true
)

-- Keep GUI visible - remove this section if you want it to disappear after loading
-- For now, it will stay visible with the loading bar at 100%
