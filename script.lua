-- Crew War Essentials Script Hub
-- Made by japneas
-- Compatible with Xeno Executor

-- Wait for game to load
while not game:IsLoaded() do
    game.Loaded:Wait()
end

wait(1)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Get local player
local player = Players.LocalPlayer
while not player do
    wait(0.1)
    player = Players.LocalPlayer
end

-- Get PlayerGui
local playerGui = player:WaitForChild("PlayerGui")

print("[Crew War Essentials] Script loaded successfully!")

-- Create ScreenGui with fullscreen settings
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CrewWarEssentialsGui"
screenGui.ResetOnSpawn = false
screenGui.ZIndex = 100
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

print("[Crew War Essentials] ScreenGui created")

-- Create fullscreen background
local backgroundFrame = Instance.new("Frame")
backgroundFrame.Name = "BackgroundFrame"
backgroundFrame.Size = UDim2.new(1, 0, 1, 0)
backgroundFrame.Position = UDim2.new(0, 0, 0, 0)
backgroundFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
backgroundFrame.BackgroundTransparency = 0.3
backgroundFrame.BorderSizePixel = 0
backgroundFrame.ZIndex = 100
backgroundFrame.Parent = screenGui

-- Create main container frame (centered on fullscreen)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 500, 0, 350)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
mainFrame.ZIndex = 101
mainFrame.Parent = screenGui

print("[Crew War Essentials] Main frame created")

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
imageContainer.Size = UDim2.new(1, 0, 0, 180)
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
titleLabel.Position = UDim2.new(0, 10, 0.4, -40)
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 50
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Text = "crew war essentials"
titleLabel.TextScaled = true
titleLabel.ZIndex = 102
titleLabel.Parent = mainFrame

print("[Crew War Essentials] Title label created")

-- Loading bar background
local loadingBarBg = Instance.new("Frame")
loadingBarBg.Name = "LoadingBarBackground"
loadingBarBg.Size = UDim2.new(0, 350, 0, 8)
loadingBarBg.Position = UDim2.new(0.5, -175, 0, 220)
loadingBarBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
loadingBarBg.BorderSizePixel = 0
loadingBarBg.ZIndex = 102
loadingBarBg.Parent = mainFrame

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(0, 4)
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
fillCorner.CornerRadius = UDim.new(0, 4)
fillCorner.Parent = loadingBar

-- Credit text (bottom right)
local creditLabel = Instance.new("TextLabel")
creditLabel.Name = "CreditLabel"
creditLabel.Size = UDim2.new(0, 250, 0, 25)
creditLabel.Position = UDim2.new(1, -260, 1, -35)
creditLabel.BackgroundTransparency = 1
creditLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
creditLabel.TextSize = 14
creditLabel.Font = Enum.Font.GothamBold
creditLabel.Text = "made by japneas"
creditLabel.TextXAlignment = Enum.TextXAlignment.Right
creditLabel.ZIndex = 102
creditLabel.Parent = mainFrame

print("[Crew War Essentials] Loading bar created")

-- Smooth loading bar animation
local function animateLoadingBar()
    local duration = 3 -- 3 seconds to load
    local startTime = tick()
    
    while tick() - startTime < duration do
        local elapsed = tick() - startTime
        local progress = math.min(elapsed / duration, 1)
        
        loadingBar.Size = UDim2.new(progress, 0, 1, 0)
        
        wait(0.01)
    end
    
    -- Complete the loading bar
    loadingBar.Size = UDim2.new(1, 0, 1, 0)
    print("[Crew War Essentials] Loading complete!")
end

-- Start loading animation
print("[Crew War Essentials] Starting loading animation...")
animateLoadingBar()

-- Keep GUI visible
wait(1)

print("[Crew War Essentials] GUI is now fully displayed!")
print("[Crew War Essentials] Press Delete key to close the GUI")

-- Close button functionality - Press Delete to close
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.Delete then
        print("[Crew War Essentials] Closing GUI...")
        screenGui:Destroy()
    end
end)
