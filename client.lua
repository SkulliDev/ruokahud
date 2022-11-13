local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local status = nil
local r,g,b,a = 30,136,229,255 -- สี R G B

RegisterNetEvent('ui:toggle')
AddEventHandler('ui:toggle', function(show)
    SendNUIMessage({action = "toggle", show = show})
end)

RegisterNetEvent('displaymap')
AddEventHandler('displaymap', function()
    DisplayRadar(true)
end)

RegisterNetEvent('hidemap')
AddEventHandler('hidemap', function()
    DisplayRadar(false)
end)

Citizen.CreateThread(function()
    while true do
        
        Citizen.Wait(1000)
        
        SendNUIMessage({
            show = IsPauseMenuActive(),
            health = (GetEntityHealth(GetPlayerPed(-1))-100),
            stamina = 100-GetPlayerSprintStaminaRemaining(PlayerId()),
            st = status,
        })
    end
end)
------------
-- E N D ---
------------

RegisterNetEvent('emilia-customui:updateStatus')
AddEventHandler('emilia-customui:updateStatus', function(Status)
    status = Status
    SendNUIMessage({
        action = "updateStatus",
        st = Status,
    })
end)
------------
-- E N D ---
------------

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
     local ped = GetPlayerPed(-1)
     local health = GetEntityHealth(ped)
     local armor = GetPedArmour(ped)
     SendNUIMessage({
        heal = health,
        armor = armor
     });
  end
end)
------------
-- E N D ---
------------

RegisterNetEvent('esx_gps:addGPS')
AddEventHandler('esx_gps:addGPS', function()
		SendNUIMessage({action = "toggleCar", show = true})
		DisplayRadar(true)
end)

RegisterNetEvent('esx_gps:removeGPS')
AddEventHandler('esx_gps:removeGPS', function()
		SendNUIMessage({action = "toggleCar", show = false})
		DisplayRadar(false)
end)

RegisterNetEvent('esx_customui:notify')
AddEventHandler('esx_customui:notify', function()
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
	SendNUIMessage({action = "notify", show = true})
	Citizen.Wait(11000)
	SendNUIMessage({action = "notify", show = false})
	end
end)