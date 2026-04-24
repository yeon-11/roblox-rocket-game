-- CraftingUI.lua

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local craftingUI = playerGui:WaitForChild("CraftingUI")

local function openCraftingInterface()
    craftingUI.Visible = true
end

local function closeCraftingInterface()
    craftingUI.Visible = false
end

local function onCraftButtonClicked(itemToCraft)
    local success = ReplicatedStorage.CraftItem:InvokeServer(itemToCraft)
    if success then
        print("Crafting successful: " .. itemToCraft)
        closeCraftingInterface()
    else
        print("Crafting failed: insufficient materials.")
    end
end

-- Connect UI elements to functions
craftingUI.OpenButton.MouseButton1Click:Connect(openCraftingInterface)
craftingUI.CloseButton.MouseButton1Click:Connect(closeCraftingInterface)

for _, button in ipairs(craftingUI.CraftButtons:GetChildren()) do
    if button:IsA("TextButton") then
        button.MouseButton1Click:Connect(function()
            onCraftButtonClicked(button.Name)
        end)
    end
end

-- Initial setup
displayCraftingItems()