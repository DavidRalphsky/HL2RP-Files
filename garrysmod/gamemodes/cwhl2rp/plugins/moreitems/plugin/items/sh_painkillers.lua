--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("alcohol_base");
ITEM.name = "Pain-Killers";
ITEM.cost = 175;
ITEM.model = "models/Items/Flare.mdl";
ITEM.weight = 1.1;
ITEM.access = "L";
ITEM.useText = "Take";
ITEM.category = "Drugs";
ITEM.business = true;
ITEM.description = "A small, scratched container with a medical logo on the side. On the top, the container says 'Pain Killers'.";

function ITEM:OnUse(player, itemEntity)
	player:SetSharedVar("antidepressants", CurTime() + 600);
	Clockwork.player:Notify(ply, "You have taken the Pain-Killers.")
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) 
  
end;


ITEM:Register();