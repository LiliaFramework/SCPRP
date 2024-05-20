function SCHEMA:PlayerSwitchFlashlight(_)
	return true
end

function lia.scp.getSCPClasses()
	local classes = {}
	for _, v in pairs(lia.class.classes) do
		if v.faction == FACTION_SCP then
			table.insert(classes, v)
		end
	end
	return classes
end

