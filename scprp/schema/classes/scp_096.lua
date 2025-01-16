--- Attributes of the SCP-096 class.
-- @classes SCP-096
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
-- @field weapons The weapons assigned to the class | **table**
-- @field index The Unique ID of the class | **integer**
CLASS.name = "SCP-096"
CLASS.desc = "A emaciated, nude, pale-skinned, and anorexic humanoid."
CLASS.isDefault = true
CLASS.model = ""
CLASS.health = 10000
CLASS.walkSpeed = 200
CLASS.runSpeed = 300
CLASS.bloodcolor = DONT_BLEED
CLASS.faction = FACTION_SCP
CLASS.weapons = {"weapon_scp096"}
function CLASS:OnSet(client)
    local character = client:getChar()
    character:setName("SCP-096, 'The Shy Guy'")
    character:setDesc(self.desc)
    client:Spawn()
    client:StripWeapons()
    client:SCP096ApplySpawnSpeed()
end

CLASS_SCP_096 = CLASS.index
