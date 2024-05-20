--------------------------------------------------------------------------------------------------------
CLASS.name = "SCP-049"
CLASS.desc = "A humanoid figure that resembles a 15-16th century European Plague Doctor, with a black robe and a white-beaked mask stands before you."
CLASS.isDefault = true
CLASS.model = ""
CLASS.health = 1000
CLASS.bloodcolor = DONT_BLEED
CLASS.faction = FACTION_SCP
--------------------------------------------------------------------------------------------------------
function CLASS:OnSet(client)
	client:Spawn()
	local char = client:getChar()
	char:setName("SCP-049, 'The Plague Doctor'")
	char:setDesc(self.desc)
	lia.chat.send(client, "mind", "You sense the presence of the peastilence within this realm.")
end
--------------------------------------------------------------------------------------------------------
CLASS_SCP_049 = CLASS.index
--------------------------------------------------------------------------------------------------------