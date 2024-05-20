--[[--
    Schema configuration options.

    This is meant to define the Schema's default information.
]]
-- @configurations Schema

--- A list of schema fields that define the gamemode you are making.
-- These options are defined by the 'SCHEMA' table.
-- @realm shared
-- @table Configurations
-- @field name Controls the name of the schema | **string**
-- @field author Specifies the author of the schema | **string**
-- @field desc Defines the description of the schema | **string**
SCHEMA.name = "SCPRP"
SCHEMA.author = "Sample Schema Author"
SCHEMA.desc = "A SCPRP Schema"

lia.chat.register("mind", {
	onChatAdd = function(_, text)
		chat.AddText(Color(115, 115, 115), "**\""..text.."\"")
	end,
	onCanHear = 1,
	prefix = {"/mind"},
	font = "liaChatFontItalics",
	filter = "actions",
	deadCanChat = true
})
