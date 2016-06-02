local ITEM = Clockwork.item:New();
ITEM.name = "Gasmask-Beanie";
ITEM.model = "models/tnb/items/gasmask.mdl";
ITEM.weight = 0.5;
ITEM.useText = "Wear Mask";
ITEM.category = "Clothing";
ITEM.description = "A broken-in gasmask and beanie with a heavy-duty filter.";
ITEM.customFunctions = {"Remove"};
ITEM.access = "1";
ITEM.business = false;  
-- Called when a player drops the item.
function ITEM:OnDrop(player, position)
    local target = player
    local model = target:GetModel();
	if(model=="models/tactical_rebel_female.mdl")then                       
		target:SetModel("models/humans/group03/female_24.mdl");
		target:SetCharacterData("Model", "models/humans/group03/female_24.mdl", true);
	end;
	return true
end; 
-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
        if (player:Alive() and !player:IsRagdolled()) then
                if (!self.CanPlayerWear or self:CanPlayerWear(player, itemEntity) != false) then
					local target = player 
					local model = target:GetModel(); 
					if(model=="models/humans/group03/female_24.mdl")then               
						target:SetModel("models/tactical_rebel_female.mdl");
						target:SetCharacterData("Model", "models/tactical_rebel_female.mdl", true);
						return true;
					elseif(model=="models/tactical_rebel_female.mdl")then               
						target:SetModel("models/humans/group03/female_24.mdl");
						target:SetCharacterData("Model", "models/tactical_rebel_female.mdl", true);
						return true;
					end;
                end;
        end;
end;
if (SERVER) then
	function ITEM:OnCustomFunction(player, name)
		if(name == "Remove") then      
			local target = player
			local model = target:GetModel();       
			if(model=="models/tactical_rebel_female.mdl")then
				target:SetModel("models/humans/group03/female_24.mdl");
				target:SetCharacterData("Model", "models/humans/group03/female_24.mdl", true);
			end;                                           
		end;
	end;
end;
ITEM:Register();