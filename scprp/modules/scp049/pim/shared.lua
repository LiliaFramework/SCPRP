PIM:AddOption("Sense Pestilence", {
    runServer = false,
    shouldShow = function(client) if not client:isClass(CLASS_SCP_049) then return false end end,
    onRun = function(client, target)
        client:setAction("You begin to examine the being before you...", 10, function()
            local num = target:getAttrib("pestilence")
            lia.chat.send(client, "mind", num >= 50 and "You sense a large amount of the peastilence within this being." or "You sense no peastilence within this being")
        end)
    end
})

PIM:AddOption("Use a Medical Syringe", {
    runServer = false,
    shouldShow = function(client)
        local character = client:getChar()
        local inventory = character:getInv()
        local hasItem = inventory:hasItem("scp_49_bone_saw")
        if not client:isClass(CLASS_SCP_049) then return false end
        return hasItem
    end,
    onRun = function(client, target)
        local character = client:getChar()
        local inventory = character:getInv()
        local item = inventory:getFirstItemOfType("scp_49_syringe")
        lia.chat.send(client, "me", "pulls out a syringe and injects " .. target:Name() .. " with a viscous grey liquid.")
        lia.chat.send(target, "mind", "You feel a sharp pain as and begin to feel weak...")
        timer.Create(client:SteamID() .. "_049_infecting_" .. item.uniqueID, 5, 1, function()
            lia.chat.send(target, "me", "starts to cough up blood...")
            if math.random(1, 4) == 1 then
                lia.chat.send(target, "me", "starts to scratch at their skin... slowly turning pealing it off...")
                local hp = math.random(50, 200)
                target:getChar():SetModel(table.Random(item.zombieModels))
                target:SetHealth(hp)
                target:SetMaxHealth(hp)
            else
                lia.chat.send(target, "me", "Puts their hand to their heart clutching it in pain and falls to the ground...")
                timer.Simple(5, function()
                    if not IsValid(target) then return end
                    target:Kill()
                    lia.chat.send(target, "me", "Starts to twitch and convulse as their body starts to decompose into a grey mush...")
                end)

                timer.Create(client:SteamID() .. "_049_infecting_dead_" .. item.uniqueID, 10, 1, function()
                    if not IsValid(target) then return end
                    local ragdoll = ents.Create("prop_ragdoll")
                    ragdoll:SetModel(target:GetModel())
                    ragdoll:SetPos(target:GetPos())
                    ragdoll:SetAngles(target:GetAngles())
                    ragdoll:SetMaterial("models/flesh")
                    ragdoll:Spawn()
                    ragdoll:Activate()
                    target:Spawn()
                end)
            end

            item:Remove()
        end)
    end
})
