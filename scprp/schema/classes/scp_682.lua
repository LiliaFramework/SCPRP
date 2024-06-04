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