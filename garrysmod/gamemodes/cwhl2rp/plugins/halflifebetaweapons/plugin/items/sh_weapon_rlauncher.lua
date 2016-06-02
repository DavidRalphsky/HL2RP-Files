--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Rocket Launcher";
	ITEM.cost = 5000;
	ITEM.model = "models/Weapons/w_rocket_launcher.mdl";
	ITEM.weight = 5;
	ITEM.business = false;
	ITEM.uniqueID = "weapon_bp_rlauncher";
	ITEM.category = "Weapons";
	ITEM.description = "A large green rocket launcher, shoots RPG's which explode on contact with almost anything.";
	ITEM.hasFlashlight = true;
	ITEM.loweredOrigin = Vector(3, 0, -4);
	ITEM.loweredAngles = Angle(10, 0, -10);
	ITEM.isAttachment = false;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
	ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
	ITEM.attachmentOffsetVector = Vector(-4, 4, 4);
ITEM:Register();