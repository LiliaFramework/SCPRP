ITEM.name = "Medical Syringe"
ITEM.desc = "A small medical syringe, containing a viscous grey liquid."
ITEM.model = "models/items/crossbowrounds.mdl"

ITEM.zombieModels = {
	"models/Zombie/Poison.mdl",
	"models/Zombie/Fast.mdl",
	"models/Zombie/Classic.mdl"
}

ITEM.functions.use = {
    name = "Use",
    sound = "items/medshot4.wav",
    onRun = function(item)
        local client = item.player
        local target = client:GetEyeTrace().Entity
        if not (target:Alive() or IsValid(target) and target:IsPlayer()) then
            client:notify("Target not valid! You must be looking at it!")
            return
        end
		lia.chat.send(client, "me", "pulls out a syringe and injects " .. target:Name() .. " with a viscous grey liquid.")
		lia.chat.send(target, "mind", "You feel a sharp pain as and begin to feel weak...")

        timer.Create(
            client:SteamID() .. "_049_infecting_" .. item.uniqueID,
            5,
            1,
            function()
                if not IsValid(client) then return end
                if not IsValid(target) then return end

				lia.chat.send(target, "me", "starts to cough up blood...")

                if math.random(1,4) == 1 then
					lia.chat.send(target, "me", "starts to scratch at their skin... slowly turning pealing it off...")

					local hp = math.random(50, 200)
					target:getChar():SetModel(table.Random(item.zombieModels))
					target:SetHealth(hp)
					target:SetMaxHealth(hp)
                else
					lia.chat.send(target, "me", "Puts their hand to their heart clutching it in pain and falls to the ground...")
                    timer.Simple(
                        5,
                        function()
                            if not IsValid(target) then return end
                            target:Kill()
							lia.chat.send(target, "me", "Starts to twitch and convulse as their body starts to decompose into a grey mush...")
                        end
                    )
                    timer.Create(
                        client:SteamID() .. "_049_infec_dead_" .. item.uniqueID,
                        10,
                        1,
                        function()
                            if not IsValid(target) then return end

                            local ragdoll = ents.Create("prop_ragdoll")
                            ragdoll:SetModel(target:GetModel())
                            ragdoll:SetPos(target:GetPos())
                            ragdoll:SetAngles(target:GetAngles())
                            ragdoll:SetMaterial("models/flesh")
                            ragdoll:Spawn()
                            ragdoll:Activate()
                            target:Spawn()
                        end
                    )
                end
            end
        )
    end,
    onCanRun = function(item) return not IsValid(item.entity) end
}