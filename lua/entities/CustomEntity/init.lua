AddCSLuaFile("entities/CustomEntity/cl_init.lua")
AddCSLuaFile("entities/CustomEntity/shared.lua")
include("entities/CustomEntity/shared.lua")
local initialColor = nil
function ENT:Initialize()
    self:SetModel("models/items/ammocrate_smg1.mdl")
    self:PhysicsInit(SOLID_BBOX)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_NONE)
    self:DrawShadow(false )
    intialColor = self:GetColor()
end


weaponsTable = {
    "weapon_357",
    "weapon_pistol",
    "weapon_bugbait",
    "weapon_crossbow",
    "weapon_crowbar",
    "weapon_frag",
    "weapon_ar2",
    "weapon_rpg",
    "weapon_shotgun",
    "weapon_smg1",
}



local canUse = true  
function ENT:Use(caller,activator)
    if canUse then
        self:SetColor(Color(218,26,26,10))
        canUse = false
        timer.Simple(1,function ()
            weapon = ents.Create(weaponsTable[math.random(1,#weaponsTable)])
            weapon:SetPos(self:LocalToWorld(Vector(0,0,30)))
            weapon:SetMoveType(MOVETYPE_NONE)
            weapon:SetParent(self)
            weapon:SetAngles(self:LocalToWorldAngles(Angle(0,90,0)) )
            weapon:Spawn()
            sound.Play( "buttons/combine_button5.wav", self:GetPos() )
            self:SetColor(intialColor)
            canUse = true
        end)
    end
   
end

