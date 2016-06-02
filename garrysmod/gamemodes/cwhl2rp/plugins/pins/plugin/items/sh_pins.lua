--[[
	This script has been purchased for "Blt950's HL2RP & Clockwork plugins" from CoderHire.com
	© 2014 Blt950 do not share, re-distribute or modify
	without permission.
--]]

ITEM = Clockwork.item:New();
ITEM.name = "Pin";
ITEM.cost = 3;
ITEM.model = "models/Items/CrossbowRounds.mdl";
ITEM.weight = 0.25;
ITEM.business = true;
ITEM.access = "u";
ITEM.description = "A pin. Used to hang up papers on the walls.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local trace = player:GetEyeTrace()
	// Bail if we hit world or a player
	if (  !trace.Entity:IsValid() || trace.Entity:IsPlayer() ) then return false end
	
	// If there's no physics object then we can't constraint it!
	if ( SERVER && !util.IsValidPhysicsObject( trace.Entity, trace.PhysicsBone ) ) then return false end
	
	local tr = {}
		tr.start = trace.HitPos
		tr.endpos = trace.HitPos + (player:GetAimVector() * 16.0)
		tr.filter = { player, trace.Entity }
	local trTwo = util.TraceLine( tr )
	
	if ( trTwo.Hit && !trTwo.Entity:IsPlayer() ) then

		// Get client's CVars
		local forcelimit = "100"

		// Client can bail now
		if ( CLIENT ) then return true end

		local vOrigin = trace.HitPos - (player:GetAimVector() * 8.0)
		local vDirection = player:GetAimVector():Angle()

		vOrigin = trace.Entity:WorldToLocal( vOrigin )
		
		// Weld them!
		local constraint, nail = MakeNail( trace.Entity, trTwo.Entity, trace.PhysicsBone, trTwo.PhysicsBone, forcelimit, vOrigin, vDirection )
		if !constraint:IsValid() then return end

		//return true
	end
end;

function MakeNail( Ent1, Ent2, Bone1, Bone2, forcelimit, Pos, Ang )

	local constraint = constraint.Weld( Ent1, Ent2, Bone1, Bone2, forcelimit, false )
	
	constraint.Type = "Nail"
	constraint.Pos = Pos
	constraint.Ang = Ang

	Pos = Ent1:LocalToWorld( Pos )
	Ent1:GetPhysicsObject():EnableMotion(false);

	local nail = ents.Create( "gmod_nail" )
		nail:SetPos( Pos )
		nail:SetAngles( Ang )
		nail:SetParentPhysNum( Bone1 )
		nail:SetParent( Ent1 )

	nail:Spawn()
	nail:Activate()

	constraint:DeleteOnRemove( nail )

	return constraint, nail
end

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();