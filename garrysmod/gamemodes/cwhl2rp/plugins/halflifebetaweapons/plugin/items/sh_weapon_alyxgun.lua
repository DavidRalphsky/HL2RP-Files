--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Sub Machine Pistol";
	ITEM.cost = 500;
	ITEM.model = "models/weapons/w_alex_gun.mdl";
	ITEM.weight = 1;
	ITEM.business = false;
	ITEM.uniqueID = "weapon_bp_alyxgun";
	ITEM.category = "Weapons";
	ITEM.description = "A strange pistol that can fold out into a sub machine pistol, uses 9mm ammo.";
	ITEM.hasFlashlight = true;
	ITEM.isAttachment = true;
	ITEM.loweredOrigin = Vector(3, 0, -4);
	ITEM.loweredAngles = Angle(10, 0, -10);
	ITEM.attachmentBone = "ValveBiped.Bip01_Pelvis";
	ITEM.attachmentOffsetAngles = Angle(0, 0, 90);
	ITEM.attachmentOffsetVector = Vector(0, 4, -8);
ITEM:Register();