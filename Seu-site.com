local TweenService = game:GetService("TweenService")

local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui
gui.ResetOnSpawn = false 

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.8, 0, 0.8, 0) -- Setting a suitable initial size
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10)
frameCorner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.1, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
title.BorderSizePixel = 0
title.Text = "KEY OP-SCRIPTS"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 30
title.Parent = frame

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0.1, 0)
subtitle.Position = UDim2.new(0, 0, 0.1, 0)
subtitle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
subtitle.BorderSizePixel = 0
subtitle.Text = "Get Key System Premium Free"
subtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 20
subtitle.Parent = frame

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0.1, 0)
subtitle.Position = UDim2.new(0, 0, 0.2, 0)
subtitle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
subtitle.BorderSizePixel = 0
subtitle.Text = "Escreva a chave aqui👇"
subtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 20
subtitle.Parent = frame

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0.8, 0, 0.1, 0)
keyBox.Position = UDim2.new(0.1, 0, 0.3, 0)
keyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
keyBox.BorderSizePixel = 0
keyBox.PlaceholderText = "PREMIUM KEY"
keyBox.Text = ""
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 0)
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 20
keyBox.Parent = frame

local keyBoxCorner = Instance.new("UICorner")
keyBoxCorner.CornerRadius = UDim.new(0, 5)
keyBoxCorner.Parent = keyBox

local scrollingTitle = Instance.new("TextLabel")
scrollingTitle.Size = UDim2.new(0.8, 0, 0.05, 0)
scrollingTitle.Position = UDim2.new(0.1, 0, 0.45, 0)
scrollingTitle.BackgroundTransparency = 1
scrollingTitle.Text = "1% of the keys"
scrollingTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
scrollingTitle.Font = Enum.Font.Gotham
scrollingTitle.TextSize = 20
scrollingTitle.Parent = frame

 local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(0.8, 0, 0.2, 0)
scrollingFrame.Position = UDim2.new(0.1, 0, 0.5, 0)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.ScrollBarThickness = 10
scrollingFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
scrollingFrame.BorderSizePixel = 0
scrollingFrame.Parent = frame

local uiGridLayout = Instance.new("UIGridLayout")
uiGridLayout.CellSize = UDim2.new(0.3, 0, 0, 25)
uiGridLayout.Parent = scrollingFrame

local function generateKey()
    local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+[]{}|;:',.<>?/"
    local length = math.random(10, 25)
    local key = ""
    for i = 1, length do
        local index = math.random(1, #chars)
        key = key .. string.sub(chars, index, index)
    end
    return key
end

local function generateAndDisplayKeys()
    for i = 1, 1000 do
        local key = generateKey()
        local keyLabel = Instance.new("TextLabel")
        keyLabel.Size = UDim2.new(1, 0, 0, 25)
        keyLabel.BackgroundTransparency = 1
        keyLabel.Text = key
        keyLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
        keyLabel.Font = Enum.Font.Gotham
        keyLabel.TextSize = 14
        keyLabel.Parent = scrollingFrame
    end
    scrollingFrame.CanvasSize = UDim2.new(0, 0, math.ceil(1000 / 3) * 0.025, 0)
end

generateAndDisplayKeys()

local getKeyBtn = Instance.new("TextButton")
getKeyBtn.Size = UDim2.new(0.35, 0, 0.1, 0)
getKeyBtn.Position = UDim2.new(0.1, 0, 0.75, 0)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
getKeyBtn.BorderSizePixel = 0
getKeyBtn.Text = "Get Key"
getKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyBtn.Font = Enum.Font.Gotham
getKeyBtn.TextSize = 20
getKeyBtn.Parent = frame

local getKeyBtnCorner = Instance.new("UICorner")
getKeyBtnCorner.CornerRadius = UDim.new(0, 5)
getKeyBtnCorner.Parent = getKeyBtn

local getKeyIcon = Instance.new("ImageLabel")
getKeyIcon.Size = UDim2.new(0.1, 0, 0.5, 0)
getKeyIcon.Position = UDim2.new(0, 0, 0.25, 0)
getKeyIcon.Image = "rbxassetid://14317581285"
getKeyIcon.BackgroundTransparency = 1
getKeyIcon.Parent = getKeyBtn

getKeyBtn.MouseEnter:Connect(function()
    getKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
end)

getKeyBtn.MouseLeave:Connect(function()
    getKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
end)

local checkKeyBtn = Instance.new("TextButton")
checkKeyBtn.Size = UDim2.new(0.35, 0, 0.1, 0)
checkKeyBtn.Position = UDim2.new(0.55, 0, 0.75, 0)
checkKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 100)
checkKeyBtn.BorderSizePixel = 0
checkKeyBtn.Text = "Check Key"
checkKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
checkKeyBtn.Font = Enum.Font.Gotham
checkKeyBtn.TextSize = 20
checkKeyBtn.Parent = frame

local checkKeyBtnCorner = Instance.new("UICorner")
checkKeyBtnCorner.CornerRadius = UDim.new(0, 5)
checkKeyBtnCorner.Parent = checkKeyBtn

local checkKeyIcon = Instance.new("ImageLabel")
checkKeyIcon.Size = UDim2.new(0.1, 0, 0.5, 0)
checkKeyIcon.Position = UDim2.new(0, 0, 0.25, 0)
checkKeyIcon.Image = "rbxassetid://4483362458"
checkKeyIcon.BackgroundTransparency = 1
checkKeyIcon.Parent = checkKeyBtn

checkKeyBtn.MouseEnter:Connect(function()
    checkKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
end)

checkKeyBtn.MouseLeave:Connect(function()
    checkKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
end)

local closeButton = Instance.new("ImageButton")
closeButton.Size = UDim2.new(0.05, 0, 0.1, 0)
closeButton.Position = UDim2.new(0.95, -10, 0, 10)
closeButton.Image = "rbxassetid://6035047409"
closeButton.BackgroundTransparency = 1
closeButton.Parent = frame

local keyGenerated = false

getKeyBtn.MouseButton1Click:Connect(function()
    if not keyGenerated then
        key = generateKey()
        setclipboard(key)
        keyGenerated = true
    end
end)

checkKeyBtn.MouseButton1Click:Connect(function()
    if keyBox.Text == key then
        keyBox.Text = "Valid Key"
        wait(1)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SAMUCARARONOB/92929923837373-/refs/heads/main/OPENKEYSMLCST"))()
        gui:Destroy()
    else
        keyBox.Text = "Invalid Key! Try Again"
        wait(1)
        keyBox.Text = "Invalid✖️"
    end
end)

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local function animateUI()
    frame.Size = UDim2.new(0, 0, 0, 0)
    local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local goal = {Size = UDim2.new(0.7, 0, 1.0, 0)}
    TweenService:Create(frame, tweenInfo, goal):Play()
end

animateUI()
