local blood_eff = {
    ["$pp_colour_addr"] = 0,
    ["$pp_colour_addg"] = 0,
    ["$pp_colour_addb"] = 0,
    ["$pp_colour_brightness"] = 0,
    ["$pp_colour_contrast"] = 1,
    ["$pp_colour_colour"] = 1,
    ["$pp_colour_mulr"] = 0,
    ["$pp_colour_mulg"] = 0,
    ["$pp_colour_mulb"] = 0
}

local function DrawBloodScreen()
    local wep = LocalPlayer():GetActiveWeapon()
    if not wep.SCP096 then
        hook.Remove("RenderScreenspaceEffects", "SCP096_DrawRedScreen")
        return
    end

    blood_eff["$pp_colour_addr"] = 0.5 * math.abs(math.sin(CurTime() * 6)) * 0.2
    DrawColorModify(blood_eff)
end

net.Receive("SCP096_DrawRedScreen", function()
    local bool = net.ReadBool()
    if not bool then
        hook.Remove("RenderScreenspaceEffects", "SCP096_DrawRedScreen")
    else
        hook.Add("RenderScreenspaceEffects", "SCP096_DrawRedScreen", DrawBloodScreen)
    end
end)

net.Receive("SCP096_Heartbeat", function()
    for _, client in ipairs(player.GetAll()) do
        if not (IsValid(client) or client:HuntedBySCP096()) then continue end
        client:EmitSound("scp096/heartbeat.mp3")
    end
end)

net.Receive("SCP096_PlaySound", function() surface.PlaySound(net.ReadString()) end)