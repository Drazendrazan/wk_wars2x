local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('dispatch:sendBlip')
AddEventHandler('dispatch:sendBlip', function (coords, id, alert)
    --print "llega"
    TriggerClientEvent('dispatch:createblip', -1, coords, id , alert)
end)


RegisterServerEvent("dispatch:sendAlert")
AddEventHandler("dispatch:sendAlert", function(text, coords, id, name)

    TriggerClientEvent('dispatch:clNotify', data, id)
    TriggerClientEvent("dispatch:alertToClient", -1, text, coords, id)
end)

RegisterServerEvent("dispatch:sendAmbuAlert")
AddEventHandler("dispatch:sendAmbuAlert", function(text, coords, id)
    TriggerClientEvent("dispatch:auxToClient", -1, text, coords, id)
end)

RegisterServerEvent("dispatch:sendMecaAlert")
AddEventHandler("dispatch:sendMecaAlert", function(text, coords, id, phone)
    TriggerClientEvent("dispatch:mecaToClient", -1, text, coords, id, phone)
end)

RegisterServerEvent("dispatch:sendVehRob")
AddEventHandler("dispatch:sendVehRob", function(coords, model, cl1, cl2, id, plate)
    TriggerClientEvent("dispatch:vehToClient", -1, coords, model, cl1, cl2 , id, plate)
end)

RegisterServerEvent("dispatch:sendVehSpeed")
AddEventHandler("dispatch:sendVehSpeed", function(coords, model, cl1, cl2, id, plate)
    TriggerClientEvent("dispatch:vehToClientspeed", -1, coords, model, cl1, cl2 , id, plate)
end)

RegisterServerEvent("dispatch:sendTaxiaAlert")
AddEventHandler("dispatch:sendTaxiaAlert", function(text, coords, id, phone)
    TriggerClientEvent("dispatch:taxiToClient", -1, text, coords, id, phone)
end)

RegisterServerEvent("dispatch:sendRobaAlert")
AddEventHandler("dispatch:sendRobaAlert", function(type, coords, id)
    TriggerClientEvent("dispatch:robberyToClient", -1, type, coords, id)
end)

--[[
QBCore.Commands.Add('911pp', Lang:t("commands.o_report"), {{name='message', help=Lang:t("commands.message_sent")}}, false, function(source, args)
	local src = source
	if args[1] then message = table.concat(args, " ") else message = Lang:t("commands.civilian_call") end
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local players = QBCore.Functions.GetQBPlayers()
    for k,v in pairs(players) do
        if v.PlayerData.job.name == 'police' and v.PlayerData.job.onduty then
            local alertData = {title = Lang:t("commands.emergency_call"), coords = {coords.x, coords.y, coords.z}, description = message}
            TriggerClientEvent("qb-phone:client:addPoliceAlert", v.PlayerData.source, alertData)
            TriggerClientEvent('police:client:policeAlert', v.PlayerData.source, coords, message)
        end
    end
end)
]]


QBCore.Commands.Add('entorno', 'entorno', { { name = 'entorno', help = 'Descripcion del entorno' } }, false, function(source, args)
    local src = source
    local text = table.concat(args, " ")
    local name = "hakos test"
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local playerCoords = GetEntityCoords(ped)
    local players = QBCore.Functions.GetQBPlayers()
    TriggerEvent("dispatch:sendAlert", text, coords, src, name)
    print ('entorno enviado')
    TriggerEvent('dispatch:sendBlip', playerCoords, source, 'entorno')
end, false)


