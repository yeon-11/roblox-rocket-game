-- InventoryUI.lua

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer

-- Create a ScreenGui for the inventory UI
local screenGui = Instance.new("ScreenGui")
local inventoryFrame = Instance.new("Frame")

screenGui.Name = "InventoryUI"

-- Set up the inventory frame
inventoryFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
inventoryFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
inventoryFrame.BackgroundColor3 = Color3.new(0, 0, 0)

local inventoryTitle = Instance.new("TextLabel", inventoryFrame)

inventoryTitle.Text = "Inventory"
inventoryTitle.Size = UDim2.new(1, 0, 0, 50)
inventoryTitle.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)

-- Create a list for the inventory
local inventoryList = Instance.new("ScrollingFrame", inventoryFrame)

inventoryList.Size = UDim2.new(1, 0, 0, 400)
inventoryList.Position = UDim2.new(0, 0, 0, 50)
inventoryList.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)

-- Function to update UI with player's inventory
local function updateInventoryUI()
    inventoryList:ClearAllChildren()
    local playerInventory = ReplicatedStorage:WaitForChild("Inventory"):WaitForChild(Player.UserId)

    for _, item in ipairs(playerInventory:GetChildren()) do
        local itemLabel = Instance.new("TextLabel")
        itemLabel.Text = item.Name
        itemLabel.Size = UDim2.new(1, 0, 0, 50)
        itemLabel.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
        itemLabel.Parent = inventoryList
    end
end

-- Connect function to when the inventory updates
ReplicatedStorage:WaitForChild("InventoryUpdate").OnClientEvent:Connect(updateInventoryUI)

-- Initialize the UI by updating the inventory
updateInventoryUI()

-- Make sure the GUI is visible
screenGui.Parent = Player:WaitForChild("PlayerGui")
