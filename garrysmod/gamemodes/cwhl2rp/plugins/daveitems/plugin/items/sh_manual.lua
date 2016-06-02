local ITEM = Clockwork.item:New();
ITEM.name = "Combine Civil Authority Field Manual";
ITEM.model = "models/props_lab/bindergraylabel01b.mdl";
ITEM.weight = 1;
ITEM.useText = "Read";
ITEM.category = "Books";
ITEM.description = "A standard-issue manual.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
        player:SendLua("gui.OpenURL('http://hollowpointrp.enjin.com/shadow/m/32509176/viewthread/22639182-combine-civil-authority-field-manual')")
		return true;
end;

ITEM:Register();