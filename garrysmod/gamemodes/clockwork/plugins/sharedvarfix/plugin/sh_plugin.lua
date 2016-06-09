if (CLIENT) then
	function PLUGIN:ClockworkLoadShared()
		return true;
	end;
else
	function PLUGIN:ClockworkInitialized()
		-- A function to set a shared variable for a player.
		function Clockwork.player:SetSharedVar(player, key, value)
			if (IsValid(player)) then
				local sharedVars = Clockwork.kernel:GetSharedVars():Player();
				
				if (!sharedVars) then
					--ErrorNoHalt("Couldn't get the sharedVars table.\n");
					return;
				elseif (not sharedVars[key]) then
					--ErrorNoHalt("Couldn't find key '"..key.."' in sharedVars table. Is it registered?\n");
					return;
				end;
				
				local sharedVarData = sharedVars[key];
				
				if (sharedVarData.bPlayerOnly) then
					local realValue = value;
					
					if (value == nil) then
						realValue = Clockwork.kernel:GetDefaultNetworkedValue(sharedVarData.class);
					end;
					
					if (player.cwSharedVars[key] != realValue) then
						player.cwSharedVars[key] = realValue;
						
						Clockwork.datastream:Start(player, "SharedVar", {key = key, value = realValue});
					end;
				else
					local class = Clockwork.kernel:ConvertNetworkedClass(sharedVarData.class);
					
					if (class) then
						if (value == nil) then
							value = Clockwork.kernel:GetDefaultClassValue(class);
						end;
						
						player["SetNetworked"..class](player, key, value);
					else
						--ErrorNoHalt("Couldn't find network class for key '"..key.."'.");
					end;
				end;
			end;
		end;

		-- A function to get a player's shared variable.
		function Clockwork.player:GetSharedVar(player, key)
			if (IsValid(player)) then
				local sharedVars = Clockwork.kernel:GetSharedVars():Player();
				
				if (!sharedVars) then
					--ErrorNoHalt("Couldn't get the sharedVars table.\n");
					return;
				elseif (not sharedVars[key]) then
					--ErrorNoHalt("Couldn't find key '"..key.."' in sharedVars table. Is it registered?\n");
					return;
				end;
				
				local sharedVarData = sharedVars[key];
				
				if (sharedVarData.bPlayerOnly) then
					if (!player.cwSharedVars[key]) then
						return Clockwork.kernel:GetDefaultNetworkedValue(sharedVarData.class);
					else
						return player.cwSharedVars[key];
					end;
				else
					local class = Clockwork.kernel:ConvertNetworkedClass(
						sharedVarData.class
					);
					
					if (class) then
						return player["GetNetworked"..class](player, key);
					else
						--ErrorNoHalt("Couldn't find network class for key '"..key.."'.");
					end;
				end;
			end;
		end;
	end;
end;