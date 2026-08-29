-- Crew War Essentials Script Hub
-- Made by japneas
-- Xeno Executor Compatible

local success, err = pcall(function()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local playerGui = player:FindFirstChild("PlayerGui")
    
    if not playerGui then
        playerGui = player:WaitForChild("PlayerGui", 10)
    end
    
    if not playerGui then
        error("Could not find PlayerGui")
    end
    
    -- Create ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "CrewWarEssentialsGui"
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.Parent = playerGui
    
    -- Create fullscreen background
    local backgroundFrame = Instance.new("Frame")
    backgroundFrame.Name = "BackgroundFrame"
    backgroundFrame.Size = UDim2.new(1, 0, 1, 0)
    backgroundFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    backgroundFrame.BackgroundTransparency = 0.3
    backgroundFrame.BorderSizePixel = 0
    backgroundFrame.Parent = screenGui
    
    -- Create main container frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 500, 0, 350)
    mainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    
    -- UICorner for rounded edges
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 15)
    uiCorner.Parent = mainFrame
    
    -- UIStroke for border
    local uiStroke = Instance.new("UIStroke")
    uiStroke.Color = Color3.fromRGB(0, 0, 0)
    uiStroke.Thickness = 2
    uiStroke.Parent = mainFrame
    
    -- Image container
    local imageContainer = Instance.new("Frame")
    imageContainer.Name = "ImageContainer"
    imageContainer.Size = UDim2.new(1, 0, 0, 180)
    imageContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    imageContainer.BorderSizePixel = 0
    imageContainer.Parent = mainFrame
    
    local imageCorner = Instance.new("UICorner")
    imageCorner.CornerRadius = UDim.new(0, 15)
    imageCorner.Parent = imageContainer
    
    -- Image label
    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Name = "UploadedImage"
    imageLabel.Size = UDim2.new(1, -20, 1, -10)
    imageLabel.Position = UDim2.new(0, 10, 0, 5)
    imageLabel.BackgroundTransparency = 1
    imageLabel.ImageScaleType = Enum.ScaleType.Fit
    imageLabel.Image = "rbxassetid://0"
    imageLabel.Parent = imageContainer
    
    -- Title text
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
    titleLabel.Parent = mainFrame
    
    -- Loading bar background
    local loadingBarBg = Instance.new("Frame")
    loadingBarBg.Name = "LoadingBarBackground"
    loadingBarBg.Size = UDim2.new(0, 350, 0, 8)
    loadingBarBg.Position = UDim2.new(0.5, -175, 0, 220)
    loadingBarBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    loadingBarBg.BorderSizePixel = 0
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
    loadingBar.Parent = loadingBarBg
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 4)
    fillCorner.Parent = loadingBar
    
    -- Credit text
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
    creditLabel.Parent = mainFrame
    
    -- Animate loading bar
    local duration = 3
    local startTime = tick()
    
    while tick() - startTime < duration do
        local elapsed = tick() - startTime
        local progress = math.min(elapsed / duration, 1)
        loadingBar.Size = UDim2.new(progress, 0, 1, 0)
        wait(0.01)
    end
    
    loadingBar.Size = UDim2.new(1, 0, 1, 0)
    
    -- Close on Delete key
    local UserInputService = game:GetService("UserInputService")
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == Enum.KeyCode.Delete then
            screenGui:Destroy()
        end
    end)
end)

if not success then
    print("[ERROR] Crew War Essentials failed: " .. tostring(err))
else
    print("[SUCCESS] Crew War Essentials loaded!")
end
