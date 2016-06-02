--[[
 Â© 2012 CloudSixteen.com do not share, re-distribute or modify
 without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Civil Protection Uniform";
ITEM.model = "models/props_c17/BriefCase001a.mdl";
ITEM.cost = 750;
ITEM.weight = 2.5;
ITEM.business = true;
ITEM.access = "L";
ITEM.useText = "Wear";
ITEM.category = "Clothing";
ITEM.protection = 0.3;
ITEM.replacement = "models/Police.mdl";
ITEM.description = "A worn Civil Protection uniform. It has a utility belt, boots, and helmet. It appears a Stun-Stick was not included.";

ITEM:Register();
