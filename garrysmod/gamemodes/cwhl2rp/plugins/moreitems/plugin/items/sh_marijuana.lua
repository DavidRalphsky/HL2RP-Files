--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("alcohol_base");
ITEM.name = "Marijuana";
ITEM.cost = 105;
ITEM.model = "models/props_lab/box01a.mdl";
ITEM.weight = 1.5;
ITEM.access = "L";
ITEM.useText = "Smoke";
ITEM.category = "Drugs";
ITEM.business = true;
ITEM.description = "Marijuana wrapped in a paper package.";

function ITEM:OnUse(player, itemEntity)
	player:SetSharedVar("antidepressants", CurTime() + 1000);

	player:BoostAttribute(self.name, ATB_AGILITY, 15, 120);
	player:BoostAttribute(self.name, ATB_STAMINA, 15, 120);

end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) 

end;


ITEM:Register();