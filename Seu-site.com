local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()
getgenv().SecureMode = true

local Window = Rayfield:CreateWindow({
	Name = "LINK Canal",
	LoadingTitle = "OP-SCRIPTS LinkCanal",
	LoadingSubtitle = "",
})

local Tab = Window:CreateTab("Link Canal Escreve-se", 4483362458)
local SubscribeLabel = Tab:CreateLabel("Escreve-se Clique no Butão LINK CANAL Para Acessar o OP-SCRIPTS")

local initialLink = "https://www.youtube.com/@XROBLOSCRIPTS"
local linkCopied = false

-- Script dos segundos
for i = 1, 5 do
	Tab:CreateLabel(i .. " Seconds")
	wait(0.2)
end

-- Script do botão
local CopyButton = Tab:CreateButton({
	Name = "LINK CANAL",
	Callback = function()
		if not linkCopied then
			setclipboard(initialLink)
			print("Link do canal copiado para a área de transferência:", initialLink)
			linkCopied = true
		else
			local validKeys = {
				"Abcd1234CtXycdcOgctXtiCyxRdyoFy8fUCydt",
				"Vt8dyoc7rTch/\">hvIyxyc[_{8▪︎{£cru'tcTIitd",
				"OHNivGuxt8Dy8cyid58fy9D57xVyOcCyoctuztiCoyx7tc"
			}
			local key = validKeys[math.random(#validKeys)]
			setclipboard(key)
			print("Chave copiada para a área de transferência:", key)
		end

		local phrases = {
			"Novos Scripts todos os dias!",
			"OP-SCRIPTS Sendo Atualizado Todos Os Dias😄",
			"Se inscreva e fique por dentro!",
			"Deixe o Like",
			"Obrigado por assistir!",
			"Deixe seu like e comentário!",
			"Ative o sininho para notificações!",
			"Compartilhe com seus amigos!",
			"Se Inscreva"
		}

		for i = 1, #phrases do
			Tab:CreateLabel(phrases[i])
			wait(0.3)
		end

		wait(1)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/SAMUCARARONOB/92929923837373-/refs/heads/main/OPENKEYSMLCST"))()
		print("Script executado.")
	end,
})

-- Nova aba com informações positivas e elementos interativos
local InfoTab = Window:CreateTab("Informação Canal", 4483362458)

local positiveTexts = {
	"Atualizo meu script todos os dias!",
	"Novas funções são adicionadas constantemente.",
	"Receba as últimas novidades sempre!",
	"Scripts mais avançados disponíveis aqui.",
	"Se inscreva para não perder nenhuma atualização!",
	"Os melhores scripts estão aqui.",
	"Deixe seu like e comentário para ajudar o canal!",
	"Obrigado por assistir!",
	"Ative o sininho para notificações instantâneas.",
	"Compartilhe o canal com seus amigos!",
	"Agradeço pelo seu apoio constante!",
	"Sua satisfação é minha prioridade!",
	"Estou sempre melhorando para você.",
	"Meu canal é atualizado diariamente!",
	"Scripts exclusivos para inscritos do canal.",
	"E muito mais...",
	"Não perca nenhum dos meus vídeos!",
	"Todo dia tem novidade!",
	"O melhor conteúdo para você!",
	"Conteúdos exclusivos para inscritos.",
	"Compartilhe e ajude meu canal a crescer!",
	"Agradeço a todos que me acompanham!",
	"Participe das discussões e enquetes!",
	"Estou sempre inovando!",
	"Sempre trazendo novidades para você!",
	"A qualidade dos meus scripts é garantida!",
	"Conteúdo exclusivo e atualizado diariamente!",
	"Agradeço seu apoio contínuo!",
	"Não perca as últimas atualizações!",
	"Sempre buscando melhorar meus scripts!",
	"Satisfação garantida com meus conteúdos!",
	"Meu canal está em constante crescimento!",
	"Assine para atualizações diárias!",
	"Compartilhe meu canal e fortaleça a comunidade!",
	"Sua opinião me ajuda a melhorar!",
	"Ajude-me a crescer ainda mais!",
	"Fique ligado nas novidades diárias!",
	"Trabalho para oferecer o melhor!",
	"Minhas atualizações são frequentes e variadas!",
	"O melhor lugar para encontrar scripts atualizados!"
}
-- Adicionar ícones nos textos para dar um charme especial
for i = 1, #positiveTexts do
	InfoTab:CreateLabel("📌 " .. positiveTexts[i])
	wait(0.1)
end

-- Adicionar botões interativos com funcionalidades específicas
local NightModeButton = InfoTab:CreateButton({
	Name = "Deixar o mapa de noite",
	Callback = function()
		game.Lighting.ClockTime = 0
		print("O mapa agora está de noite.")
	end,
})

local DayModeButton = InfoTab:CreateButton({
	Name = "Deixar o mapa de dia",
	Callback = function()
		game.Lighting.ClockTime = 14
		print("O mapa agora está de dia.")
	end,
})

local RainModeButton = InfoTab:CreateButton({
	Name = "Ativar chuva",
	Callback = function()
		local rain = Instance.new("ParticleEmitter")
		rain.Texture = "rbxassetid://244221440"
		rain.Parent = game.Workspace
		rain.Acceleration = Vector3.new(0, -10, 0)
		rain.Lifetime = NumberRange.new(10)
		rain.Rate = 1000
		rain.Speed = NumberRange.new(5, 10)
		print("Chuva ativada.")
	end,
})

local ClearWeatherButton = InfoTab:CreateButton({
	Name = "Limpar o tempo",
	Callback = function()
		for _, emitter in pairs(game.Workspace:GetDescendants()) do
			if emitter:IsA("ParticleEmitter") then
				emitter:Destroy()
			end
		end
		print("O tempo está limpo.")
	end,
})

local IncreaseBrightnessButton = InfoTab:CreateButton({
	Name = "Aumentar brilho",
	Callback = function()
		game.Lighting.Brightness = 3
		print("Brilho aumentado.")
	end,
})

local DecreaseBrightnessButton = InfoTab:CreateButton({
	Name = "Diminuir brilho",
	Callback = function()
		game.Lighting.Brightness = 0.5
		print("Brilho diminuído.")
	end,
})

-- Adicionar mais botões interativos com funcionalidades variadas
local FogIncreaseButton = InfoTab:CreateButton({
	Name = "Adicionar névoa",
	Callback = function()
		game.Lighting.FogEnd = 100
		print("Névoa adicionada.")
	end,
})

local FogRemoveButton = InfoTab:CreateButton({
	Name = "Remover névoa",
	Callback = function()
		game.Lighting.FogEnd = 100000
		print("Névoa removida.")
	end,
})

local ChangeSkyColorButton = InfoTab:CreateButton({
	Name = "Mudar a cor do céu",
	Callback = function()
		game.Lighting.OutdoorAmbient = Color3.new(math.random(), math.random(), math.random())
		print("A cor do céu foi alterada.")
	end,
})

local IncreasePlayerSpeedButton = InfoTab:CreateButton({
	Name = "Aumentar velocidade dos jogadores",
	Callback = function()
		local players = game:GetService("Players")
		for _, player in ipairs(players:GetPlayers()) do
			if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
				player.Character.Humanoid.WalkSpeed = 32
			end
		end
		print("Velocidade dos jogadores aumentada.")
	end,
})

local DecreasePlayerSpeedButton = InfoTab:CreateButton({
	Name = "Diminuir velocidade dos jogadores",
	Callback = function()
		local players = game:GetService("Players")
		for _, player in ipairs(players:GetPlayers()) do
			if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
				player.Character.Humanoid.WalkSpeed = 8
			end
		end
		print("Velocidade dos jogadores diminuída.")
	end,
})

-- Adicionar seções de feedback de usuários
local feedbacks = {
	"\"Ótimos scripts! Estou adorando cada atualização!\" - Usuário A MIGU843",
	"\"Este canal realmente se supera, sempre trazendo o melhor!\" - Usuário OGHLAPO",
	"\"Nunca vi scripts tão bons e bem feitos!\" - Usuário BIANCA10KICA",
	"\"Incrível como conseguem manter a qualidade em cada script novo!\" - Usuário LEVI_AQUENAN",
	"\"Recomendo a todos que se inscrevam e acompanhem!\" - Usuário RIP_RARO",
        "\"+999 Players!\" - Usuários de Roblox"
}

for i = 1, #feedbacks do
	InfoTab:CreateLabel(feedbacks[i])
	wait(0.2)
end
