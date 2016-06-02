--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Worn Shotgun";
	ITEM.cost = 1000;
	ITEM.model = "models/weapons/w_shotgun.mdl";
	ITEM.weight = 5;
	ITEM.business = false;
	ITEM.uniqueID = "weapon_bp_shotgun";
	ITEM.category = "Weapons";
	ITEM.description = "Looks like a regular shotgun, but it's old, rusty and sometimes jams.";
	ITEM.hasFlashlight = true;
	ITEM.isAttachment = true;
	ITEM.loweredOrigin = Vector(3, 0, -4);
	ITEM.loweredAngles = Angle(10, 0, -10);
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
	ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
	ITEM.attachmentOffsetVector = Vector(-4, 4, -3);
ITEM:Register();