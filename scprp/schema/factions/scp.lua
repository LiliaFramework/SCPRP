--------------------------------------------------------------------------------------------------------
FACTION.name = "SCP's"
FACTION.desc = "Select your SCP."
FACTION.color = Color(68,68,68)
FACTION.isDefault = true
--------------------------------------------------------------------------------------------------------
function FACTION:OnCharCreated(client, character)
	character:setName("SCP" .. math.radom(11111, 99999)) 
end
--------------------------------------------------------------------------------------------------------
FACTION_SCP = FACTION.index
--------------------------------------------------------------------------------------------------------