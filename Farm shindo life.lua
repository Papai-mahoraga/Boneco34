-- Função para criar a GUI
local function createGUI()
    -- Criar o frame da GUI
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Frame principal
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 300, 0, 400)
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
    mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    mainFrame.Parent = screenGui

    -- Título da GUI
    local title = Instance.new("TextLabel")
    title.Text = "Seleção de Farm"
    title.Size = UDim2.new(1, 0, 0, 30)
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    title.Parent = mainFrame

    -- Scrollable Frame
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, 0, 1, -40)
    scrollFrame.Position = UDim2.new(0, 0, 0, 40)
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 1000)
    scrollFrame.ScrollBarThickness = 12
    scrollFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    scrollFrame.Parent = mainFrame

    -- Função para criar botões de seleção
    local function createToggleButton(name, positionY)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, -20, 0, 30)
        button.Position = UDim2.new(0, 10, 0, positionY)
        button.Text = name
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        button.Parent = scrollFrame
        return button
    end

    -- Criar os botões
    local farmOptions = {}
    table.insert(farmOptions, createToggleButton("Estrela Azul", 0))
    table.insert(farmOptions, createToggleButton("Estrela Vermelha", 40))
    table.insert(farmOptions, createToggleButton("Pergaminho Verde", 80))
    table.insert(farmOptions, createToggleButton("Bosses", 120))

    -- Retorna os botões criados
    return farmOptions
end

-- Função para pegar automaticamente os drops
local function autoPickUpDrops()
    game:GetService("RunService").Heartbeat:Connect(function()
        for _, v in pairs(workspace:GetChildren()) do
            if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
                local humanoid = v:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid.Health <= 0 then
                    -- Verifica se o item é um drop de boss e pega automaticamente
                    for _, drop in pairs(v:GetChildren()) do
                        if drop:IsA("Part") and drop.Name == "Drop" then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = drop.CFrame
                            fireclickdetector(drop:FindFirstChildOfClass("ClickDetector"))
                        end
                    end
                end
            end
        end
    end)
end

-- Função para começar o farm
local function startFarming(farmOptions)
    -- Ativar auto-pickup
    autoPickUpDrops()

    -- Iniciar farm dependendo da seleção
    for _, button in pairs(farmOptions) do
        button.MouseButton1Click:Connect(function()
            local selectedOption = button.Text
            if selectedOption == "Estrela Azul" then
                -- Código para farmar Estrela Azul
                print("Fazendo farm de Estrela Azul...")
            elseif selectedOption == "Estrela Vermelha" then
                -- Código para farmar Estrela Vermelha
                print("Fazendo farm de Estrela Vermelha...")
            elseif selectedOption == "Pergaminho Verde" then
                -- Código para farmar Pergaminho Verde
                print("Fazendo farm de Pergaminho Verde...")
            elseif selectedOption == "Bosses" then
                -- Código para farmar Bosses
                print("Fazendo farm de Bosses...")
            end
        end)
    end
end

-- Criar a GUI e iniciar o farm
local farmOptions = createGUI()
startFarming(farmOptions)