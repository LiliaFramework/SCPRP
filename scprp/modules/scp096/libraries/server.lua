local function PlayerIsLookingAtHead(client, target)
    if not (IsValid(target) or IsValid(target:GetActiveWeapon())) then return end
    if target:isSCP096() then
        if not target:GetNWBool("freaking_out", false) then
            target:SetNWBool("freaking_out", true)
            target:EmitSound("scp096/freak.wav")
            net.Start("SCP096_DrawRedScreen")
            net.WriteBool(true)
            net.Send(target)
            timer.Simple(8, function()
                target:SetNWBool("freaking_out", false)
                client:SetNWBool("spotted_096", true)
            end)

            target:GetActiveWeapon():SetBecomeAggressive(CurTime() + 8)
        else
            client:SetNWBool("spotted_096", true)
        end
    end
end

function MODULE:PlayerDeath(victim, _, attacker)
    if attacker:IsWorld() then return end
    if attacker:isSCP096() and victim:GetNWBool("spotted_096", false) then
        victim:SetNWBool("spotted_096", false)
        attacker:GetActiveWeapon():SetActive(false)
    end

    if victim:isSCP096() then
        for _, client in ipairs(player.GetAll()) do
            client:SetNWBool("spotted_096", false)
        end

        attacker:SCP096ApplySpawnSpeed()
        net.Start("SCP096_DrawRedScreen")
        net.WriteBool(false)
        net.Send(attacker)
    end
end

function MODULE:Think()
    for _, client in ipairs(player.GetAll()) do
        local trace = util.TraceLine({
            start = client:GetShootPos(),
            endpos = client:GetShootPos() + client:GetAimVector() * 100,
            filter = client
        })

        if client:Alive() and trace.Entity and trace.Entity:IsPlayer() and trace.HitGroup == HITGROUP_HEAD and client ~= trace.Entity then PlayerIsLookingAtHead(client, trace.Entity) end
    end
end

timer.Create("checkscp096", 15, 0, function()
    local SCP096Exists = false
    for _, client in ipairs(player.GetAll()) do
        if client:isSCP096() then SCP096Exists = true end
    end

    if SCP096Exists then
        net.Start("SCP096_Heartbeat")
        net.Broadcast()
    end
end)
