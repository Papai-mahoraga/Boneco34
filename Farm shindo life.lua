-- Função para criar a GUI
local function createGUI()
    -- Criar a GUI principal
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Frame principal para o menu de farm
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 300, 0, 150)
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
    mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    mainFrame.Visible = true
    mainFrame.Parent = screenGui

    -- Título "SL Farm"
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0, 30)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.Text = "SL Farm"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    titleLabel.Parent = mainFrame

    -- Botão de minimizar
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Size = UDim2.new(0, 30, 0, 30)
    minimizeButton.Position = UDim2.new(1, -35, 0, 5)
    minimizeButton.Text = "🥷🏻"
    minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    minimizeButton.Parent = mainFrame

    -- Frame da lista de opções (oculta inicialmente)
    local listFrame = Instance.new("Frame")
    listFrame.Size = UDim2.new(1, 0, 0, 200)
    listFrame.Position = UDim2.new(0, 0, 1, -40)
    listFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    listFrame.Visible = false
    listFrame.Parent = mainFrame

    -- ScrollFrame para as opções de farm
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 250)
    scrollFrame.ScrollBarThickness = 12
    scrollFrame.Parent = listFrame

    -- Botão "Iniciar Auto-Farm"
    local startButton = Instance.new("TextButton")
    startButton.Size = UDim2.new(1, -20, 0, 40)
    startButton.Position = UDim2.new(0, 10, 0, 70)
    startButton.Text = "Iniciar Auto-Farm"
    startButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    startButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    startButton.Parent = mainFrame

    -- Botão "Reduzir Gráficos"
    local reduceGraphicsButton = Instance.new("TextButton")
    reduceGraphicsButton.Size = UDim2.new(1, -20, 0, 40)
    reduceGraphicsButton.Position = UDim2.new(0, 10, 1, -40)
    reduceGraphicsButton.Text = "Reduzir Gráficos"
    reduceGraphicsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    reduceGraphicsButton.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
    reduceGraphicsButton.Parent = mainFrame

    -- Função para criar botões com bordas coloridas
    local function createFarmOption(name, emoji, color, borderColor, positionY)
        local button = Instance