--[[
 Â© 2012 CloudSixteen.com do not share, re-distribute or modify
 without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Overwatch Transhuman Arm Uniform";
ITEM.model = "models/props_c17/BriefCase001a.mdl";
ITEM.cost = 900;
ITEM.weight = 3.5;
ITEM.business = true;
ITEM.access = "L";
ITEM.useText = "Wear";
ITEM.category = "Clothing";
ITEM.protection = 0.7;
ITEM.replacement = "models/Combine_Soldier.mdl";
ITEM.description = "A heavy Overwatch Transhuman Uniform. It would take a lot of strength to wear this. It has a utility belt, boots, and helmet.";

ITEM:Register();
