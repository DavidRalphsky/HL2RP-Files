--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Heavy Machine Gun";
	ITEM.cost = 2400;
	ITEM.model = "models/weapons/w_hmg1.mdl";
	ITEM.weight = 5;
	ITEM.access = "d";
	ITEM.business = false;
	ITEM.uniqueID = "weapon_bp_hmg1";
	ITEM.category = "Weapons";
	ITEM.description = "A giant heavy machine gun, belt fed and looks extremely powerful.";
	ITEM.hasFlashlight = true;
	ITEM.isAttachment = true;
	ITEM.loweredOrigin = Vector(3, 0, -4);
	ITEM.loweredAngles = Angle(10, 0, -10);
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
	ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
	ITEM.attachmentOffsetVector = Vector(-4, 4, 4);
ITEM:Register();