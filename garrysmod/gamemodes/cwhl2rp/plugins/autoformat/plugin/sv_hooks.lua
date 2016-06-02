local PLUGIN = PLUGIN

function PLUGIN:PlayerRestoreCharacterData(player, data)
	if !Schema:PlayerIsCombine(player) and player:GetFaction() != FACTION_ADMIN then
		if (!data["citizenid"] or string.len( tostring( data["citizenid"] ) ) == 4) then
			data["citizenid"] = Clockwork.kernel:ZeroNumberToDigits(math.random(1, 99999), 5)
		end
		
		if !data["combinedata"] then
			data["combinedata"] = PLUGIN.chardata:GetCitizenFormat(player)
		end
	end
end

function PLUGIN:Initialize()
	Clockwork.datastream:Hook("EditData", function(player, data)
		if (player.editDataAuthorised == data[1] and type( data[2] ) == "string") then
			data[1]:SetCharacterData( "combinedata", string.sub(data[2], 0, 5000) );
			
			player.editDataAuthorised = nil;
		end;
	end);
end