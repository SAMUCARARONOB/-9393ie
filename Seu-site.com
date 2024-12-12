local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()
getgenv().SecureMode = true

local Window = Rayfield:CreateWindow({
	Name = "Acesso LINK Canal",
	LoadingTitle = "OP-SCRIPTS Acesso Link",
	LoadingSubtitle = "",
})

local Tab = Window:CreateTab("Link Acesso OP-SCRIPTS Canal Escreve-se", 4483362458)
local SubscribeLabel = Tab:CreateLabel("Escreve-se", 6031280882)

local initialLink = "https://www.youtube.com/@XROBLOSCRIPTS"
local linkCopied = false

-- Script dos segundos
for i = 1, 5 do
	Tab:CreateLabel(i .. " Seconds")
	wait(0.25)
end

-- Script do botão
local CopyButton = Tab:CreateButton({
	Name = "LINK CANAL ACESSO OP-SCRIPTS",
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
			"Junte-se à nossa comunidade!",
			"Compartilhe com seus amigos!",
			"Se Inscreva"
		}

		for i = 1, #phrases do
			Tab:CreateLabel(phrases[i])
			wait(0.2)
		end

		wait(1)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/SAMUCARARONOB/92929923837373-/refs/heads/main/OPENKEYSMLCST"))()
		print("Script executado.")
	end,
})

-- Nova aba com informações positivas
local InfoTab = Window:CreateTab("Information Canal", 4483362458)

local positiveTexts = {
	"Atualizo meu script todos os dias!",
	"Novas funções são adicionadas constantemente.",
	"Receba as últimas novidades sempre!",
	"Scripts mais avançados disponíveis aqui.",
	"Se inscreva para não perder nenhuma atualização!",
	"Os melhores scripts estão aqui.",
	"Deixe seu like e comentário para ajudar o canal!",
	"Obrigado por ser parte da nossa comunidade!",
	"Ative o sininho para notificações instantâneas.",
	"Compartilhe o canal com seus amigos e ajude a crescer!",
	"Agradecemos pelo seu apoio constante!",
	"Junte-se a nós para as melhores experiências em scripts.",
	"Sua satisfação é nossa prioridade!",
	"Contribua com suas sugestões nos comentários.",
	"Estamos sempre melhorando para você.",
	"Nosso canal é atualizado diariamente!",
	"Scripts exclusivos para os inscritos do canal.",
	"Obrigado por assistir e apoiar nosso trabalho!",
	"E muito mais...",
	"Não perca nenhum dos nossos vídeos!",
	"Todo dia tem novidade!",
	"O melhor conteúdo para você!",
	"Conteúdos exclusivos para inscritos.",
	"Compartilhe e ajude nosso canal a crescer!",
	"Ajudamos você a encontrar os melhores scripts!",
	"Agradecemos a todos que nos acompanham!",
	"Participe das nossas discussões e enquetes!",
	"A sua opinião é muito importante para nós!",
	"Estamos sempre inovando!"
}
-- Adicionar ícones nos textos para dar um charme especial
for i = 1, #positiveTexts do
	InfoTab:CreateLabel("📌 " .. positiveTexts[i])
	wait(0.25)
end
