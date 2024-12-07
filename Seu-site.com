local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
Frame.Size = UDim2.new(0, 600, 0, 300)
Frame.Position = UDim2.new(0.5, -300, 0.5, -150)
Frame.Active = true
Frame.Draggable = true
Frame.BorderSizePixel = 5
Frame.BorderColor3 = Color3.new(0, 1, 1)
Frame.BackgroundTransparency = 0.3

local UICorner = Instance.new("UICorner")
UICorner.Parent = Frame
UICorner.CornerRadius = UDim.new(0, 25)

local UIGradient = Instance.new("UIGradient")
UIGradient.Parent = Frame
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.0, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(0, 128, 255))
})
UIGradient.Rotation = 45

local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0.2, 0)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Text = "Sistema De Chave Key"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 40
Title.TextStrokeTransparency = 0
Title.TextStrokeColor3 = Color3.new(0, 0, 0)

local SubTitle = Instance.new("TextLabel")
SubTitle.Parent = Frame
SubTitle.Size = UDim2.new(1, 0, 0.1, 0)
SubTitle.Position = UDim2.new(0, 0, 0.2, 0)
SubTitle.Text = "Insira sua chave abaixo:"
SubTitle.TextColor3 = Color3.new(1, 1, 1)
SubTitle.BackgroundTransparency = 1
SubTitle.Font = Enum.Font.SourceSans
SubTitle.TextSize = 28
SubTitle.TextStrokeTransparency = 0.8
SubTitle.TextStrokeColor3 = Color3.new(0, 0, 0)

local TextBoxFrame = Instance.new("Frame")
TextBoxFrame.Parent = Frame
TextBoxFrame.Size = UDim2.new(0.9, 0, 0.15, 0)
TextBoxFrame.Position = UDim2.new(0.05, 0, 0.35, 0)
TextBoxFrame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
TextBoxFrame.BackgroundTransparency = 0.5
TextBoxFrame.BorderSizePixel = 0

local KeyInput = Instance.new("TextBox")
KeyInput.Parent = TextBoxFrame
KeyInput.Size = UDim2.new(1, 0, 1, 0)
KeyInput.Text = ""
KeyInput.PlaceholderText = "Digite a chave..."
KeyInput.TextColor3 = Color3.new(1, 1, 1)
KeyInput.BackgroundTransparency = 1
KeyInput.Font = Enum.Font.SourceSans
KeyInput.TextSize = 24
KeyInput.ClearTextOnFocus = false

local UICornerTextbox = Instance.new("UICorner")
UICornerTextbox.Parent = TextBoxFrame
UICornerTextbox.CornerRadius = UDim.new(0, 15)

local ConfirmButton = Instance.new("TextButton")
ConfirmButton.Parent = Frame
ConfirmButton.Size = UDim2.new(0.3, 0, 0.15, 0)
ConfirmButton.Position = UDim2.new(0.35, 0, 0.55, 0)
ConfirmButton.Text = "Confirmar"
ConfirmButton.TextColor3 = Color3.new(1, 1, 1)
ConfirmButton.BackgroundColor3 = Color3.new(0, 0.6, 0.6)
ConfirmButton.Font = Enum.Font.SourceSansBold
ConfirmButton.TextSize = 28
ConfirmButton.BackgroundTransparency = 0.1

local UICornerButton = Instance.new("UICorner")
UICornerButton.Parent = ConfirmButton
UICornerButton.CornerRadius = UDim.new(0, 15)

local CopyButton = Instance.new("TextButton")
CopyButton.Parent = Frame
CopyButton.Size = UDim2.new(0.3, 0, 0.15, 0)
CopyButton.Position = UDim2.new(0.35, 0, 0.75, 0)
CopyButton.Text = "CÓPIA"
CopyButton.TextColor3 = Color3.new(1, 1, 1)
CopyButton.BackgroundColor3 = Color3.new(0.5, 0.5, 1)
CopyButton.Font = Enum.Font.SourceSansBold
CopyButton.TextSize = 28
CopyButton.BackgroundTransparency = 0.1

