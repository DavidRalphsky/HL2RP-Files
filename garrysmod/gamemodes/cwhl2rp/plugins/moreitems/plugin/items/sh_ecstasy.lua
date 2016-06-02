--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("alcohol_base");
ITEM.name = "Ecstasy";
ITEM.cost = 195;
ITEM.model = "models/props_lab/box01a.mdl";
ITEM.weight = 1.3;
ITEM.access = "L";
ITEM.useText = "Take";
ITEM.category = "Drugs";
ITEM.business = true;
ITEM.description = "A small cardboard box containing a red ecstasy pill.";

function ITEM:OnUse(player, itemEntity)
	player:SetSharedVar("antidepressants", CurTime() + 1300);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) 
  
end;


ITEM:Register();