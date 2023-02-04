
local QBCore = exports['qb-core']:GetCoreObject()

function GetCharacterName(source)
  local Player = QBCore.Functions.GetPlayer(source)
      if Player then
          return Player.PlayerData.charinfo.firstname..' '..Player.PlayerData.charinfo.lastname
      end
  end
function GetPlayerName2(source)
    local Player = QBCore.Functions.GetPlayer(source)
        if Player then
        return Player.PlayerData.charinfo.firstname
    end
end
function GetPlayerNameSteam(source)
	return GetPlayerName(source)
end
function GetLastName(source)
        local Player = QBCore.Functions.GetPlayer(source)
            if Player then
        return Player.PlayerData.charinfo.lastname
    end
end
function GetJobName(source)
        local Player = QBCore.Functions.GetPlayer(source)
            if Player then
        return Player.PlayerData.job.label
    end
end