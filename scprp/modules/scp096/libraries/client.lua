function MODULE:StartCommand(client, cmd)
    local weapon = client:GetActiveWeapon()
    if not IsValid(weapon) then return end
    if client:isSCP096() then
        local tb = weapon:GetTable()
        local dt = tb.dt
        if dt and dt.BecomeAggressive > 0 then
            if cmd:KeyDown(IN_WALK) then cmd:RemoveKey(IN_WALK) end
            if client:OnGround() and cmd:KeyDown(IN_DUCK) then cmd:RemoveKey(IN_DUCK) end
        elseif cmd:KeyDown(IN_JUMP) then
            cmd:RemoveKey(IN_JUMP)
        end
    end
end