-- MapGenerator.lua

local function generateMap(size)
    local map = {}
    for x = 1, size do
        map[x] = {}
        for y = 1, size do
            map[x][y] = math.random(1, 3) -- Randomly place 1, 2, or 3
        end
    end
    return map
end

return {
    generateMap = generateMap
}