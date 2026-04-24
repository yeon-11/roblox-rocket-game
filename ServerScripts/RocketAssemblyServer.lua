local craftedParts = {}

local function pickupPart(part)
    table.insert(craftedParts, part)
    print(part .. " has been picked up!")
end

local function installParts()
    if #craftedParts == 0 then
        print("No crafted parts to install!")
        return
    end
    for _, part in ipairs(craftedParts) do
        -- Installation logic goes here
        print(part .. " has been installed!")
    end
    craftedParts = {} -- Clear the list after installation
end

return {
    pickupPart = pickupPart,
    installParts = installParts
}