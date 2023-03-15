--tam gdzie jest 0.0,0.0,0.0 zmień sobie na koordynaty, gdzie ma być hologram
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		local playerPos = GetEntityCoords(PlayerPedId(), true)
        local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, 0.0,0.0,0.0)
        if distance < 9.0 then
            Draw3DText( 0.0,0.0,0.0, "~b~HOLOGRAM TEXT", 4, 0.1, 0.1)
		end
    end
end)


function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
	local scale = (1/dist)*20
	local fov = (1/GetGameplayCamFov())*100
	local scale = scale*fov
	SetTextScale(scaleX*scale, scaleY*scale)
	SetTextFont(fontId)
	SetTextProportional(1)
	SetTextColour(0, 0, 250, 255)
	SetTextDropshadow(1, 1, 1, 1, 255)
	SetTextEdge(2, 0, 0, 0, 150)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(textInput)
	SetDrawOrigin(x,y,z+2, 0)
	DrawText(0.0, 0.0)
	ClearDrawOrigin()
end

