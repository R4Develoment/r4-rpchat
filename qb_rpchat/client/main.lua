local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(6000)
		PlayerData = QBCore.Functions.GetPlayerData()
	end
end)

RegisterNetEvent('qb_rpchat:sendMe', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if targetPed == source or #(sourceCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', 
		{template =
		 '<div style="font-weight:bold;margin-bottom: 2px;width:fit-content;padding: 1.5px 8px 5px 8px;margin-right: 0.40vw;background-color: rgba(128, 0, 23, 0.5);border-radius: 5px;border: rgba(255, 0, 0, 0.6) 2px solid;color: rgb(255, 0, 0)"> {0}: <span style="color:white;font-weight:normal">'.. message ..'</span></div>',
			args = { "[ME] - " .. playerId .. "", message }
    })
	end
  end
end)


RegisterNetEvent('qb_rpchat:sendDo', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if targetPed == source or #(sourceCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {template = '<div style="font-weight:bold;margin-bottom: 2px;width:fit-content;padding: 1px 8px 5px 8px;margin-right: 0.40vw;background-color: rgba(0, 55, 114, 0.5);border-radius: 5px;border: rgba(0, 151, 255, 0.6) 2px solid;color: rgba(0, 151, 255, 1.00)"> {0}: <span style="color:white;font-weight:normal">'.. message ..'</span></div>',
			args = { "[DO] - " .. playerId .. "", message }
    })
	end
  end
end)

RegisterNetEvent('qb_rpchat:sendAyuda', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	if target ~= -1 then
		TriggerEvent('chat:addMessage', {template = '<div style="font-weight:bold;font-size: 1.35vh;margin-bottom: 2px;color:rgb(255, 174, 0)"> {0}: <span style="color:white;font-weight:normal">'.. message ..'</span></div>',
			args = { "[" .. playerId .. "] Ayuda", message }
    })
end
end)

RegisterNetEvent('qb_rpchat:sendPid', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)
	local name = GetPlayerName(source)

	if target ~= -1 then
		TriggerEvent('chat:addMessage', {template = '<div style="font-weight:bold;font-size: 1.35vh;margin-bottom: 2px;color:#00ffea"> {0}: <span style="color:white;font-weight:normal">'.. message ..'</span></div>',
			args = { "ID | " .. name .. " [" .. playerId .. "]", message }
    })
end
end)

RegisterNetEvent('qb_rpchat:sendLocalOOC', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)
	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if targetPed == source or #(sourceCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {template = '<div style="font-weight:bold;font-size: 1.35vh;margin-bottom: 2px;color:rgb(196, 196, 196)"> {0}: <span style="color:white;font-weight:normal">'.. message ..'</span></div>',
			args = { "[OOC] - " .. playerId .. "", message }
    })
	end
  end
end)

RegisterNetEvent('qb_rpchat:sendDados', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)
	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if targetPed == source or #(sourceCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {
			template = '<div style="font-weight:bold;margin-bottom: 2px;width:fit-content;padding: 1px 8px 5px 8px;margin-right: 0.40vw;background-color: rgba(117, 0, 104, 0.5);border-radius: 5px;border: rgba(255, 0, 224, 0.6) 2px solid;color: rgba(255, 0, 224, 1)">{0}: <span style="color:white;font-weight:normal">Has sacado un: '.. message ..'</span></div>',
			args = { "[DAD🎲S] - " .. playerId .. "", message }
		})
	end
  end
end)

RegisterCommand('rpol', function(source, args, rawCommand)
	local msg = rawCommand:sub(6)
	local job = PlayerData.job.name
	if PlayerData.job.name == "police" and PlayerData.job.onduty then
        TriggerServerEvent('qb_rpchat:chat', job, msg)
	end						
end, false)

RegisterNetEvent('qb_rpchat:Send')
AddEventHandler('qb_rpchat:Send', function(messageFull, job)
    if PlayerData.job.name == job and PlayerData.job.onduty then
	    TriggerEvent('chat:addMessage', messageFull)
	end
end)