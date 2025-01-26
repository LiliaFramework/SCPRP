local characterMeta = lia.meta.character
function characterMeta:GetClearance()
    return self:getData("clearance", 0)
end

function characterMeta:HasClearance(level)
    return self:GetClearance() >= level
end
