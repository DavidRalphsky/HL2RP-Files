--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "H&K MP7";
	ITEM.cost = 1200;
	ITEM.model = "models/weapons/w_smg3.mdl";
	ITEM.weight = 5;
	ITEM.business = false;
	ITEM.uniqueID = "weapon_bp_smg3";
	ITEM.category = "Weapons";
	ITEM.description = "A Heckler and Koch MP7, a compact SMG with a reflex sight.";
	ITEM.hasFlashlight = true;
	ITEM.isAttachment = true;
	ITEM.loweredOrigin = Vector(3, 0, -4);
	ITEM.loweredAngles = Angle(10, 0, -10);
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
	ITEM.attachmentOffsetAngles = Angle(0, 180, -5);
	ITEM.attachmentOffsetVector = Vector(3, 5, 5);
ITEM:Register();