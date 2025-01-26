










FACTION.name = "SCP's"
FACTION.desc = "Select your SCP."
FACTION.color = Color(68, 68, 68)
FACTION.isDefault = true
function FACTION:GetDefaultName(_)
    return "SCP" .. math.random(11111, 99999)
end

function FACTION:GetDefaultDesc(_, _)
    return "A Character that is used to play as an SCP."
end

FACTION_SCP = FACTION.index
