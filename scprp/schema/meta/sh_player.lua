local playerMeta = FindMetaTable("Player")

--- Checks if the player has the specified clearance level or higher.
-- @realm shared
-- @int level The clearance level to check against.
-- @treturn bool True if the player's character's clearance level is greater than or equal to the specified level, false otherwise.
function playerMeta:HasClearance(level)
    local character = self:getChar()
    if character then return character:GetClearance() >= level end
    return false
end
