local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui
gui.ResetOnSpawn = false 

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.7, 0, 1, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderColor3 = Color3.new(0, 0, 0)
frame.BorderSizePixel = 0
frame.Active = true
frame.BackgroundTransparency = 0 
frame.Draggable = true
frame.Parent = gui

local bruh = Instance.new("UICorner")
bruh.CornerRadius = UDim.new(0, 7)
bruh.Parent = frame

local bruh1 = Instance.new("TextLabel")
bruh1.Size = UDim2.new(0.3, 0, 0.15, 0)
bruh1.Position = UDim2.new(0.35, 0, 0.1, 0)
bruh1.BackgroundColor3 = Color3.new(0, 0, 0)
bruh1.BorderColor3 = Color3.new(0, 0, 0)
bruh1.BorderSizePixel = 1
bruh1.Text = "KEY SYSTEM GUI" --Name of your script
bruh1.BackgroundTransparency = 1
bruh1.TextColor3 = Color3.new(255, 255, 255)
bruh1.Font = Enum.Font.SourceSansBold
bruh1.TextSize = 40
bruh1.Parent = frame

local bruh2 = Instance.new("TextLabel")
bruh2.Size = UDim2.new(0.3, 0, 0.15, 0)
bruh2.Position = UDim2.new(0.35, 0, 0.22, 0)
bruh2.BackgroundColor3 = Color3.new(0, 0, 0)
bruh2.BorderColor3 = Color3.new(0, 0, 0)
bruh2.BorderSizePixel = 0
bruh2.Text = "Get Key System"
bruh2.BackgroundTransparency = 1
bruh2.TextColor3 = Color3.new(255, 255, 255)
bruh2.Font = Enum.Font.SourceSans
bruh2.TextSize = 30
bruh2.Parent = frame

local bruh3 = Instance.new("TextBox")
bruh3.Size = UDim2.new(0.499, 0, 0.18, 0)
bruh3.Position = UDim2.new(0.25, 0, 0.43, 0)
bruh3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bruh3.BorderColor3 = Color3.new(0, 0, 0)
bruh3.BorderSizePixel = 0
bruh3.PlaceholderText = "OP-SCRIPTS"
bruh3.Text = "GET KEY"
bruh3.TextColor3 = Color3.fromRGB(255, 255, 255)
bruh3.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
bruh3.BackgroundTransparency = 1
bruh3.Font = Enum.Font.Code
bruh3.TextSize = 15
bruh3.TextXAlignment = Enum.TextXAlignment.Center
bruh3.Parent = frame

local bruh4 = Instance.new("UICorner")
bruh4.CornerRadius = UDim.new(0, 5)
bruh4.Parent = bruh3

local bruh5 = Instance.new("UIStroke")
bruh5.Color = Color3.new(1, 1, 1)
bruh5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
bruh5.Thickness = 2
bruh5.Parent = bruh3

local bruh6 = Instance.new("TextButton")
bruh6.Size = UDim2.new(0.3, 0, 0.18, 0)
bruh6.Position = UDim2.new(0.1, 0, 0.73, 0)
bruh6.BackgroundColor3 = Color3.new(0, 0, 0)
bruh6.BorderColor3 = Color3.new(0, 0, 0)
bruh6.BorderSizePixel = 0
bruh6.Text = "Get Key"
bruh6.BackgroundTransparency = 1
bruh6.TextColor3 = Color3.new(255, 255, 255)
bruh6.Font = Enum.Font.SourceSans
bruh6.TextSize = 25
bruh6.Parent = frame

local bruh7 = Instance.new("UICorner")
bruh7.CornerRadius = UDim.new(0, 5)
bruh7.Parent = bruh6

local bruh8 = Instance.new("UIStroke")
bruh8.Color = Color3.new(1, 1, 1)
bruh8.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
bruh8.Thickness = 2
bruh8.Parent = bruh6

local bruh9 = Instance.new("TextButton")
bruh9.Size = UDim2.new(0.3, 0, 0.18, 0)
bruh9.Position = UDim2.new(0.6, 0, 0.73, 0)
bruh9.BackgroundColor3 = Color3.new(0, 0, 0)
bruh9.BorderColor3 = Color3.new(0, 0, 0)
bruh9.BorderSizePixel = 0
bruh9.Text = "Check Key"
bruh9.BackgroundTransparency = 1
bruh9.TextColor3 = Color3.new(255, 255, 255)
bruh9.Font = Enum.Font.SourceSans
bruh9.TextSize = 25
bruh9.Parent = frame

local bruh10 = Instance.new("UICorner")
bruh10.CornerRadius = UDim.new(0, 5)
bruh10.Parent = bruh9

local bruh11 = Instance.new("UIStroke")
bruh11.Color = Color3.new(1, 1, 1)
bruh11.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
bruh11.Thickness = 2
bruh11.Parent = bruh9

-- Adiciona botão X para fechar a interface
local closeButton = Instance.new("ImageButton")
closeButton.Size = UDim2.new(0.05, 0, 0.1, 0)
closeButton.Position = UDim2.new(0.95, -10, 0, 10)
closeButton.Image = "rbxasset://textures/ui/ScreenshotHud/Close.png"
closeButton.BackgroundTransparency = 1
closeButton.Parent = frame

-- Função para gerar uma chave aleatória
local function gerarChaveAleatoria()
    local caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+[]{}|;:',.<>?/"
    local tamanho = math.random(20, 77)
    local chave = ""
    for i = 1, tamanho do
        local indice = math.random(1, #caracteres)
        chave = chave .. string.sub(caracteres, indice, indice)
    end
    return chave
end

local key -- Chave aleatória
local keyGerada = false -- Verifica se a chave já foi gerada

bruh6.MouseButton1Click:Connect(function()
    if not keyGerada then
        key = gerarChaveAleatoria()
        setclipboard(key)
        keyGerada = true
    end
end)

bruh9.MouseButton1Click:Connect(function()
    if bruh3.Text == key then
        bruh3.Text = "Valid Key"
        wait(1)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SAMUCARARONOB/92929923837373-/refs/heads/main/OPENKEYSMLCST"))() -- Executa o script desejado
        gui:Destroy()
    else
        bruh3.Text = "Invalid Key! Try Again"
        wait(1)
        bruh3.Text = "Invalid✖️"
    end
end)

-- Função para destruir a interface quando o botão X for clicado
closeButton.MouseButton1Click:Connect(function()
  gui:Destroy()
end)
