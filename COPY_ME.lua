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
    
    -- Create main ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "CrewWarEssentialsGui"
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.Parent = playerGui
    
    -- ========== FULLSCREEN LOADING SCREEN ==========
    local loadingScreen = Instance.new("Frame")
    loadingScreen.Name = "LoadingScreen"
    loadingScreen.Size = UDim2.new(1, 0, 1, 0)
    loadingScreen.Position = UDim2.new(0, 0, 0, 0)
    loadingScreen.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    loadingScreen.BackgroundTransparency = 0
    loadingScreen.BorderSizePixel = 0
    loadingScreen.ZIndex = 100
    loadingScreen.Parent = screenGui
    
    -- Title on loading screen
    local loadingTitle = Instance.new("TextLabel")
    loadingTitle.Name = "LoadingTitle"
    loadingTitle.Size = UDim2.new(0.8, 0, 0, 60)
    loadingTitle.Position = UDim2.new(0.1, 0, 0.45, -30)
    loadingTitle.BackgroundTransparency = 1
    loadingTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    loadingTitle.TextSize = 48
    loadingTitle.Font = Enum.Font.GothamBold
    loadingTitle.Text = "Crew War Essentials"
    loadingTitle.TextScaled = true
    loadingTitle.ZIndex = 101
    loadingTitle.Parent = loadingScreen
    
    -- Loading bar background
    local loadingBarBg = Instance.new("Frame")
    loadingBarBg.Name = "LoadingBarBackground"
    loadingBarBg.Size = UDim2.new(0, 400, 0, 3)
    loadingBarBg.Position = UDim2.new(0.5, -200, 0.5, 20)
    loadingBarBg.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    loadingBarBg.BorderSizePixel = 0
    loadingBarBg.ZIndex = 101
    loadingBarBg.Parent = loadingScreen
    
    -- Loading bar fill
    local loadingBar = Instance.new("Frame")
    loadingBar.Name = "LoadingBarFill"
    loadingBar.Size = UDim2.new(0, 0, 1, 0)
    loadingBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    loadingBar.BorderSizePixel = 0
    loadingBar.ZIndex = 102
    loadingBar.Parent = loadingBarBg
    
    -- Credit text on loading screen
    local loadingCredit = Instance.new("TextLabel")
    loadingCredit.Name = "LoadingCredit"
    loadingCredit.Size = UDim2.new(0, 300, 0, 20)
    loadingCredit.Position = UDim2.new(1, -310, 1, -30)
    loadingCredit.BackgroundTransparency = 1
    loadingCredit.TextColor3 = Color3.fromRGB(180, 180, 180)
    loadingCredit.TextSize = 14
    loadingCredit.Font = Enum.Font.GothamBold
    loadingCredit.Text = "coded/made by japneas"
    loadingCredit.TextXAlignment = Enum.TextXAlignment.Right
    loadingCredit.ZIndex = 101
    loadingCredit.Parent = loadingScreen
    
    -- Animate loading bar
    local duration = 4
    local startTime = tick()
    
    while tick() - startTime < duration do
        local elapsed = tick() - startTime
        local progress = math.min(elapsed / duration, 1)
        loadingBar.Size = UDim2.new(progress, 0, 1, 0)
        wait(0.01)
    end
    
    loadingBar.Size = UDim2.new(1, 0, 1, 0)
    
    -- Wait a moment before transitioning
    wait(0.5)
    
    -- Fade out loading screen
    for i = 1, 20 do
        loadingScreen.BackgroundTransparency = i / 20
        loadingTitle.TextTransparency = i / 20
        loadingCredit.TextTransparency = i / 20
        loadingBarBg.BackgroundTransparency = i / 20
        loadingBar.BackgroundTransparency = i / 20
        wait(0.02)
    end
    
    loadingScreen:Destroy()
    
    -- ========== MAIN HUB SCREEN ==========
    
    -- Create fullscreen semi-transparent background
    local backgroundFrame = Instance.new("Frame")
    backgroundFrame.Name = "BackgroundFrame"
    backgroundFrame.Size = UDim2.new(1, 0, 1, 0)
    backgroundFrame.Position = UDim2.new(0, 0, 0, 0)
    backgroundFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    backgroundFrame.BackgroundTransparency = 0.4
    backgroundFrame.BorderSizePixel = 0
    backgroundFrame.ZIndex = 100
    backgroundFrame.Parent = screenGui
    
    -- Create main container frame (smaller, centered)
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 600, 0, 400)
    mainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
    mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    mainFrame.BorderSizePixel = 0
    mainFrame.ZIndex = 101
    mainFrame.Parent = screenGui
    
    -- UICorner for rounded edges
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 20)
    uiCorner.Parent = mainFrame
    
    -- UIStroke for border
    local uiStroke = Instance.new("UIStroke")
    uiStroke.Color = Color3.fromRGB(60, 60, 60)
    uiStroke.Thickness = 2
    uiStroke.Parent = mainFrame
    
    -- Image container (top section)
    local imageContainer = Instance.new("Frame")
    imageContainer.Name = "ImageContainer"
    imageContainer.Size = UDim2.new(1, 0, 0, 200)
    imageContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    imageContainer.BorderSizePixel = 0
    imageContainer.ZIndex = 102
    imageContainer.Parent = mainFrame
    
    local imageCorner = Instance.new("UICorner")
    imageCorner.CornerRadius = UDim.new(0, 20)
    imageCorner.Parent = imageContainer
    
    -- Image label
    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Name = "UploadedImage"
    imageLabel.Size = UDim2.new(1, -20, 1, -10)
    imageLabel.Position = UDim2.new(0, 10, 0, 5)
    imageLabel.BackgroundTransparency = 1
    imageLabel.ImageScaleType = Enum.ScaleType.Fit
    imageLabel.Image = "rbxassetid://0"
    imageLabel.ZIndex = 103
    imageLabel.Parent = imageContainer
    
    -- Title text in hub
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Size = UDim2.new(0.7, 0, 0, 50)
    titleLabel.Position = UDim2.new(0.15, 0, 0.48, -25)
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 24
    titleLabel.Font = Enum.Font.Gotham
    titleLabel.Text = "crew war essentials"
    titleLabel.TextScaled = true
    titleLabel.ZIndex = 102
    titleLabel.Parent = mainFrame
    
    -- Credit text in hub (bottom right)
    local creditLabel = Instance.new("TextLabel")
    creditLabel.Name = "CreditLabel"
    creditLabel.Size = UDim2.new(0, 280, 0, 25)
    creditLabel.Position = UDim2.new(1, -290, 0.6, 0)
    creditLabel.BackgroundTransparency = 1
    creditLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    creditLabel.TextSize = 12
    creditLabel.Font = Enum.Font.GothamBold
    creditLabel.Text = "coded/made by japneas"
    creditLabel.TextXAlignment = Enum.TextXAlignment.Right
    creditLabel.ZIndex = 102
    creditLabel.Parent = mainFrame
    
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