local UICornerCopyButton = Instance.new("UICorner")
UICornerCopyButton.Parent = CopyButton
UICornerCopyButton.CornerRadius = UDim.new(0, 15)

-- Função para copiar o texto ao clicar no botão de cópia
CopyButton.MouseButton1Click:Connect(function()
    setclipboard("Key_A.SEO8CJ<%289÷2]8YE199DJPSSAMMMMDLDKFJFO20Ij")
    CopyButton.Text = "Copiado!"
    wait(0.5)
    CopyButton.Text = "CÓPIA"
end)

ConfirmButton.MouseButton1Click:Connect(function()
    if KeyInput.Text == "Key_A.SEO8CJ<%289÷2]8YE199DJPSSAMMMMDLDKFJFO20Ij" then
        ScreenGui:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SAMUCARARONOB/92929923837373-/refs/heads/main/OPENKEYSMLCST"))()
    else
        ConfirmButton.Text = "Confirmado!"
        ConfirmButton.BackgroundColor3 = Color3.new(0, 1, 0.6)
        wait(0.5)
        ConfirmButton.Text = "Confirmar"
        ConfirmButton.BackgroundColor3 = Color3.new(0, 0.6, 0.6)
    end
end)

local InfoLabel = Instance.new("TextLabel")
InfoLabel.Parent = Frame
InfoLabel.Size = UDim2.new(1, 0, 0.15, 0)
InfoLabel.Position = UDim2.new(0, 0, 0.85, 0)
InfoLabel.Text = "Chave válida: N/A"
InfoLabel.TextColor3 = Color3.new(1, 1, 1)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Font = Enum.Font.SourceSans
InfoLabel.TextSize = 24

local ProgressBar = Instance.new("Frame")
ProgressBar.Parent = Frame
ProgressBar.Size = UDim2.new(0.9, 0, 0.05, 0)
ProgressBar.Position = UDim2.new(0.05, 0, 0.7, 0)
ProgressBar.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
ProgressBar.BorderSizePixel = 0

local ProgressFill = Instance.new("Frame")
ProgressFill.Parent = ProgressBar
ProgressFill.Size = UDim2.new(0, 0, 1, 0)
ProgressFill.BackgroundColor3 = Color3.new(0, 1, 0.6)

local UICornerProgress = Instance.new("UICorner")
UICornerProgress.Parent = ProgressBar
UICornerProgress.CornerRadius = UDim.new(0, 15)

local function animateProgress(duration)
    ProgressFill:TweenSize(
        UDim2.new(1, 0, 1, 0),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quart,
        duration,
        true
    )
end

KeyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        animateProgress(1)
        wait(3)
        local valid = KeyInput.Text == "Key_A.SEO8CJ<%289÷2]8YE199DJPSSAMMMMDLDKFJFO20Ij"
        InfoLabel.TextColor3 = valid and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
        InfoLabel.Text = valid and "Chave válida: Sim" or "Chave válida: Não"
    end
end)

-- Efeitos de hover para os botões
local function applyHoverEffect(button)
    local originalColor = button.BackgroundColor3
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = button.BackgroundColor3:lerp(Color3.new(1, 1, 1), 0.2)
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = originalColor
    end)
end

applyHoverEffect(ConfirmButton)
applyHoverEffect(CopyButton)

-- Animações de transição para os elementos
local function applyTransitionAnimation(element)
    element.Visible = false
    wait(0.1)
    element.Visible = true
    element:TweenSize(element.Size + UDim2.new(0, 10, 0, 10), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 1, true)
end

applyTransitionAnimation(Frame)
applyTransitionAnimation(Title)
applyTransitionAnimation(SubTitle)
applyTransitionAnimation(TextBoxFrame)
applyTransitionAnimation(KeyInput)
applyTransitionAnimation(ConfirmButton)
applyTransitionAnimation(CopyButton)
applyTransitionAnimation(InfoLabel)

print("PARE DE OLHA O MEU SCRIPT SEU LADRÃO!")
