-- Função para criar a GUI
local function createGUI()
    -- Criar a GUI principal
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Frame principal para o botão "Farms" e a lista de farm
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 300, 0, 60)
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
    mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    mainFrame.Parent = screenGui

    -- Botão "Farms"
    local farmsButton = Instance.new("TextButton")
    farmsButton.Size = UDim2.new(1, 0, 1, 0)
    farmsButton.Text = "Farms"
    farmsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    farmsButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    farmsButton.Parent = mainFrame

    -- Frame da lista (oculta inicialmente)
    local listFrame = Instance.new("Frame")
    listFrame.Size = UDim2.new(1, 0, 0, 200)
    listFrame.Position = UDim2.new(0, 0, 1, 5)
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
    startButton.Position = UDim2.new(0, 10, 1, 10)
    startButton.Text = "Iniciar Auto-Farm"
    startButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    startButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    startButton.Visible = false
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

        -- Configuração da cor da borda
        if name == "Bosses" then
            -- Bordas listradas para Bosses
            local function setStripedBorder(button, color1, color2)
                local count = 0
                game:GetService("RunService").RenderStepped:Connect(function()
                    count = (count + 1) % 2
                    button.BorderColor3 = count == 0 and color1 or color2
                end)
            end
            setStripedBorder(button, Color3.fromRGB(255, 140, 0), Color3.fromRGB(255, 255, 0))
        else
            button.BorderColor3 = borderColor
        end

        button.Parent = scrollFrame
        return button
    end

    -- Adicionar as opções de farm na lista
    local farmOptions = {}
    table.insert(farmOptions, createFarmOption("Estrela Azul", "⭐", Color3.fromRGB(0, 0, 255), Color3.fromRGB(0, 0, 255), 0))
    table.insert(farmOptions, createFarmOption("Estrela Vermelha", "⭐", Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 0, 0), 50))
    table.insert(farmOptions, createFarmOption("Pergaminho Verde", "📜", Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 255, 0), 100))
    table.insert(farmOptions, createFarmOption("Bosses", "💀", Color3.fromRGB(255, 165, 0), Color3.fromRGB(0, 0, 0), 150))

    -- Função para selecionar/desselecionar as opções
    local selectedOptions = {}
    for _, button in pairs(farmOptions) do
        button.MouseButton1Click:Connect(function()
            if button.BackgroundColor3 == Color3.fromRGB(50, 50, 50) then
                button.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
                table.insert(selectedOptions, button.Text)
            else
                button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                for i = #selectedOptions, 1, -1 do
                    if selectedOptions[i] == button.Text then
                        table.remove(selectedOptions, i)
                    end
                end
            end
        end)
    end

    -- Função para iniciar o farm
    local function startFarming(selectedOptions)
        print("Iniciando Auto-Farm com as opções:")
        for _, option in ipairs(selectedOptions) do
            print(" - " .. option)
            -- Adicione aqui o código de farm específico para cada opção
        end
    end

    -- Mostrar/ocultar a lista e botão "Iniciar Auto-Farm"
    farmsButton.MouseButton1Click:Connect(function()
        listFrame.Visible = not listFrame.Visible
        startButton.Visible = listFrame.Visible
    end)

    -- Clique para iniciar o Auto-Farm
    startButton.MouseButton1Click:Connect(function()
        if #selectedOptions > 0 then
            startFarming(selectedOptions)
        else
            print("Nenhuma opção selecionada!")
        end
    end)
end

-- Criar a GUI
createGUI()