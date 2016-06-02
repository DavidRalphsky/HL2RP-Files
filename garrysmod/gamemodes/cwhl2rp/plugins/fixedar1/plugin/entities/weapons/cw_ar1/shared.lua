if SERVER then
AddCSLuaFile( "shared.lua" )
end

if CLIENT then
language.Add("weapon_bp_ar1", "AR1")

SWEP.Category 		= "HL2 Beta Sweps"
SWEP.PrintName 		= "AR1"
SWEP.Slot 			= 3
SWEP.SlotPos 		= 4
SWEP.DrawAmmo 		= true
SWEP.DrawCrosshair 	= true
SWEP.ViewModelFOV 	= 52
SWEP.ViewModelFlip = false
SWEP.DrawWeaponInfoBox	= false
SWEP.WepSelectIcon = surface.GetTextureID("HUD/swepicons/weapon_ar1") 
SWEP.BounceWeaponIcon = false 
end

SWEP.ViewModel		= "models/weapons/v_a21.mdl"
SWEP.WorldModel		= "models/weapons/w_rif_ak47.mdl"
SWEP.HoldType		= "ar2"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

game.AddAmmoType( { name = "bp_medium" } )
if ( CLIENT ) then language.Add( "bp_medium_ammo", "Medium Rounds" ) end

SWEP.Primary.Recoil            = 1
SWEP.Primary.ClipSize		= 25
SWEP.Primary.DefaultClip	= 25
SWEP.Primary.Automatic		= true
SWEP.Primary.Delay		= 0.2
SWEP.Primary.Ammo		= "smg1"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo		= "none"

SWEP.Zoom = 0

function SWEP:Initialize()
		self:SetWeaponHoldType(self.HoldType)
	end

function SWEP:Deploy()
	self.Weapon:SendWeaponAnim(ACT_VM_DRAW);
		self:SetNextPrimaryFire( CurTime() + self:SequenceDuration())
		self:SetNextSecondaryFire( CurTime() + self:SequenceDuration())
		self:NextThink( CurTime() + self:SequenceDuration() )
		self:Idle()
   return true
end

function SWEP:Holster()
	self.Owner:SetFOV( 0, 0.25 )
	self.Zoom = 0

	return true
end

function SWEP:Reload()
	if self:DefaultReload( ACT_VM_RELOAD ) then 
	self:Idle()
	end
end 


function SWEP:Think()
if ( self.Owner:KeyReleased( IN_ATTACK ) || ( !self.Owner:KeyDown( IN_ATTACK ) && self.Sound ) ) then
		self:Idle()
	end
end

function SWEP:Holster( weapon )
	if ( CLIENT ) then return end

	self:StopIdle()
	
	return true
end

function SWEP:PrimaryAttack()
//if(SERVER) then
	if ( !self:CanPrimaryAttack() ) then 
		return
	
	else
	if (self.Zoom == 0 || self:Clip1() < 1 ) then
		self:ShootBullet( 10, 1, 0.026 )
		self.Weapon:SetNextPrimaryFire( CurTime() + 0.1 )
		self:EmitSound( Sound("weapons/1ar1/ar2_fire1.wav") )
		self:TakePrimaryAmmo( 1 )
		self.Owner:ViewPunch( Angle( math.Rand(-0.4,-0.4) * self.Primary.Recoil, math.Rand(-0.4,0.4) *self.Primary.Recoil, 0 ) )
			
	else 
		self.Weapon:SetNextPrimaryFire( CurTime() + 0.3 )
		self:ShootBullet( 15, 1, 0.015 )
		self:EmitSound( Sound("weapons/1ar1/ar2_fire1.wav") )
		self:TakePrimaryAmmo( 1 )
		self.Owner:ViewPunch( Angle( math.Rand(-0.3,-0.2) * self.Primary.Recoil, math.Rand(-0.2,0.2) *self.Primary.Recoil, 0 ) )
	        
			end
		end
	end
//end

function SWEP:SecondaryAttack()
	if(SERVER) then
	if ( !self:CanPrimaryAttack() ) then 
		return
		
	else
	if(self.Zoom == 0) then
		self:EmitSound("weapons/1smg2/switch_single.wav")
                self.Zoom = 1
				
	else

		self:EmitSound("weapons/1smg2/switch_burst.wav")
                self.Zoom = 0
			end
		end
	end
end


function SWEP:DoIdleAnimation()
	self:SendWeaponAnim( ACT_VM_IDLE )
end

function SWEP:DoIdle()
	self:DoIdleAnimation()

	timer.Adjust( "weapon_idle" .. self:EntIndex(), self:SequenceDuration(), 0, function()
		if ( !IsValid( self ) ) then timer.Destroy( "weapon_idle" .. self:EntIndex() ) return end

		self:DoIdleAnimation()
	end )
end

function SWEP:StopIdle()
	timer.Destroy( "weapon_idle" .. self:EntIndex() )
end

function SWEP:Idle()
	if ( CLIENT || !IsValid( self.Owner ) ) then return end
	timer.Create( "weapon_idle" .. self:EntIndex(), self:SequenceDuration() - 0.2, 1, function()
		if ( !IsValid( self ) ) then return end
		self:DoIdle()
	end )
end