QBCore.Commands.Add("forzar", ' Forzar vehiculo', { }, false, function(source,args)
    local src = source
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local playerCoords = GetEntityCoords(ped)
    local players = QBCore.Functions.GetQBPlayers()
    local vehicle = GetVehiclePedIsIn(ped, false)
    -- print (vehicle)
    local color = GetVehicleColours(vehicle)
    local plate = QBCore.Shared.Trim(GetVehicleNumberPlateText(vehicle))

    local cl1, cl2 = GetVehicleColours(vehicle)
    print (GetVehiclePedIsIn(ped,false))

    local klk = tostring(color)
    local finalColor = Config.Colors[klk]
 
    if GetVehiclePedIsIn(ped,false) ~= 0 then
  
        local suerte = math.random(0,1)
        local vehicle = GetTypeCar(vehicle)
        print (vehicle)
        if suerte then
            print "pasa"
           --[[ GetNameVeh(src)]]  
            print (plate)
           -- TriggerEvent('dispatch:mensaje_chat')
            TriggerEvent("dispatch:sendVehRob", coords, vehicle, cl1, cl2 , src, plate)
            TriggerEvent('dispatch:sendBlip', playerCoords, source, 'forzar')
 
        print ('entorno enviado')
           -- for k,v in pairs(players) do 
            --TriggerClientEvent("qb-phone:client:addPoliceAlert", v.PlayerData.source, alertData)
           -- TriggerClientEvent('police:client:policeAlert', v.PlayerData.source, coords, message)
            --TriggerClientEvent('dispatch:createblip', playerCoords, source, 'entorno')
            --TriggerEvent('dispatch:mensaje_chat')
          --  end
        end

    end
end, 'user')


QBCore.Commands.Add("veh", 'Exceso de velocidad', { }, false, function(source,args)
    local src = source
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local playerCoords = GetEntityCoords(ped)
    local players = QBCore.Functions.GetQBPlayers()
    local vehicle = GetVehiclePedIsIn(ped, false)
    -- print (vehicle)
    local color = GetVehicleColours(vehicle)
    local plate = QBCore.Shared.Trim(GetVehicleNumberPlateText(vehicle))

    local cl1, cl2 = GetVehicleColours(vehicle)
    print (GetVehiclePedIsIn(ped,false))

    local klk = tostring(color)
    local finalColor = Config.Colors[klk]
 
    if GetVehiclePedIsIn(ped,false) ~= 0 then
  
        local suerte = math.random(0,1)
        local vehicle = GetTypeCar(vehicle)
       -- print (vehicle)
        if suerte then
            --print "pasa"
           --[[ GetNameVeh(src)]]  
           -- print (plate)
           -- TriggerEvent('dispatch:mensaje_chat')
            TriggerEvent("dispatch:sendVehSpeed", coords, vehicle, cl1, cl2 , src, plate)
            TriggerEvent('dispatch:sendBlip', playerCoords, source, 'forzar')
 
       -- print ('entorno enviado')
           -- for k,v in pairs(players) do 
            --TriggerClientEvent("qb-phone:client:addPoliceAlert", v.PlayerData.source, alertData)
           -- TriggerClientEvent('police:client:policeAlert', v.PlayerData.source, coords, message)
            --TriggerClientEvent('dispatch:createblip', playerCoords, source, 'entorno')
            --TriggerEvent('dispatch:mensaje_chat')
          --  end
        end

    end
end, 'user')





QBCore.Commands.Add("auxilio", ' llama a un medico', { { name = 'auxilio', help = 'Llamada a los medicos' } }, false, function(source, args)
    local src = source
    local ped = GetPlayerPed(src)
    
    local text = table.concat(args, " ")

    local coords = GetEntityCoords(ped)
    local id = src
    local playerCoords = GetEntityCoords(ped)
  --  print (playerCoords)
   -- TriggerEvent('dispatch:mensaje_chat')
   if args[1] then message = table.concat(args, " ") else message = "un ciudadano herido" end
    TriggerEvent("dispatch:sendAmbuAlert", text, coords, id)
   --[[ TriggerServerEvent('dispatch:blip',{
        x = QBCore.Math.Round(playerCoords.x, 1),
        y = QBCore.Math.Round(playerCoords.y, 1),
        z = QBCore.Math.Round(playerCoords.z, 1)
    }, 'auxilio')]]
    local players = QBCore.Functions.GetQBPlayers()
    for k,v in pairs(players) do
        if v.PlayerData.job.name == 'ambulance' and v.PlayerData.job.onduty then
            TriggerEvent('dispatch:sendBlip', playerCoords, source, 'auxilio')
           -- TriggerClientEvent('hospital:client:ambulanceAlert', v.PlayerData.source, coords, "")
        end
    end
end, false)

