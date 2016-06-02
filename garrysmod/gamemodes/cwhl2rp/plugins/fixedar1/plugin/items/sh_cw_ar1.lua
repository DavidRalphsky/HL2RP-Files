--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "AR1";
	ITEM.cost = 200;
	ITEM.model = "models/weapons/w_rif_ak47.mdl";
	ITEM.weight = 2.5;
	ITEM.access = "V";
	ITEM.classes = {CLASS_EMP, CLASS_EOW};
	ITEM.uniqueID = "cw_ar1";
	ITEM.business = false;
	ITEM.description = "An ancient weapon from another age...";
	ITEM.isAttachment = true;
	ITEM.hasFlashlight = true;
	ITEM.loweredOrigin = Vector(3, 0, -4);
	ITEM.loweredAngles = Angle(10, 0, -10);
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
	ITEM.attachmentOffsetAngles = Angle(180, 0, 0);
	ITEM.attachmentOffsetVector = Vector(10, 4, 7);
ITEM:Register();