--- Attributes of the FRecruit faction.
-- @factions FRecruit
--- A list of the current fields in the faction.
-- @realm shared
-- @table Configurations
-- @field name The name of the faction | **string**
-- @field desc The description of the faction | **string**
-- @field color The color representing the faction | **Color**
-- @field isDefault Whether the faction is set as default | **boolean**
-- @field index The Unique ID of the faction | **number**
FACTION.name = "Foundation Recruits"
FACTION.desc = "New recruits to the SCP Foundation. They are awaiting training and are not yet assigned to a specific department."
FACTION.color = Color(65, 65, 65)
FACTION.isDefault = true
-- Workshop ID for pack "2973533817"
FACTION.models = {"models/nostras/visitor/male_02_visitor.mdl", "models/nostras/visitor/male_04_visitor.mdl", "models/nostras/visitor/male_07_visitor.mdl", "models/nostras/visitor/male_08_visitor.mdl", "models/nostras/visitor/male_09_visitor.mdl"}
FACTION_FRECRUIT = FACTION.index
