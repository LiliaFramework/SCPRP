include("shared.lua")
local mat = CreateMaterial("mg_scp096_heartbeat", "UnlitGeneric", {
    ["$basetexture"] = "sprites/light_glow02",
    ["$ignorez"] = 1,
    ["$additive"] = 1,
    ["$translucent"] = 1,
    ["$vertexcolor"] = 1,
    ["$vertexalpha"] = 1,
})

function SWEP:DrawHUD()
    local tb = self:GetTable()
    local dt = tb.dt
    if not dt then return end
    for _, client in ipairs(player.GetAll()) do
        if client == LocalPlayer() then continue end
        if client:HuntedBySCP096() then
            local chestPos = client:GetBonePosition(client:LookupBone("ValveBiped.Bip01_Spine1"))
            local pos = chestPos:ToScreen()
            surface.SetDrawColor(255, 0, 0, 255)
            surface.SetMaterial(mat)
            local size = 128
            surface.DrawTexturedRect(pos.x - size / 2, pos.y - size / 2, size, size)
        end
    end
end

SWEP.MoveToPos = Vector(0, 0, 5)
SWEP.LastMultiX = 0
SWEP.LastSysTime = 0
function SWEP:GetViewModelPosition(pos, ang)
    pos = pos - ang:Up() * 6
    local sys_time = SysTime()
    local multx
    local active = self:GetActive()
    if active then
        multx = self.LastMultiX == 1 and 1 or Lerp((sys_time - self.LastSysTime) * 15, self.LastMultiX, 1)
    else
        multx = self.LastMultiX == 0 and 0 or Lerp((sys_time - self.LastSysTime) * 15, self.LastMultiX, 0)
    end

    self.LastSysTime = sys_time
    if self.MoveToPos then
        local Offset = self.MoveToPos
        pos = pos + Offset.x * ang:Right() * multx
        pos = pos + Offset.y * ang:Forward() * multx
        pos = pos + Offset.z * ang:Up() * multx
        self.LastMultiX = multx
    end
    return pos, ang
end
