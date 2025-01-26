local characterMeta = lia.meta.character
<<<<<<< HEAD




=======
--- Retrieves the clearance level of the character.
-- @realm shared
-- @treturn int The clearance level of the character.
>>>>>>> fa3e6fbb8815b716f99a2856212141398f3743e7
function characterMeta:GetClearance()
    return self:getData("clearance", 0)
end





function characterMeta:HasClearance(level)
    return self:GetClearance() >= level
end
