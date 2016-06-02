--[[
 Â© 2012 CloudSixteen.com do not share, re-distribute or modify
 without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Civil Protection Trenchcoat Uniform";
ITEM.model = "models/props_c17/BriefCase001a.mdl";
ITEM.cost = 820;
ITEM.weight = 2.7;
ITEM.business = true;
ITEM.access = "L";
ITEM.useText = "Wear";
ITEM.category = "Clothing";
ITEM.protection = 0.4;
ITEM.replacement = "models/policetrench.mdl";
ITEM.description = "A worn Civil Protection Trenchcoat uniform.  The uniform is premium, but the helmet is scuffed.";

ITEM:Register();
