--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "H&K MP5K";
	ITEM.cost = 1200;
	ITEM.model = "models/weapons/smg2/w_smg2.mdl";
	ITEM.weight = 5;
	ITEM.business = false;
	ITEM.uniqueID = "weapon_bp_smg2";
	ITEM.category = "Weapons";
	ITEM.description = "A Heckler and Koch MP5K, a smaller version of the MP5 for compact needs.";
	ITEM.hasFlashlight = true;
	ITEM.isAttachment = true;
	ITEM.loweredOrigin = Vector(3, 0, -4);
	ITEM.loweredAngles = Angle(10, 0, -10);
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
	ITEM.attachmentOffsetAngles = Angle(0, 180, -5);
	ITEM.attachmentOffsetVector = Vector(3, 5, 10);
ITEM:Register();