--- Server-side library functions.
-- reside within 'lia'


function SCHEMA:PlayerSwitchFlashlight(_)
	return true
end

-- This function is used to get all the classes that belong to the SCP faction.
-- @return table A table of all the SCP classes.
-- @realm server
function lia.scp.getSCPClasses()
	local classes = {}
	for _, v in pairs(lia.class.classes) do
		if v.faction == FACTION_SCP then
			table.insert(classes, v)
		end
	end
	return classes
end