QBCore.Commands.Add("taxi", ' llama a un taxi', {{ name = 'taxi', help = 'Llamada al servicio de taxi' } }, false, function(source, args)
    local src = source
    local ped = GetPlayerPed(src)
    local Player = QBCore.Functions.GetPlayer(src)
    local phone = Player.PlayerData.charinfo.phone
    local text = table.concat(args, " ")

    local coords = GetEntityCoords(ped)
    local id = src
    local playerCoords = GetEntityCoords(ped)
   -- TriggerServerEvent('dispatch:mensaje_chat')
    TriggerEvent("dispatch:sendTaxiaAlert", text, coords, id, phone)
    TriggerEvent('dispatch:sendBlip', playerCoords, source, 'taxi')
    --[[TriggerServerEvent('dispatch:blip',{
        x = QBCore.Math.Round(playerCoords.x, 1),
        y = QBCore.Math.Round(playerCoords.y, 1),
        z = QBCore.Math.Round(playerCoords.z, 1)
    }, 'taxi')]]
end, false)

QBCore.Commands.Add("mecanico", ' llama a un mecanico', {{ name = 'mecanico', help = 'Lamada al servicio de mecanicos' } }, false, function(source, args)
    local src = source
    local ped = GetPlayerPed(src)
    
    local text = table.concat(args, " ")
    local Player = QBCore.Functions.GetPlayer(src)
    local phone = Player.PlayerData.charinfo.phone

    local coords = GetEntityCoords(ped)
    local id = src
    local playerCoords = GetEntityCoords(ped)
    --TriggerServerEvent('dispatch:mensaje_chat')
    TriggerEvent("dispatch:sendMecaAlert", text, coords, id, phone)
    TriggerEvent('dispatch:sendBlip', playerCoords, source, 'meca')
    --[[TriggerServerEvent('dispatch:blip',{
        x = QBCore.Math.Round(playerCoords.x, 1),
        y = QBCore.Math.Round(playerCoords.y, 1),
        z = QBCore.Math.Round(playerCoords.z, 1)
    }, 'meca')]]    
end, false)

---- //// reparar

QBCore.Commands.Add("tiroteo", 'descriptcion de la persona', { { name = 'tiroteo', help = 'Descripcion de la persona' } }, false, function(source, args)
    local src = source
    local ped = GetPlayerPed(src)
    local text = table.concat(args, " ")
    local Player = QBCore.Functions.GetPlayer(src)
    local coords = GetEntityCoords(ped)
    local id = src
    local playerCoords =  GetEntityCoords(ped)
    local text = "Se ha visto a varias personas " .. args[1] .. " tiroteándose con armas de fuego."


    --local playerCoords = GetEntityCoords(PlayerPedId(src))
    TriggerEvent("dispatch:sendAlert", text, coords, id)
    TriggerEvent('dispatch:sendBlip', playerCoords, source, 'entorno')
   --[[ TriggerServerEvent('dispatch:blip',{
        x = playerCoords.x,
        y = playerCoords.y,
        z = playerCoords.z
    }, 'entorno')]]
   -- ExecuteCommand('ooc Se ha enviado una llamada de entorno')
    --TriggerServerEvent('dispatch:mensaje_chat')
end, false)



QBCore.Commands.Add("polidispo", 'solicitar policia', { },false, function(source, args)
    local src = source
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local id = src
    local text = "El servicio de Inteligencia informa de un posible robo"
    local playerCoords = coords
    TriggerEvent("dispatch:sendAlert", text, coords, id)
    TriggerEvent('dispatch:sendBlip', playerCoords, source, 'entorno')
    --ExecuteCommand('ooc Se ha enviado una llamada de entorno')
   -- TriggerServerEvent('dispatch:mensaje_chat')
end, false)



function GetTypeCar(vehicle)
   local vehicle =  GetVehicleType(vehicle)
    if vehicle == 'automobile' then
        vehicle = 'coche'
    elseif vehicle == 'bike' then
        vehicle = 'Moto'
    elseif vehicle == 'boat' then
        vehicle = 'Barco'

    elseif vehicle == 'heli' then
        vehicle = 'Helicoptero'
    elseif vehicle == 'plane' then
        vehicle = 'Avion'
    elseif vehicle == 'submarine' then
        vehicle = 'Submarino'
    elseif vehicle == 'trailer' then
        vehicle = 'Camion'
    elseif vehicle == 'train' then
        vehicle = 'Tren'
    else
        vehicle = 'No se muy bien que ha robado'
    end
    return vehicle

end

