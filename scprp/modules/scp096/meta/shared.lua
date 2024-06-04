local playerMeta = FindMetaTable("Player")
function playerMeta:HuntedBySCP096()
    return self:GetNWBool("spotted_096", false)
end

function playerMeta:isSCP096()
    local weapon = self:GetActiveWeapon()
    if not IsValid(weapon) then return false end
    return self:isClass(CLASS_SCP_096) and weapon:GetClass() == "weapon_scp096"
end