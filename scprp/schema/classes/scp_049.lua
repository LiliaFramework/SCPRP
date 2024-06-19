--- Attributes of the SCP-049 class.
-- @classes SCP-049
--- A list of the current fields in the class.
-- @realm shared
-- @table Configurations
-- @field name The name of the class | **string**
-- @field desc The description of the class | **string**
-- @field isDefault Whether the class is set as default | **boolean**
-- @field model The model of the class | **string**
-- @field health The health of the class | **number**
-- @field walkSpeed The walking speed of the class | **number**
-- @field runSpeed The running speed of the class | **number**
-- @field bloodcolor The blood color of the class | **number**
-- @field faction The faction of the class | **number**
-- @field OnSet A function that is called when the class is set | **function**
-- @field index The Unique ID of the class | **number**
CLASS.name = "SCP-049"
CLASS.desc = "A humanoid figure that resembles a 15-16th century European Plague Doctor, with a black robe and a white-beaked mask stands before you."
CLASS.isDefault = true
CLASS.model = ""
CLASS.health = 1000
CLASS.walkSpeed = 150
CLASS.runSpeed = 150
CLASS.bloodcolor = DONT_BLEED
CLASS.faction = FACTION_SCP
function CLASS:OnSet(client)
    client:Spawn()
    local character = client:getChar()
    character:setName("SCP-049, 'The Plague Doctor'")
    character:setDesc(self.desc)
    lia.chat.send(client, "mind", "You sense the presence of the peastilence within this realm.")
end

CLASS_SCP_049 = CLASS.index
