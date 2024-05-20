local PLAYER = FindMetaTable("Player")
local CHAR = lia.meta.character

function CHAR:GetClearance()
	return self:GetData("clearance", 0)
end

function CHAR:HasClearance(level)
	return self:GetClearance() >= level
end

function PLAYER:HasClearance(level)
	local char = self:getChar()
	if char then
		return char:GetClearance() >= level
	end
	return false
end