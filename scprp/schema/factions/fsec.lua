--- Attributes of the Foundation Security faction.
-- @factions FSecurity

--- A list of the current fields in the faction.
-- @realm shared
-- @table Configurations
-- @field name The name of the faction | **string**
-- @field desc The description of the faction | **string**
-- @field color The color representing the faction | **Color**
-- @field isDefault Whether the faction is set as default | **boolean**
-- @field models The models that the faction can use | **table**
-- @field index The Unique ID of the faction | **number**

FACTION.name = "Foundation Security Guard"
FACTION.desc = "Security guards of the SCP Foundation. They are tasked with maintaining order and security within the facility."
FACTION.color = Color(37,108,190)
FACTION.isDefault = false
-- Workshop ID for pack "2731177638"
FACTION.models = {
	"models/player/xuvon/xuvon_ss_re_base.mdl"
}

FACTION_SGUARD = FACTION.index
