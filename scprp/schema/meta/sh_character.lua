local characterMeta = lia.meta.character
--- Retrieves the clearance level of the character.
-- @realm shared
-- @treturn int The clearance level of the character.
function characterMeta:GetClearance()
    return self:getData("clearance", 0)
end

--- Checks if the character has the specified clearance level or higher.
-- @realm shared
-- @int level The clearance level to check against.
-- @treturn bool True if the character's clearance level is greater than or equal to the specified level, false otherwise.
function characterMeta:HasClearance(level)
    return self:GetClearance() >= level
end
