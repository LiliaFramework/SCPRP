--- Attributes of the SCP faction.
-- @faction SCP

--- A list of the current fields in the faction.
-- @realm shared
-- @table Configurations
-- @field name The name of the faction | **string**
-- @field desc The description of the faction | **string**
-- @field color The color representing the faction | **Color**
-- @field isDefault Whether the faction is set as default | **boolean**
-- @field index The Unique ID of the faction | **number**
-- @field GetDefaultName A function that returns the default name of the faction | **function**
-- @field GetDefaultDesc A function that returns the default description of the faction | **function**
FACTION.name = "SCP's"
FACTION.desc = "Select your SCP."
FACTION.color = Color(68,68,68)
FACTION.isDefault = true

function FACTION:GetDefaultName(_)
	return "SCP" .. math.radom(11111, 99999)
end

function FACTION:GetDefaultDesc(_, _)
	return "A Character that is used to play as an SCP."
end

FACTION_SCP = FACTION.index
