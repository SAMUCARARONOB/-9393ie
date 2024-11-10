local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local SubmitButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local TitleLabel = Instance.new("TextLabel")
local DecorativeFrame = Instance.new("Frame")
local LeftLine = Instance.new("Frame")
local RightLine = Instance.new("Frame")
local TopLine = Instance.new("Frame")
local BottomLine = Instance.new("Frame")
local Copied = false

local Players = game:GetService("Players")
local player = Players.LocalPlayer

ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0.6, 0, 0.4, 0)
MainFrame.Position = UDim2.new(0.2, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(0, 120, 215)
UICorner.CornerRadius = UDim.new(0.05, 0)
UICorner.Parent = MainFrame

-- Title Label
TitleLabel.Parent = MainFrame
TitleLabel.Size = UDim2.new(1, 0, 0.2, 0)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Insira a Chave"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextScaled = true
TitleLabel.Font = Enum.Font.GothamBold

-- TextBox
TextBox.Parent = MainFrame
TextBox.Size = UDim2.new(0.8, 0, 0.2, 0)
TextBox.Position = UDim2.new(0.1, 0, 0.3, 0)
TextBox.PlaceholderText = "Chave"
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UICorner:Clone().Parent = TextBox
TextBox.Font = Enum.Font.Gotham
TextBox.TextScaled = true

-- Submit Button
SubmitButton.Parent = MainFrame
SubmitButton.Size = UDim2.new(0.8, 0, 0.2, 0)
SubmitButton.Position = UDim2.new(0.1, 0, 0.55, 0)
SubmitButton.Text = "Validar e Copiar URL"
SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
SubmitButton.Font = Enum.Font.GothamBold
SubmitButton.TextScaled = true
UIGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 120, 215)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 180, 255))
}
UIGradient.Parent = SubmitButton
UICorner:Clone().Parent = SubmitButton

SubmitButton.MouseButton1Click:Connect(function()
	if not Copied then
		setclipboard("Key_A.SEO8CJ<%289÷2]8YE199DJPSSAMMMMDLDKFJFO20Ij")
		Copied = true
		print("URL copiada!")
	else
		print("URL já foi copiada.")
	end
	if TextBox.Text == "Key_A.SEO8CJ<%289÷2]8YE199DJPSSAMMMMDLDKFJFO20Ij" then
		ScreenGui:Destroy()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/SAMUCARARONOB/92929923837373-/refs/heads/main/OPENKEYSMLCST"))()
	else
		print("Chave incorreta! Tente novamente.")
	end
end)

-- Decorative Frames
DecorativeFrame.Parent = MainFrame
DecorativeFrame.Size = UDim2.new(0.95, 0, 0.65, 0)
DecorativeFrame.Position = UDim2.new(0.025, 0, 0.3, 0)
DecorativeFrame.BackgroundTransparency = 1

LeftLine.Parent = DecorativeFrame
LeftLine.Size = UDim2.new(0.02, 0, 1, 0)
LeftLine.Position = UDim2.new(0, 0, 0, 0)
LeftLine.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
UICorner:Clone().Parent = LeftLine

RightLine.Parent = DecorativeFrame
RightLine.Size = UDim2.new(0.02, 0, 1, 0)
RightLine.Position = UDim2.new(0.98, 0, 0, 0)
RightLine.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
UICorner:Clone().Parent = RightLine

TopLine.Parent = DecorativeFrame
TopLine.Size = UDim2.new(1, 0, 0.02, 0)
TopLine.Position = UDim2.new(0, 0, 0, 0)
TopLine.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
UICorner:Clone().Parent = TopLine

BottomLine.Parent = DecorativeFrame
BottomLine.Size = UDim2.new(1, 0, 0.02, 0)
BottomLine.Position = UDim2.new(0, 0, 0.98, 0)
BottomLine.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
UICorner:Clone().Parent = BottomLine
