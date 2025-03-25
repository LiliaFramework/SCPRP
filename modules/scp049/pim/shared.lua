PIM:AddOption("Sense Pestilence", {
    runServer = false,
    shouldShow = function(client) return client:isClass(CLASS_SCP_049) end,
    onRun = function(client, target)
        client:setAction("You begin to examine the being before you...", 10, function()
            local pestilence = target:getAttrib("pestilence") or 0
            local msg = pestilence >= 50 and "You sense a large amount of pestilence within this being." or "You sense no pestilence within this being."
            lia.chat.send(client, "mind", msg)
        end)
    end
})

PIM:AddOption("Use Medical Syringe", {
    runServer = false,
    shouldShow = function(client)
        if not client:isClass(CLASS_SCP_049) then return false end
        return client:getChar():getInv():hasItem("scp_49_syringe")
    end,
    onRun = function(client, target)
        local inv = client:getChar():getInv()
        local item = inv:getFirstItemOfType("scp_49_syringe")
        if not item then return end
        lia.chat.send(client, "me", ("pulls out a syringe and injects %s with a viscous grey liquid."):format(target:Name()))
        lia.chat.send(target, "mind", "You feel a sharp pain and begin to feel weak...")
        local id = client:SteamID() .. "_049_infecting_" .. item.uniqueID
        timer.Create(id, 5, 1, function()
            if not IsValid(target) then return end
            lia.chat.send(target, "me", "starts to cough up blood...")
            if math.random(4) == 1 then
                lia.chat.send(target, "me", "scratches at their skin, slowly peeling it off...")
                local hp = math.random(50, 200)
                target:getChar():SetModel(table.Random(item.zombieModels))
                target:SetMaxHealth(hp)
                target:SetHealth(hp)
            else
                lia.chat.send(target, "me", "clutches their chest in pain and collapses.")
                timer.Simple(5, function()
                    if not IsValid(target) then return end
                    target:Kill()
                    lia.chat.send(target, "me", "twitches and convulses as their body decomposes into grey mush...")
                end)

                timer.Create(id .. "_dead", 10, 1, function()
                    if not IsValid(target) then return end
                    local ragdoll = ents.Create("prop_ragdoll")
                    ragdoll:SetModel(target:GetModel())
                    ragdoll:SetPos(target:GetPos())
                    ragdoll:SetAngles(target:GetAngles())
                    ragdoll:SetMaterial("models/flesh")
                    ragdoll:Spawn()
                    target:Spawn()
                end)
            end

            item:Remove()
        end)
    end
})