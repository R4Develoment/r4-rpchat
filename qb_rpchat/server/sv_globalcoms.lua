local QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('chatMessage', function(source, name, message)
  if string.sub(message, 1, string.len('/')) ~= '/' then
    CancelEvent()
    TriggerClientEvent('qb_rpchat:sendLocalOOC', -1, source, name, message, {30, 144, 255});
  end
end)

QBCore.Commands.Add('clear', 'Clear Chat', {}, false, function(source, args)
  TriggerClientEvent('chat:clear', source)
end, 'user')

QBCore.Commands.Add('clearall', 'Clear All Chat(Admin Only)', {}, false, function(source, args)
  TriggerClientEvent('chat:clear', -1)
end, 'admin')

RegisterCommand('msg', function(source, args, rawCommand)
	if source == 0 then
		return
	end
	
	if tonumber(args[1]) and args[2] then

		local id=tonumber(args[1])
	
		msg = table.concat(args, ' ', 2)
	 
		local name =  GetPlayerNameSteam(source)

		local nombre =  GetPlayerName(source)
	
		local characterName = GetPlayerName(source)
	
		name = '' .. source .. ' '.. name
	
		local xPlayers = QBCore.Functions.GetPlayers()
	
		local target = QBCore.Functions.GetPlayer(id)

		if(target ~= nil) then
	   
			TriggerClientEvent('chat:addMessage', id, {
				template = '<div style="font-weight:bold;font-size: 1.35vh; border-radius: 3px;"> <b> <b style=color:#5dc91e>MSG |<b style=color:#5dc91e> ID {1}:<b style=color:#ffffff;font-weight:normal> {2}  </br></div>',
				args = { fal, name, msg }
			})
			TriggerClientEvent('chat:addMessage', source, {
				template = '<div style="font-weight:bold;font-size: 1.35vh; border-radius: 3px;"> <b> <b style=color:#5dc91e>MSG |<b style=color:#5dc91e> ID {1}:<b style=color:#ffffff;font-weight:normal> {2}  </br></div>',
				args = { fal, name, msg }
			})
		else
			TriggerClientEvent('QBCore:Notify', source, "Esta ID no corresponde a ningún usuario activo.", "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, "No estás usando el comando bien: /msg id mensaje.", "error")
	end
end, false)

RegisterCommand('dados', function(source, args, user)
  local name = GetCharacterName(source)
  num = math.random(1, 10)
  TriggerClientEvent("qb_rpchat:sendDados", -1, source, name, num, table.concat(args, " "))
end, false)

RegisterCommand('ayuda', function(source, args, raw)
  if source == 0 then
    print('qb_rpchat: you can\'t use this command from rcon!')
    return
  end
  args = table.concat(args, ' ')
  local name = GetCharacterName(source)
  if Config.firstname then name = GetPlayerName2(source) 
elseif Config.lastname then name = GetLastName(source) 
elseif Config.job then name = GetJobName(source) end

  TriggerClientEvent('qb_rpchat:sendAyuda', -1, source, name, args, { 196, 33, 246 })

end)

RegisterCommand('pid', function(source, args, raw)
  if source == 0 then
    print('qb_rpchat: you can\'t use this command from rcon!')
    return
  end
  args = table.concat(args, ' ')
  local name = GetCharacterName(source)
  if Config.firstname then name = GetPlayerName2(source) 
elseif Config.lastname then name = GetLastName(source) 
elseif Config.job then name = GetJobName(source) end

  TriggerClientEvent('qb_rpchat:sendPid', -1, source, name, args, { 196, 33, 246 })

end)

RegisterCommand('ooc', function(source, args, raw)
  if source == 0 then
    print('qb_rpchat: you can\'t use this command from rcon!')
    return
  end
  args = table.concat(args, ' ')
  local name = GetCharacterName(source)
  if Config.firstname then name = GetPlayerName2(source) 
elseif Config.lastname then name = GetLastName(source) 
elseif Config.job then name = GetJobName(source) end

  TriggerClientEvent('qb_rpchat:sendLocalOOC', -1, source, name, args, { 196, 33, 246 })

end)


RegisterCommand('me', function(source, args, raw)
  if source == 0 then
    print('qb_rpchat: you can\'t use this command from rcon!')
    return
  end
  args = table.concat(args, ' ')
  local name = GetCharacterName(source)
  if Config.firstname then name = GetPlayerName2(source) 
elseif Config.lastname then name = GetLastName(source) 
elseif Config.job then name = GetJobName(source) end

  TriggerClientEvent('qb_rpchat:sendMe', -1, source, name, args, { 196, 33, 246 })

end)

RegisterCommand('do', function(source, args, raw)
  if source == 0 then
    print('qb_rpchat: you can\'t use this command from rcon!')
    return
  end

  args = table.concat(args, ' ')
  local name = GetCharacterName(source)
  if Config.firstname then name = GetPlayerName2(source) 
elseif Config.lastname then name = GetLastName(source) 
elseif Config.job then name = GetJobName(source) end

  TriggerClientEvent('qb_rpchat:sendDo', -1, source, name, args, { 255, 198, 0 })
end)

RegisterCommand('sapd', function(source, args, rawCommand)
  local xPlayer = QBCore.Functions.GetPlayer(source)
  local toSay = table.concat(args, ' ')

  if xPlayer.PlayerData.job.name == Config.police then 
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="font-weight:bold;font-size:1.35vh;color: #54E0FF; margin: 0.05vw;">👮 Anuncio SAPD: <b style=color:#ffffff;font-weight:normal>{0}</div>',
          args = {toSay}
      })
  else 
    TriggerClientEvent('chat:addMessage', source, {
      template = '<div style="color: #FF3E32; margin: 0.05vw;"><i class="fas fa-exclamation"></i>  You need to work in police to use /police <i class="fas fa-exclamation"></i></div>',
      args = {}
    })
  end
