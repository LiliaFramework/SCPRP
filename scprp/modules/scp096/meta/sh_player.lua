


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
    --- Applies a speed modification to the player.
    -- @float amount The multiplier for the walk and run speed.
    -- @bool bool `true` to apply the speed modification, `false` to reset to default.
    -- @realm shared
    function playerMeta:ApplySpeed(amount, bool)
        self:SetWalkSpeed((bool and lia.config.WalkSpeed * tonumber(amount)) or lia.config.WalkSpeed)
        self:SetRunSpeed((bool and lia.config.RunSpeed * tonumber(amount)) or lia.config.RunSpeed)
    end

    --- Sets the player’s speed to a reduced value when SCP-096 is spawned.
    -- @realm shared
    function playerMeta:SCP096ApplySpawnSpeed()
        self:SetWalkSpeed(lia.config.WalkSpeed * 0.5)
        self:SetRunSpeed(lia.config.RunSpeed * 0.5)
    end
end
