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