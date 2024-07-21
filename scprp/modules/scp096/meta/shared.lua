-- @--- Meta Tables for SCP-096.
-- @modmeta SCP-096

local playerMeta = FindMetaTable("Player")

function playerMeta:HuntedBySCP096()
    return self:GetNWBool("spotted_096", false)
end

function playerMeta:isSCP096()
    local weapon = self:GetActiveWeapon()
    if not IsValid(weapon) then return false end
    return self:isClass(CLASS_SCP_096) and weapon:GetClass() == "weapon_scp096"
end

if SERVER then
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
end