











FACTION.name = "Class-D Personnel"
FACTION.desc = "Inmates held in Sector D of the facility. They are used for testing and are expendable."
FACTION.color = Color(255, 140, 0)
FACTION.isDefault = true
FACTION.models = {"models/player/cheddar/class_d/class_d_art.mdl", "models/player/cheddar/class_d/class_d_erdim.mdl", "models/player/cheddar/class_d/class_d_eric.mdl", "models/player/cheddar/class_d/class_d_joe.mdl", "models/player/cheddar/class_d/class_d_mike.mdl", "models/player/cheddar/class_d/class_d_sandro.mdl", "models/player/cheddar/class_d/class_d_ted.mdl", "models/player/cheddar/class_d/class_d_van.mdl", "models/player/cheddar/class_d/class_d_vance.mdl"}
function FACTION:OnCharCreated(_, character)
    local name = character:getName()
    character:setName("D-" .. math.random(1111, 9999) .. " " .. name)
end

FACTION_CLASSD = FACTION.index
