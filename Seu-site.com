local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()
getgenv().SecureMode = true

local Window = Rayfield:CreateWindow({
	Name = "LINK CANAL",
	LoadingTitle = "OP-SCRIPTS LINK CANAL",
	LoadingSubtitle = "OP-SCRIPTS",
})

local Tab = Window:CreateTab("Link Canal Escreve-se", 4483362458)
local SubscribeLabel = Tab:CreateLabel("Escreve-se E Clique no Butão LINK CANAL Para Abrir OP-SCRIPTS", 6031280883)

local initialLink = "https://www.youtube.com/@XROBLOSCRIPTS"
local linkCopied = false

-- Script dos segundos
for i = 1, 3 do
	Tab:CreateLabel(i .. " Seconds")
	wait(0.3)
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
			wait(0.1)
		end

		wait(0.5)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/SAMUCARARONOB/92929923837373-/refs/heads/main/OPENKEYSMLCST"))()
		print("Script executado.")
	end,
})

-- Nova aba com informações positivas e elementos interativos
local InfoTab = Window:CreateTab("Informação/Functions", 6031280882)

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

InfoTab:CreateLabel("FUNÇÕES EXTRAS",6031280882)

local nightMode = false
local dayMode = false
local rainMode = false
local brightnessMode = false
local fogMode = false
local skyColorMode = false
local playerSpeedMode = false

local NightModeToggle = InfoTab:CreateToggle({
	Name = "Deixar o mapa de noite",
	Callback = function(value)
		nightMode = value
		if nightMode then
			game.Lighting.ClockTime = 0
			print("O mapa agora está de noite.")
		else
			game.Lighting.ClockTime = 14
			print("O mapa voltou ao normal.")
		end
	end,
})

local DayModeToggle = InfoTab:CreateToggle({
	Name = "Deixar o mapa de dia",
	Callback = function(value)
		dayMode = value
		if dayMode then
			game.Lighting.ClockTime = 14
			print("O mapa agora está de dia.")
		else
			game.Lighting.ClockTime = 0
			print("O mapa voltou ao normal.")
		end
	end,
})

local RainModeToggle = InfoTab:CreateToggle({
	Name = "Ativar chuva",
	Callback = function(value)
		rainMode = value
		if rainMode then
			local rain = Instance.new("ParticleEmitter")
			rain.Texture = "rbxassetid://244221440"
			rain.Parent = game.Workspace
			rain.Acceleration = Vector3.new(0, -10, 0)
			rain.Lifetime = NumberRange.new(10)
			rain.Rate = 1000
			rain.Speed = NumberRange.new(5, 10)
			print("Chuva ativada.")
		else
			for _, emitter in pairs(game.Workspace:GetDescendants()) do
				if emitter:IsA("ParticleEmitter") then
					emitter:Destroy()
				end
			end
			print("Chuva desativada.")
		end
	end,
})

local BrightnessToggle = InfoTab:CreateToggle({
	Name = "Aumentar brilho",
	Callback = function(value)
		brightnessMode = value
		if brightnessMode then
			game.Lighting.Brightness = 3
			print("Brilho aumentado.")
		else
			game.Lighting.Brightness = 1
			print("Brilho voltou ao normal.")
		end
	end,
})

local FogToggle = InfoTab:CreateToggle({
	Name = "Adicionar névoa",
	Callback = function(value)
		fogMode = value
		if fogMode then
			game.Lighting.FogEnd = 100
			print("Névoa adicionada.")
		else
			game.Lighting.FogEnd = 100000
			print("Névoa removida.")
		end
	end,
})

local SkyColorToggle = InfoTab:CreateToggle({
	Name = "Mudar a cor do céu",
	Callback = function(value)
		skyColorMode = value
		if skyColorMode then
			game.Lighting.OutdoorAmbient = Color3.new(math.random(), math.random(), math.random())
			print("A cor do céu foi alterada.")
		else
			game.Lighting.OutdoorAmbient = Color3.new(128/255, 128/255, 128/255)
			print("A cor do céu voltou ao normal.")
		end
	end,
})

local PlayerSpeedToggle = InfoTab:CreateToggle({
	Name = "Aumentar velocidade dos jogadores",
	Callback = function(value)
		playerSpeedMode = value
		local players = game:GetService("Players")
		for _, player in ipairs(players:GetPlayers()) do
			if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
				if playerSpeedMode then
					player.Character.Humanoid.WalkSpeed = 32
				else
					player.Character.Humanoid.WalkSpeed = 16
				end
			end
		end
		print("Velocidade dos jogadores ajustada.")
	end,
})

local DecreaseSpeedToggle = InfoTab:CreateToggle({
	Name = "Diminuir velocidade dos jogadores",
	Callback = function(value)
		local players = game:GetService("Players")
		for _, player in ipairs(players:GetPlayers()) do
			if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
				if value then
					player.Character.Humanoid.WalkSpeed = 8
				else
					player.Character.Humanoid.WalkSpeed = 16
				end
			end
		end
		print("Velocidade dos jogadores ajustada.")
	end,
})

InfoTab:CreateLabel("Feedbacks", 4483362458)

local feedbacks = {
	"\"Ótimos scripts! Estou adorando cada atualização!\" - Usuário A MIGU843",
	"\"Este canal realmente se supera, sempre trazendo o melhor!\" - Usuário OGHLAPO",
	"\"Nunca vi scripts tão bons e bem feitos!\" - Usuário BIANCA10KICA",
	"\"Incrível como conseguem manter a qualidade em cada script novo!\" - Usuário LEVI_AQUENAN",
	"\"Recomendo a todos que se inscrevam e acompanhem!\" - Usuário RIP_RARO",
        "\"Ótimos scripts! Estou adorando cada atualização!\" - TheGamerX",
	"\"Este canal realmente se supera, sempre trazendo o melhor!\" - MasterBuilder123",
	"\"Nunca vi scripts tão bons e bem feitos!\" - CoolRobloxian",
	"\"Incrível como conseguem manter a qualidade em cada script novo!\" - ProScripter",
	"\"Recomendo a todos que se inscrevam e acompanhem!\" - BuildNPlay",
	"\"Melhor canal de scripts que já encontrei!\" - SpeedyCoder",
	"\"Os scripts são muito fáceis de usar e sempre funcionam bem.\" - ScriptWizard",
	"\"Muito obrigado pelos conteúdos incríveis!\" - GamerGirl42",
	"\"Sempre fico ansioso pelas novas atualizações!\" - NoobMaster69",
	"\"A comunidade é muito amigável e útil.\" - EpicPlayer98",
	"\"Nunca tive problemas com os scripts, são sempre de alta qualidade.\" - StarDeveloper",
	"\"Agradeço pelo excelente trabalho!\" - BuilderPro321",
	"\"Melhor lugar para encontrar scripts atualizados!\" - ScriptNinja21",
	"\"Recomendo demais, vale a pena se inscrever no canal!\" - TopBuilder55",
	"\"O suporte que recebo é sempre rápido e eficiente.\" - FastCoder99",
	"\"Scripts novos todos os dias, é incrível!\" - MegaGamer",
	"\"Muito satisfeito com os conteúdos do canal.\" - ProPlayer88",
	"\"Sempre inovando e trazendo novidades!\" - GameMaster34",
	"\"A qualidade dos scripts é impressionante.\" - CoderPro77",
        "\"+999 Players!\" - Usuários de Roblox"
}

for i = 1, #feedbacks do
	InfoTab:CreateLabel(feedbacks[i])
	wait(0.5)
end
