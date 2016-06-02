--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Ice Axe";
	ITEM.cost = 400;
	ITEM.model = "models/weapons/w_iceaxe.mdl";
	ITEM.weight = 0.1;
	ITEM.business = false;
	ITEM.uniqueID = "weapon_bp_iceaxe";
	ITEM.category = "Weapons";
	ITEM.description = "An Ice Axe, used for picking at ice and even grappling onto it. Often used to climb icey walls.";
	ITEM.hasFlashlight = true;
	ITEM.isAttachment = true;
	ITEM.loweredOrigin = Vector(3, 0, -4);
	ITEM.loweredAngles = Angle(0, 45, 0);
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
	ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
	ITEM.attachmentOffsetVector = Vector(-4, 4, 4);
ITEM:Register();