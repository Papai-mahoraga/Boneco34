-- Configurações do script
local npcList = { -- Lista de NPCs para escolher
    ["NPC1"] = Vector3.new(100, 0, 200),
    ["NPC2"] = Vector3.new(300, 0, 400),
    ["NPC3"] = Vector3.new(500, 0, 600)
}

local farmRange = 10  -- Distância máxima para interação com o NPC
local autoFarmEnabled = false  -- Estado de auto-farm
local currentNPC = npcList["NPC1"]  -- NPC inicial

-- Função para checar a distância
function CheckDistance(targetPosition)
    local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    local distance = (playerPosition - targetPosition).magnitude
    return distance <= farmRange
end

-- Função para atacar NPC
function AttackNPC()
    if CheckDistance(currentNPC) then
        -- Ativar habilidades automaticamente (você pode substituir pelos comandos reais de habilidade)
        -- Exemplo de habilidade:
        print("Atacando NPC!")
        -- Adicione aqui os comandos para usar suas habilidades, ex: FireServer() para ataque
    else
        print("NPC fora de alcance.")
    end
end

-- Função para ativar a transformação (como pressionar Z)
function ActivateTransformation()
    -- Aqui você precisa ajustar conforme a lógica do jogo para ativar a transformação máxima
    print("Transformação ativada!")
    -- Exemplo de como ativar a transformação:
    -- game:GetService("ReplicatedStorage").Remotes.Transform:FireServer("Z")
end

-- Função para iniciar o auto-farm
function AutoFarm()
    while autoFarmEnabled do
        AttackNPC()
        wait(1)  -- Intervalo de 1 segundo entre tentativas de ataque
    end
end

-- Função para exibir o menu de seleção de NPC
function CreateGUI()
    local player = game.Players.LocalPlayer
    local screenGui = Instance.new("ScreenGui", player.PlayerGui)
    local frame = Instance.new("Frame", screenGui)
    frame.Size = UDim2.new(0, 200, 0, 100)
    frame.Position = UDim2.new(0, 20, 0, 20)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BackgroundTransparency = 0.5

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, 0, 0, 30)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.Text = "Escolha o NPC para Farmar"
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 14

    local npcDropdown = Instance.new("TextButton", frame)
    npcDropdown.Size = UDim2.new(1, 0, 0, 30)
    npcDropdown.Position = UDim2.new(0, 0, 0, 40)
    npcDropdown.Text = "NPC1"
    npcDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
    npcDropdown.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

    npcDropdown.MouseButton1Click:Connect(function()
        currentNPC = npcList["NPC1"]
        npcDropdown.Text = "NPC1 Selecionado"
        print("NPC1 selecionado para farmar.")
    end)

    -- Repetir o processo para os outros NPCs
    local npcDropdown2 = Instance.new("TextButton", frame)
    npcDropdown2.Size = UDim2.new(1, 0, 0, 30)
    npcDropdown2.Position = UDim2.new(0, 0, 0, 70)
    npcDropdown2.Text = "NPC2"
    npcDropdown2.TextColor3 = Color3.fromRGB(255, 255, 255)
    npcDropdown2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

    npcDropdown2.MouseButton1Click:Connect(function()
        currentNPC = npcList["NPC2"]
        npcDropdown2.Text = "NPC2 Selecionado"
        print("NPC2 selecionado para farmar.")
    end)

    -- Adicionar um botão para iniciar o farm
    local farmButton = Instance.new("TextButton", frame)
    farmButton.Size = UDim2.new(1, 0, 0, 30)
    farmButton.Position = UDim2.new(0, 0, 1, -40)
    farmButton.Text = "Iniciar Auto-Farm"
    farmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    farmButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

    farmButton.MouseButton1Click:Connect(function()
        if autoFarmEnabled then
            autoFarmEnabled = false
            farmButton.Text = "Iniciar Auto-Farm"
            print("Auto-Farm desativado.")
        else
            autoFarmEnabled = true
            farmButton.Text = "Parar Auto-Farm"
            print("Auto-Farm ativado.")
            AutoFarm()
        end
    end)
end

-- Função para ouvir a tecla 'Z' para ativar a transformação
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Z then
        ActivateTransformation()
    end
end)

-- Criar a interface do menu
CreateGUI()
