--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Single Shot Sniper Rifle";
	ITEM.cost = 2800;
	ITEM.model = "models/rtb_weapons/w_sniper.mdl";
	ITEM.weight = 5;
	ITEM.business = false;
	ITEM.uniqueID = "weapon_bp_sniper";
	ITEM.category = "Weapons";
	ITEM.description = "A Sniper Rifle, made of dark metals. Features a bolt action, and can only hold a magazine of one round.";
	ITEM.hasFlashlight = true;
	ITEM.isAttachment = true;
	ITEM.loweredOrigin = Vector(3, 0, -4);
	ITEM.loweredAngles = Angle(10, 0, -10);
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
	ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
	ITEM.attachmentOffsetVector = Vector(3, 3, -3);
ITEM:Register();
