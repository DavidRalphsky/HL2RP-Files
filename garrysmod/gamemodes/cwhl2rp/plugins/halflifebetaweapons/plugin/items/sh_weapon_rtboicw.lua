--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "XM29 OICW V2";
	ITEM.cost = 2200;
	ITEM.model = "models/leakwep/w_o1c4.mdl";
	ITEM.weight = 5;
	ITEM.business = false;
	ITEM.uniqueID = "weapon_bp_rtboicw";
	ITEM.category = "Weapons";
	ITEM.description = "An assault rifle with a large scope, it's rather rusted and worn looking. An alternative version of the XM29 OICW, comes with an attached launcher.";
	ITEM.hasFlashlight = true;
	ITEM.isAttachment = true;
	ITEM.loweredOrigin = Vector(3, 0, -4);
	ITEM.loweredAngles = Angle(10, 0, -10);
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
	ITEM.attachmentOffsetAngles = Angle(0, 0, -5);
	ITEM.attachmentOffsetVector = Vector(-4, 4, -3);
ITEM:Register();