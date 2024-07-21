--- Attributes of the SCP-682 class.
-- @classes SCP-682

--- A list of the current fields in the class.
-- @realm shared
-- @table Configurations
-- @field name The name of the class | **string**
-- @field desc The description of the class | **string**
-- @field isDefault Whether the class is set as default | **boolean**
-- @field model The model of the class | **string**
-- @field health The health of the class | **integer**
-- @field walkSpeed The walking speed of the class | **float**
-- @field runSpeed The running speed of the class | **float**
-- @field bloodcolor The blood color of the class | **integer**
-- @field faction The faction of the class | **integer**
-- @field index The Unique ID of the class | **integer**
CLASS.name = "SCP-682"
CLASS.desc = "A large, vaguely reptile-like creature of unknown origin. It appears to be extremely intelligent."
CLASS.isDefault = true
CLASS.model = ""
CLASS.health = 10000
CLASS.walkSpeed = 200
CLASS.runSpeed = 300
CLASS.bloodcolor = DONT_BLEED
CLASS.faction = FACTION_SCP

function CLASS:OnSet(client)
    client:Spawn()
    local character = client:getChar()
    character:setName("SCP-682, 'The Hard-To-Destroy Reptile'")
    character:setDesc(self.desc)
    lia.chat.send(client, "mind", "Your hatred for all life is overwhelming. You must destroy all life forms.")
end

CLASS_SCP_682 = CLASS.index