end, false)

RegisterCommand('lssd', function(source, args, rawCommand)
  local xPlayer = QBCore.Functions.GetPlayer(source)
  local toSay = table.concat(args, ' ')

  if xPlayer.PlayerData.job.name == Config.sheriff then 
    TriggerClientEvent('chat:addMessage', -1, {
      template = '<div style="font-weight:bold;font-size:1.35vh;color: #54E0FF; margin: 0.05vw;">👮 Anuncio LSSD: <b style=color:#ffffff;font-weight:normal>{0}</div>',
        args = {toSay}
    })
else 
  TriggerClientEvent('chat:addMessage', source, {
    template = '<div style="color: #FF3E32; margin: 0.05vw;"><i class="fas fa-exclamation"></i>  You need to work in sheriff to use /sheriff <i class="fas fa-exclamation"></i></div>',
    args = {}
  })
end
end, false)

RegisterCommand('saed', function(source, args, rawCommand)
  local xPlayer = QBCore.Functions.GetPlayer(source)
  local toSay = table.concat(args, ' ')

  if xPlayer.PlayerData.job.name == Config.ambulance then 
    TriggerClientEvent('chat:addMessage', -1, {
      template = '<div style="font-weight:bold;font-size:1.35vh;color: #FF3838; margin: 0.05vw;">👨‍⚕️ Anuncio SAED: <b style=color:#ffffff;font-weight:normal>{0}</div>',
        args = {toSay}
    })
else 
  TriggerClientEvent('chat:addMessage', source, {
    template = '<div style="color: #FF3E32; margin: 0.05vw;"><i class="fas fa-exclamation"></i>  You need to work in ambulance to use /ems <i class="fas fa-exclamation"></i></div>',
    args = {}
  })
end
end, false)

RegisterServerEvent('qb_rpchat:chat')
AddEventHandler('qb_rpchat:chat', function(job, msg)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	firstname = Player.PlayerData.job.grade.name.. " " ..Player.PlayerData.charinfo.firstname
	lastname = Player.PlayerData.charinfo.lastname.. " "
	jobName = string.upper(job)
	local messageFull = {
        template = '<div style="font-weight:bold;font-size: 1.35vh;color: #54E0FF; margin: 0.05vw;"><i class="fas fa-headset"></i> [Interna SAPD] {1} {2} : <b style=color:#ffffff;font-weight:normal>{3}</font></i></b></div>',
        args = {jobName, firstname, lastname, msg}
    }
    TriggerClientEvent('qb_rpchat:Send', -1, messageFull, job)
end)
