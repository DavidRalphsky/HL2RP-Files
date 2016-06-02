--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("weapon_base");
ITEM.name = "Stun-Stick";
ITEM.cost = 60;
ITEM.model = "models/dpfilms/metropolice/props/hd_stunbaton.mdl";
ITEM.weight = 1.6;
ITEM.uniqueID = "cw_stunstick";
ITEM.access = "L";
ITEM.business = true;
ITEM.description = "A Universal Union Stun-Stick made from Titanium with a rubber grip and padding. It has a firm switch on the side with numerous settings.";
ITEM.isAttachment = true;
ITEM.hasFlashlight = true;
-- Used all below from Jamestaa's plugin.
ITEM.loweredOrigin = Vector(3, 0, -4);
ITEM.loweredAngles = Angle(0, 45, 0);
ITEM.attachmentBone = "Valvebiped.Bip01_Pelvis";
ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
ITEM.attachmentOffsetVector = Vector(-2, 5, 4);

ITEM:Register();