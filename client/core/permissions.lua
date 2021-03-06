local PlayerData

---@param job string
---@param cb function
---@param force bool
function isAtJob(job, force)
    while ESX == nil do
        Citizen.Wait(5)
    end
    force = force or false
    if force then
        while not isPlayerLoaded() do
            Citizen.Wait(150)
        end
        
        if PlayerData.job.name == job then
            return true
        else
            return false
        end
    else
        if PlayerData == nil then
            return false
        else
            if PlayerData.job ~= nil then
                if PlayerData.job.name == job then
                    return true
                else
                    return false
                end
            else
                return false
            end
        end
    end
end

exports('isAtJob',isAtJob)

---@param job string
---@param cb function
---@param force bool
function isAtJobGrade(job,grade, force)
    while ESX == nil do
        Citizen.Wait(5)
    end
    force = force or false
    if force then
        while not isPlayerLoaded() do
            Citizen.Wait(150)
        end
        if PlayerData.job.name == job then
            if PlayerData.job.grade_name == grade then
                return true
            else
                return false
            end
        else
            return false
        end
    else
        if PlayerData == nil then
            return false
        else
            if PlayerData.job ~= nil then
                if PlayerData.job.name == job then
                    if PlayerData.job.grade_name == grade then
                        return true
                    else
                        return false
                    end
                else
                    return false
                end
            else
                return false
            end
        end
    end
end

exports('isAtJobGrade',isAtJobGrade)

function getPlayerJob(force)
    while ESX == nil do
        Citizen.Wait(10)
    end
    force = force or false
    if force then
        while not isPlayerLoaded() do
            Citizen.Wait(150)
        end
        return PlayerData.job
    else
        if PlayerData == nil then
            return false
        else
            if PlayerData.job ~= nil then
                return PlayerData.job
            else
                return false
            end
        end
    end
end

exports('getPlayerJob',getPlayerJob)

function getPlayerData(force)
    while ESX == nil do
        Citizen.Wait(10)
    end
    force = force or false
    if force then
        while not isPlayerLoaded do
            Citizen.Wait(150)
        end
        local xPlayer = ESX.GetPlayerData()
        PlayerData = xPlayer
        return xPlayer
    else
        if PlayerData ~= nil then
            return PlayerData
        else
            return {}
        end
    end
end

exports('getPlayerData',getPlayerData)

function isPlayerLoaded()
    if PlayerData ~= nil then
        return true
    else
        return false
    end
end

exports('isPlayerLoaded',isPlayerLoaded)

function getPlayer()
    while ESX == nil do
        Citizen.Wait(10)
    end
    return ESX.GetPlayerData()
end

exports('getPlayer',getPlayer)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded',function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob',function(job)
    if PlayerData == nil then
        PlayerData = getPlayerData(true)
    end
    PlayerData.job = job
end)
