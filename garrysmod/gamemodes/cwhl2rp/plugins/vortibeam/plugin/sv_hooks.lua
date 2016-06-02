function PLUGIN:PlayerGiveWeapons(player)
	if (player:GetFaction() == FACTION_VORT) then
		Clockwork.player:GiveSpawnWeapon(player, "cw_vortibeam");
	end;
end;