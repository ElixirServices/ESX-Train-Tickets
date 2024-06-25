if Config.ESX == true then

    ESX = nil

    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

    RegisterNetEvent("bur_train:buyTicket")
    AddEventHandler("bur_train:buyTicket", function()
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)
        if xPlayer.getMoney() >= TicketPrice then
            xPlayer.removeMoney(TicketPrice)
        else
            xPlayer.showNotification(Translation['nomoney'])
        end
    end)

    RegisterNetEvent("bur_train:buyTicketBank")
    AddEventHandler("bur_train:buyTicketBank", function()
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)
        xPlayer.removeAccountMoney('bank', TicketPrice)
    end)

end