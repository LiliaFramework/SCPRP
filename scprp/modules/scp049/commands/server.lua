lia.command.add("sensepestilence", {
    onRun = function(client, _)
        if not client:isFaction(CLASS_SCP_049) then
            client:notify("You are not SCP-049, you cannot sense the peastilence.")
            return
        end

        local target = client:GetEyeTrace().Entity
        if not target:IsPlayer() then return end
        client:setAction("You begin to examine the being before you...", 10, function()
            local num = target:getAttrib("pestilence")
            if num >= 50 then
                lia.chat.send(client, "mind", "You sense a large amount of the peastilence within this being.")
            else
                lia.chat.send(client, "mind", "You sense no peastilence within this being")
            end
        end)
    end
})