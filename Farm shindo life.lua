-- Configurações iniciais
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Player = game.Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui", Player.PlayerGui)

-- Variáveis para o script e URL
local url = "https://raw.githubusercontent.com/Papai-mahoraga/Boneco34/main/Farm%20shindo%20life.lua"
local menuOpened = false

-- Criando a bolinha do menu
local button = Instance.new("TextButton", ScreenGui)
button.Size = UDim2.new(0, 50, 0, 50)
button.Position = UDim2.new(0, 10, 0, 10)
button.Text = "🥷 SL"
button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.BorderSizePixel = 0

-- Menu de farm
local farmMenu = Instance.new("Frame", ScreenGui)
farmMenu.Size = UDim2.new(0, 200, 0, 300)
farmMenu.Position = UDim2.new(0, 70, 0, 10)
farmMenu.Visible = false
farmMenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
farmMenu.BorderSizePixel = 0

-- Título do menu
local title = Instance.new("TextLabel", farmMenu)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "SL Farm"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

-- Função para reduzir os gráficos
local function reduceGraphics()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
end

-- Botão de farm
local startFarmButton = Instance.new("TextButton", farmMenu)
startFarmButton.Size = UDim2.new(1, -10, 0, 30)
startFarmButton.Position = UDim2.new(0, 5, 0, 50)
startFarmButton.Text = "Iniciar Auto-Farm"
startFarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
startFarmButton.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
startFarmButton.BorderSizePixel = 0

-- Função para fazer o farm
local function startFarm()
    reduceGraphics()
    -- Aqui carregamos o script diretamente do GitHub
    local scriptData = HttpService:GetAsync(url)
    loadstring(scriptData)()

    -- Logica de Teleporte para NPC (isso precisa ser configurado para NPCs específicos)
    -- Adapte para teleportar e fazer missão automaticamente
end

-- Alternar exibição do menu
button.MouseButton1Click:Connect(function()
    menuOpened = not menuOpened
    farmMenu.Visible = menuOpened
end)

-- Iniciar auto-farm quando o botão é pressionado
startFarmButton.MouseButton1Click:Connect(function()
    startFarm()
end)