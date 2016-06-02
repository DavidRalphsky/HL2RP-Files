local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

-- Called when a player's weapons should be given.
function PLUGIN:PlayerGiveWeapons(player)
	if (player:GetFaction() == FACTION_STALKER) then
		Clockwork.player:GiveSpawnWeapon(player, "cw_laser");
	end;
end;

-- Called when chat box info should be adjusted.
function PLUGIN:ChatBoxAdjustInfo(info)
	if (info.class == "ic" or info.class == "yell" or info.class == "radio" or info.class == "whisper" or info.class == "request") then
		if (IsValid(info.speaker) and info.speaker:HasInitialized()) then
			local playerIsStalk = PLUGIN:PlayerIsStalker(info.speaker);
			
			if (playerIsStalk) then
				for k, v in pairs(PLUGIN.voices.stored.stalkerVoices) do
					if (string.lower(info.text) == string.lower(v.command)) then
						local voice = {
							global = false,
							volume = 80,
							sound = v.sound
						};
						
						if (info.class == "request" or info.class == "radio") then
							voice.global = true;
						elseif (info.class == "whisper") then
							voice.volume = 60;
						elseif (info.class == "yell") then
							voice.volume = 100;
						end;
						
						info.text = v.phrase;
						
						info.voice = voice;
						
						return true;
					end;
				end;
			end;
		end;
	end;
end;

-- Called when a player's death sound should be played.
function PLUGIN:PlayerPlayDeathSound(player, gender)
	local stalkersound = "npc/stalker/go_alert2.wav";
		
	for k, v in ipairs( _player.GetAll() ) do
		if (v:HasInitialized()) then
			 if	( PLUGIN:PlayerIsStalker(v) ) then
				v:EmitSound(stalkersound);
			end;
		end;
	end;
		
	if ( PLUGIN:PlayerIsStalker(player) ) then
		return stalkersound;
	end;
end;

-- Called when a player's pain sound should be played.
function PLUGIN:PlayerPlayPainSound(player, gender, damageInfo, hitGroup)
	if (self:PlayerIsStalker(player)) then
		return "npc/stalker/stalker_pain"..math.random(1, 4)..".wav";
	end;
end;