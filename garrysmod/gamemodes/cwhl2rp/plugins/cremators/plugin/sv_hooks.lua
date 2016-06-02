local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

-- Called at an interval while a player is connected.
function PLUGIN:PlayerThink(player, curTime, infoTable)
	local CrematorSound = "npc/cremator/amb_loop.wav"
	local sound = CreateSound(player, "npc/cremator/amb_loop.wav");
	local faction = player:GetFaction();

	if (player:Alive() and !player:IsRagdolled()) then
			if ( faction == FACTION_CREMATOR ) then
		sound:Play();
	else
		-- BroadcastLua("LocalPlayer():ConCommand('stopsound')") Doesn't fukin work
		sound:Stop();
			end;
		end;
end;

-- Called when a player's typing display has started.
function PLUGIN:PlayerStartTypingDisplay(player, code)
	local faction = player:GetFaction();
	if ( faction == FACTION_CREMATOR ) then
		if (code == "n" or code == "y" or code == "w" or code == "r") then
			if (!player.typingBeep) then
				player.typingBeep = true;
				
				player:EmitSound("npc/overwatch/radiovoice/on3.wav");
			end;
		end;
	end;
end;

-- Called when a player's typing display has finished.
function PLUGIN:PlayerFinishTypingDisplay(player, textTyped)
	local faction = player:GetFaction();
	if ( faction == FACTION_CREMATOR and textTyped ) then
		if (player.typingBeep) then
			player:EmitSound("npc/overwatch/radiovoice/off4.wav");
		end;
	end;
	
	player.typingBeep = nil;
end;

-- Called when a player's character has initialized.
function PLUGIN:PlayerCharacterInitialized(player)
	local faction = player:GetFaction();
	
	if (faction == FACTION_CREMATOR) then
		Schema:AddCombineDisplayLine( "Rebuilding active Cremator Unit Manifest....", Color(255, 165, 0, 255) );
	end;
end;

-- Called when a player's death sound should be played.
function PLUGIN:PlayerPlayDeathSound(player, gender)
	local faction = player:GetFaction();
		
		
	if ( faction == FACTION_CREMATOR ) then
		local crmsound = "npc/overwatch/radiovoice/die"..math.random(1, 3)..".wav";
		for k, v in ipairs( _player.GetAll() ) do
			if (v:HasInitialized()) then
				 if	( faction == FACTION_CREMATOR or faction == FACTION_MPF or faction == FACTION_OTA ) then
						v:EmitSound(crmsound);
						Schema:AddCombineDisplayLine( "BioSignal lost for Cremator Unit at unknown location....", Color(255, 0, 0, 255) );
				end;
			end;
		end;
		end;
		
		return crmsound;
end;

function PLUGIN:PlayerGiveWeapons(player)
	if (player:GetFaction() == FACTION_CREMATOR) then
		Clockwork.player:GiveSpawnWeapon(player, "cw_cremator");
	end;
end;

-- Called when a player's footstep sound should be played.
function PLUGIN:PlayerFootstep(player, position, foot, sound, volume, recipientFilter)
	local clothes = player:GetCharacterData("clothes");
	local model = string.lower( player:GetModel() );
	local faction = player:GetFaction();
	
	-- if (PLUGIN:PlayerIsCremator(faction)) then
-- 	if ( faction == FACTION_CREMATOR )
	if (string.find(model, "cremator")) then
			if (foot == 0) then
				local randomSounds = {1, 3, 5};
				local randomNumber = math.random(1, 3);
				
				sound = "npc/combine_soldier/gear"..randomSounds[randomNumber]..".wav";
			end;
		end;
	
	player:EmitSound(sound);
	
end;

-- Called just after a player spawns.
function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	local clothes = player:GetCharacterData("clothes");
	local faction = player:GetFaction();
	
		if (!lightSpawn) then
		player:SetSharedVar("antidepressants", 0);
		
		Clockwork.datastream:Start(player, "ClearEffects", true);
		
		player.beingSearched = nil;
		player.searching = nil;

		end;

		if (player:GetFaction() == FACTION_CREMATOR) then
			player:SetMaxHealth(500);
			player:SetMaxArmor(100);
			player:SetHealth(500);
			player:SetArmor(100);
	end;
end;

-- Called when a player's pain sound should be played.
function PLUGIN:PlayerPlayPainSound(player, gender, damageInfo, hitGroup)
	local faction = player:GetFaction();
	if ( faction == FACTION_CREMATOR ) then
		return "npc/cremator/amb_mad.wav";
	end;
end;