local playerMeta = FindMetaTable("Player")
<<<<<<< HEAD





=======
--- Checks if the player has the specified clearance level or higher.
-- @realm shared
-- @int level The clearance level to check against.
-- @treturn bool True if the player's character's clearance level is greater than or equal to the specified level, false otherwise.
>>>>>>> fa3e6fbb8815b716f99a2856212141398f3743e7
function playerMeta:HasClearance(level)
    local character = self:getChar()
    if character then return character:GetClearance() >= level end
    return false
end
