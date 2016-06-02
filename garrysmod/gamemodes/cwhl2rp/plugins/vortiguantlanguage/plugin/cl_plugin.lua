--[[
	This script has been purchased for "Blt950's HL2RP & Clockwork plugins" from CoderHire.com
	© 2014 Blt950 do not share, re-distribute or modify
	without permission.
--]]

local PLUGIN = PLUGIN;

function PLUGIN:Initialize()
	-- A function to decode a message.
	function Clockwork.chatBox:Decode(speaker, name, text, data, class)
		local filtered = nil;
		local filter = nil;
		local icon = nil;
		
		if (!IsValid(Clockwork.Client)) then
			return;
		end;
		
		if (self.classes[class]) then
			filter = self.classes[class].filter;
		elseif (class == "pm" or class == "ooc"
		or class == "roll" or class == "looc"
		or class == "priv") then
			filtered = (CW_CONVAR_SHOWOOC:GetInt() == 0);
			filter = "ooc";
		else
			filtered = (CW_CONVAR_SHOWIC:GetInt() == 0);
			filter = "ic";
		end;
		
		text = Clockwork.kernel:Replace(text, " ' ", "'");
		
		if (IsValid(speaker)) then
			if (!Clockwork.kernel:IsChoosingCharacter()) then
				if (speaker:Name() != "") then
					local unrecognised = false;
					local classIndex = speaker:Team();
					local classColor = _team.GetColor(classIndex);
					local focusedOn = false;
					
					if (speaker:IsSuperAdmin()) then
						icon = "icon16/shield.png";
					elseif (speaker:IsAdmin()) then
						icon = "icon16/star.png";
					elseif (speaker:IsUserGroup("operator")) then
						icon = "icon16/emoticon_smile.png";
					else
						local faction = speaker:GetFaction();
						
						if (faction and Clockwork.faction.stored[faction]) then
							if (Clockwork.faction.stored[faction].whitelist) then
								icon = "icon16/add.png";
							end;
						end;
						
						if (!icon) then
							icon = "icon16/user.png";
						end;
					end;
					
					if (!Clockwork.player:DoesRecognise(speaker, RECOGNISE_TOTAL) and filter == "ic") then
						unrecognised = true;
					end;
					
					local trace = Clockwork.player:GetRealTrace(Clockwork.Client);
					
					if (trace and trace.Entity and IsValid(trace.Entity) and trace.Entity == speaker) then
						focusedOn = true;
					end;
					
					local info = {
						unrecognised = unrecognised,
						shouldHear = Clockwork.player:CanHearPlayer(Clockwork.Client, speaker),
						focusedOn = focusedOn,
						filtered = filtered,
						speaker = speaker,
						visible = true;
						filter = filter,
						class = class,
						icon = icon,
						name = name,
						text = text,
						data = data
					};
					
					Clockwork.plugin:Call("ChatBoxAdjustInfo", info);
					
					if (info.visible) then
						if (info.filter == "ic") then
							if (!Clockwork.Client:Alive()) then
								return;
							end;
						end;
						
						if (info.unrecognised) then
							local unrecognisedName, usedPhysDesc = Clockwork.player:GetUnrecognisedName(info.speaker);
							
							if (usedPhysDesc and string.len(unrecognisedName) > 24) then
								unrecognisedName = string.sub(unrecognisedName, 1, 21).."...";
							end;
							
							info.name = "["..unrecognisedName.."]";
						end;
						
						if (self.classes[info.class]) then
							self.classes[info.class].Callback(info);
						elseif (info.class == "radio_eavesdrop") then
							if (info.shouldHear) then
								local color = Color(255, 255, 175, 255);
								
								if (info.focusedOn) then
									color = Color(175, 255, 175, 255);
								end;
								
								Clockwork.chatBox:Add(info.filtered, nil, color, info.name.." radios in \""..info.text.."\"");
							end;
						elseif (info.class == "whisper") then
							if (info.shouldHear) then
								local color = Color(255, 255, 175, 255);
								
								if (info.focusedOn) then
									color = Color(175, 255, 175, 255);
								end;
								
								Clockwork.chatBox:Add(info.filtered, nil, color, info.name.." whispers \""..info.text.."\"");
							end;
						elseif (info.class == "event") then
							Clockwork.chatBox:Add(info.filtered, nil, Color(200, 100, 50, 255), info.text);
						elseif (info.class == "radio") then
							Clockwork.chatBox:Add(info.filtered, nil, Color(75, 150, 50, 255), info.name.." radios in \""..info.text.."\"");
						elseif (info.class == "yell") then
							local color = Color(255, 255, 175, 255);
							
							if (info.focusedOn) then
								color = Color(175, 255, 175, 255);
							end;
							Clockwork.chatBox:Add(info.filtered, nil, color, info.name.." yells \""..info.text.."\"");
						elseif (info.class == "chat") then
							Clockwork.chatBox:Add(info.filtered, nil, classColor, info.name, ": ", info.text, nil, info.filtered);
						elseif (info.class == "looc") then
							Clockwork.chatBox:Add(info.filtered, nil, Color(225, 50, 50, 255), "[LOOC] ", Color(255, 255, 150, 255), info.name..": "..info.text);
						elseif (info.class == "priv") then
							Clockwork.chatBox:Add(info.filtered, nil, Color(255, 200, 50, 255), "@"..info.data.userGroup.." ", classColor, info.name, ": ", info.text);
						elseif (info.class == "roll") then
							if (info.shouldHear) then
								Clockwork.chatBox:Add(info.filtered, nil, Color(150, 75, 75, 255), "** "..info.name.." "..info.text);
							end;
						elseif (info.class == "ooc") then
							Clockwork.chatBox:Add(info.filtered, info.icon, Color(225, 50, 50, 255), "[OOC] ", classColor, info.name, ": ", info.text);
						elseif (info.class == "pm") then
							Clockwork.chatBox:Add(info.filtered, nil, "[PM] ", Color(125, 150, 75, 255), info.name..": "..info.text);
							surface.PlaySound("hl1/fvox/bell.wav");
						elseif (info.class == "me") then
							local color = Color(255, 255, 175, 255);
							
							if (info.focusedOn) then
								color = Color(175, 255, 175, 255);
							end;
							
							if (string.sub(info.text, 1, 1) == "'") then
								Clockwork.chatBox:Add(info.filtered, nil, color, "** "..info.name..info.text);
							else
								Clockwork.chatBox:Add(info.filtered, nil, color, "** "..info.name.." "..info.text);
							end;
						elseif (info.class == "it") then
							local color = Color(255, 255, 175, 255);
							
							if (info.focusedOn) then
								color = Color(175, 255, 175, 255);
							end;
							
							Clockwork.chatBox:Add(info.filtered, nil, color, "** "..info.text);
						elseif (info.class == "ic") then
							if (info.shouldHear) then
								local color = Color(255, 255, 150, 255);
								
								if (info.focusedOn) then
									color = Color(175, 255, 150, 255);
								end;
								
								Clockwork.chatBox:Add(info.filtered, nil, color, info.name.." says \""..info.text.."\"");
							end;
						elseif (info.class == "vort") then
							if (info.shouldHear) then
								local color = Color(255, 255, 150, 255);
								
								if (info.focusedOn) then
									color = Color(175, 255, 150, 255);
								end;
								
								if (Clockwork.Client:GetFaction() != FACTION_VORT) then
									local recreateLast = false;
									local endText = string.sub(info.text, -1);  // Is it shout, question or period? If yes save it to recreate it after vortification.
									if ( endText == "." or endText == "!" or endText == "?" ) then
										recreateLast = true
									end;
									
									vortWords = {"ahglah", "ahhhr", "alla", "allu", "baah", "beh", "bim", "buu", "chaa", "chackt", "churr", "dan", "darr", "dee", "eeya", "ge", "ga", "gaharra",
									"gaka", "galih", "gallalam", "gerr", "gog", "gram", "gu", "gunn", "gurrah", "ha", "hallam", "harra", "hen", "hi", "jah", "jurr", "kallah", "keh", "kih",
									"kurr", "lalli", "llam", "lih", "ley", "lillmah", "lurh", "mah", "min", "nach", "nahh", "neh", "nohaa", "nuy", "raa", "ruhh", "rum", "saa", "seh", "sennah",
									"shaa", "shuu", "surr", "taa", "tan", "tsah", "turr", "uhn", "ula", "vahh", "vech", "veh", "vin", "voo", "vouch", "vurr", "xkah", "xih", "zurr"}
									splitWords = string.Split(info.text, " ");
									local numWords = 0;
									info.text = "";
									for k, v in pairs(splitWords) do 
										if math.random(0,5) == 3 then
											info.text = info.text..vortWords[math.random( #vortWords )].."'";
										else
											info.text = info.text..vortWords[math.random( #vortWords )].." ";
										end
									end;
									
									// Remove space at end
									info.text = string.TrimRight(info.text)
									// Make a period at the ending.
									if recreateLast then info.text = (info.text..endText); end
									local endText = string.sub(info.text, -1);
									if ( endText != "." and endText != "!" and endText != "?" ) then
										info.text = (info.text..".");
									end;
									// Make capital at start
									local editCapital = string.sub(info.text, 1, 1);
									info.text = (string.upper(editCapital)..string.sub(info.text, 2, string.len(info.text)));
								end
								
								Clockwork.chatBox:Add(info.filtered, nil, color, info.name.." says in Vortigese \""..info.text.."\"");
							end;
						end;
					end;
				end;
			end;
		else
			if (name == "Console" and class == "chat") then
				icon = "icon16/shield.png";
			end;
			
			local info = {
				filtered = filtered,
				visible = true;
				filter = filter,
				class = class,
				icon = icon,
				name = name,
				text = text,
				data = data
			};
			
			Clockwork.plugin:Call("ChatBoxAdjustInfo", info);
			
			if (!info.visible) then return; end;
			
			if (self.classes[info.class]) then
				self.classes[info.class].Callback(info);
			elseif (info.class == "notify_all") then
				if (Clockwork.kernel:GetNoticePanel()) then
					Clockwork.kernel:AddCinematicText(info.text, Color(255, 255, 255, 255), 32, 6, Clockwork.option:GetFont("menu_text_tiny"), true);
				end;
				
				local filtered = (CW_CONVAR_SHOWAURA:GetInt() == 0) or info.filtered;
				
				if (string.sub(info.text, -1) == "!") then
					Clockwork.chatBox:Add(filtered, "icon16/error.png", Color(200, 175, 200, 255), info.text);
				else
					Clockwork.chatBox:Add(filtered, "icon16/comment.png", Color(125, 150, 175, 255), info.text);
				end;
			elseif (info.class == "disconnect") then
				local filtered = (CW_CONVAR_SHOWAURA:GetInt() == 0) or info.filtered;
				
				Clockwork.chatBox:Add(filtered, "icon16/user_delete.png", Color(200, 150, 200, 255), info.text);
			elseif (info.class == "notify") then
				if (Clockwork.kernel:GetNoticePanel()) then
					Clockwork.kernel:AddCinematicText(info.text, Color(255, 255, 255, 255), 32, 6, Clockwork.option:GetFont("menu_text_tiny"), true);
				end;
				
				local filtered = (CW_CONVAR_SHOWAURA:GetInt() == 0) or info.filtered;
				
				if (string.sub(info.text, -1) == "!") then
					Clockwork.chatBox:Add(filtered, "icon16/error.png", Color(200, 175, 200, 255), info.text);
				else
					Clockwork.chatBox:Add(filtered, "icon16/comment.png", Color(175, 200, 255, 255), info.text);
				end;
			elseif (info.class == "connect") then
				local filtered = (CW_CONVAR_SHOWAURA:GetInt() == 0) or info.filtered;
				Clockwork.chatBox:Add(filtered, "icon16/user_add.png", Color(150, 150, 200, 255), info.text);
			elseif (info.class == "chat") then
				Clockwork.chatBox:Add(info.filtered, info.icon, Color(225, 50, 50, 255), "[OOC] ", Color(150, 150, 150, 255), name, ": ", info.text);
			else
				local yellowColor = Color(255, 255, 150, 255);
				local blueColor = Color(125, 150, 175, 255);
				local redColor = Color(200, 25, 25, 255);
				local filtered = (CW_CONVAR_SHOWSERVER:GetInt() == 0) or info.filtered;
				local prefix;
				
				Clockwork.chatBox:Add(filtered, nil, yellowColor, info.text);
			end;
		end;
	end;
end;