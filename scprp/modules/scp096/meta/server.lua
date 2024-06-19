local playerMeta = FindMetaTable("Player")
local WalkSpeed = lia.config.WalkSpeed
local RunSpeed = lia.config.RunSpeed
function playerMeta:ApplySpeed(amount, bool)
    self:SetWalkSpeed((bool and WalkSpeed * tonumber(amount)) or WalkSpeed)
    self:SetRunSpeed((bool and RunSpeed * tonumber(amount)) or RunSpeed)
end

function playerMeta:SCP096ApplySpawnSpeed()
    self:SetWalkSpeed(WalkSpeed * 0.5)
    self:SetRunSpeed(RunSpeed * 0.5)
end
