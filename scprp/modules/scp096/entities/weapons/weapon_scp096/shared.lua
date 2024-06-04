SWEP.PrintName = "SCP-096"
SWEP.ViewModelFOV = 56
SWEP.ViewModel = Model("models/weapons/v_arms_scp096.mdl")
SWEP.WorldModel = "models/gibs/hgibs.mdl"
SWEP.DrawWeaponInfoBox = true
SWEP.Instructions = "Left click to Attack."
SWEP.Author = "rt"
SWEP.Spawnable = true
SWEP.Primary.Damage = 80
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Delay = 0.6
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.Automatic = false
SWEP.Secondary.Delay = 2
SWEP.Slot = 0
SWEP.SlotPos = 40
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.SCP096 = true
SWEP.SpeedMultAdd = 1.9
SWEP.HitRange = 100
local reg = debug.getregistry()
local GetTable = reg.Entity.GetTable
function SWEP:SetupDataTables()
    self:NetworkVar("Bool", 0, "Active")
    self:NetworkVar("Float", 0, "BecomeAggressive")
end

function SWEP:Initialize()
    self:SetDeploySpeed(1)
    self:SetHoldType("melee")
    self:DrawShadow(false)
end

function SWEP:Deploy()
    return true
end

function SWEP:Holster(weapon)
    if not weapon:IsValid() then return true end
    return false
end

function SWEP:StartSounds(typ)
    self:StopSounds()
    local t = typ == 3 and "scp_096_freak" or typ == 2 and "scp_096_scream" or typ == 1 and "scp_096_cry" or "scp_096_cry"
    local client = self:GetOwner()
    client.SCP096_Sound = t
    client:EmitSound(t, 70)
    client.Type = typ or 1
end

function SWEP:DebugSounds(typ, client)
    client = client or self:GetOwner()
    if not client.SCP096_Sound or client.Type ~= typ then self:StartSounds(typ or self.Type or 1) end
end

function SWEP:StopSounds()
    local client = self:GetOwner()
    if client.SCP096_Sound then client:StopSound(client.SCP096_Sound) end
end

function SWEP:OnRemove()
    local client = self:GetOwner()
    if client.SCP096_Sound then client:StopSound(client.SCP096_Sound) end
end

function SWEP:Think()
    local tb = GetTable(self)
    local dt = tb.dt
    if not dt then return end
    local client = self:GetOwner()
    if client == NULL then return end
    if SERVER then
        if dt.Active then
            self:DebugSounds(2, client)
        elseif dt.BecomeAggressive > 0 then
            self:DebugSounds(3, client)
        else
            self:DebugSounds(1, client)
        end
    end

    local become_agg = dt.BecomeAggressive
    if become_agg > 0 and CurTime() > become_agg then
        dt.BecomeAggressive = 0
        dt.Active = true
        if SERVER then
            client:ApplySpeed(tostring(self.SpeedMultAdd), true)
            net.Start("SCP096_DrawRedScreen")
            net.WriteBool(true)
            net.Send(client)
        end
    end
end

function SWEP:PrimaryAttack()
    if not IsValid(self:GetOwner()) or not self:GetActive() then return end
    self:GetOwner():SetAnimation(PLAYER_ATTACK1)
    self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
    self:EmitSound("mg_scprp/scp096/attack" .. math.random(1, 3) .. ".wav")
    local vm = self:GetOwner():GetViewModel()
    if IsValid(vm) then vm:SetPlaybackRate(1.5) end
    self:DetectEntity(self:GetOwner())
    self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
    self:SetNextSecondaryFire(CurTime() + self.Primary.Delay)
    self:GetOwner():ViewPunch(Angle(-5, 5, 0))
end

function SWEP:DetectEntity(client)
    local startPos = client:GetShootPos()
    local endPos = startPos + client:GetAimVector() * self.HitRange
    local traceResult = util.TraceLine({
        start = startPos,
        endpos = endPos,
        filter = function(ent) return ent ~= client and ent:IsWorld() == false end
    })

    if traceResult.Hit then
        util.Decal("Blood", client:GetShootPos() - client:GetAimVector(), client:GetShootPos() + client:EyeAngles():Forward() * 100 + client:GetAimVector(), client)
        if SERVER then self:Damage(client, traceResult.Entity) end
    else
        return nil
    end
end

local SCPActivity = {}
SCPActivity[1] = {}
SCPActivity[1][ACT_MP_WALK] = ACT_HL2MP_RUN
SCPActivity[1][ACT_MP_RUN] = ACT_HL2MP_RUN
SCPActivity[1][ACT_MP_STAND_IDLE] = ACT_IDLE_ANGRY
SCPActivity[1][ACT_MP_JUMP] = ACT_HL2MP_JUMP
SCPActivity[1][ACT_MP_ATTACK_STAND_PRIMARYFIRE] = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE
SCPActivity[2] = {}
SCPActivity[2][ACT_MP_STAND_IDLE] = ACT_IDLE_AGITATED
SCPActivity[3] = {}
SCPActivity[3][ACT_MP_RUN] = ACT_HL2MP_WALK
SCPActivity[3][ACT_MP_JUMP] = ACT_HL2MP_IDLE
function SWEP:TranslateActivity(act)
    local tb = GetTable(self)
    local dt = tb.dt
    if SCPActivity[1][act] and self:GetActive() then
        return SCPActivity[1][act]
    elseif SCPActivity[2][act] and dt.BecomeAggressive > 0 then
        return SCPActivity[2][act]
    elseif SCPActivity[3][act] then
        return SCPActivity[3][act]
    else
        return -1
    end
end