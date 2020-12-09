



function sendToDiscord(name, message)
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest('-- Your Webhook HERE --', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end


RegisterCommand("staffchat", function(source, args, rawCommand)
	    local source = source
		local args = table.concat(args, " ")
		local name = GetPlayerName(source)
		if IsPlayerAceAllowed(source, "staff") then
			for _, playerId in ipairs(GetPlayers()) do

				
				if IsPlayerAceAllowed(source, "mod") then
					if IsPlayerAceAllowed(playerId, "staff") then
					TriggerClientEvent("notification:send", playerId, "~r~STAFF-CHAT ~g~Moderator ~s~(".. GetPlayerName(source).. "): " .. nachricht)
					sendToDiscord("(MODERATOR) " .. name, nachricht)
					end
				end
				if IsPlayerAceAllowed(source, "admin") then
					if IsPlayerAceAllowed(playerId, "staff") then
					TriggerClientEvent("notification:send", playerId, "~r~STAFF-CHAT ~r~~h~ADMIN~h~ ~s~(".. GetPlayerName(source).. "): " .. nachricht)
					sendToDiscord("(MODERATOR) " .. name, nachricht)
					end
				end
			end
		end
end)


sendToDiscord("STAFF-CHAT", "Script started")
