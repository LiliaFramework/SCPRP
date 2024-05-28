local playerMeta = FindMetaTable("Player")

function playerMeta:HasClearance(level)
	local character = self:getChar()
	if character then
		return character:GetClearance() >= level
	end
	return false
end