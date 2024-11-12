-- Função para criar a GUI
local function createGUI()
    -- Criar a GUI principal
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Frame principal para o menu de farm (começa invisível)
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 300, 0, 200)
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
    mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    mainFrame.Visible = false
    mainFrame.Parent = screenGui

    -- Título "SL Farm"
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0, 30)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.Text = "SL Farm"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    titleLabel.Parent = mainFrame

    -- Botão de minimizar / abrir o menu (SL)
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Size = UDim2.new(0, 50, 0, 50)
    minimizeButton.Position = UDim2.new(0, 10, 0, 10)
    minimizeButton.Text = "SL"
    minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    minimizeButton.Parent = screenGui

    -- Frame da lista de opções de farm
    local listFrame = Instance.new("Frame")
    listFrame.Size = UDim2.new(1, 0, 1, -30)
    listFrame.Position = UDim2.new(0, 0, 0, 30)
    listFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
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
    startButton.Position = UDim2.new(0, 10, 1, -50)
    startButton.Text = "Iniciar Auto-Farm"
    startButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    startButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    startButton.Parent = mainFrame

    -- Função para criar botões com bordas coloridas
    local function createFarmOption(name, emoji, color, borderColor, positionY)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, -20, 0, 40)
        button.Position = UDim2.new(0, 10, 0, positionY)
        button.Text = emoji .. " " .. name
        button.TextColor3 = color
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.BorderSizePixel = 3
        button.BorderColor3 = borderColor
        button.Parent = scrollFrame
        return button
    end

    -- Adicionar as opções de farm na lista
    local farmOptions = {}
    table.insert(farmOptions, createFarmOption("Estrela Azul", "⭐", Color3.fromRGB(0, 0, 255), Color3.fromRGB(0, 0, 255), 0))
    table.insert(farmOptions, createFarmOption("Estrela Vermelha", "⭐", Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 0, 0), 50))
    table.insert(farmOptions, createFarmOption("Pergaminho Verde", "📜", Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 255, 0), 100))
    table.insert(farmOptions, createFarmOption("Bosses", "💀", Color3.fromRGB(255, 165, 0), Color3.fromRGB(255, 140, 0), 150))

    -- Função para iniciar o farm automático
    local function startFarming(selectedOptions)
        print("Iniciando Auto-Farm com as opções selecionadas:")
        for _, option in ipairs(selectedOptions) do
            print(" - " .. option)
            -- Código específico para cada tipo de farm
            if option == "Estrela Azul" then
                -- Código para aceitar e completar missões de Estrela Azul
            elseif option == "Estrela Vermelha" then
                -- Código para aceitar e completar missões de Estrela Vermelha
            elseif option == "Pergaminho Verde" then
                -- Código para aceitar e completar missões de Pergaminho Verde
            elseif option == "Bosses" then
                -- Código para aceitar e completar missões de Bosses
            end
        end
    end

    -- Clique para iniciar o Auto-Farm
    startButton.MouseButton1Click:Connect(function()
        local selectedOptions = {}
        for _, button in ipairs(farmOptions) do
            if button.BackgroundColor3 == Color3.fromRGB(0, 200, 0) then
                table.insert(selectedOptions, button.Text)
            end
        end
        if #selectedOptions > 0 then
            startFarming(selectedOptions)
        else
            print("Nenhuma opção selecionada!")
        end
    end)

    -- Função de alternância do menu (Minimizar e expandir)
    local isMinimized = true
    minimizeButton.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        mainFrame.Visible = not isMinimized
    end)
end

-- Criar a GUI
createGUI()