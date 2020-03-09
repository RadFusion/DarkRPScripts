--[[

    CREATED BY RAD FUSION    
    
    If you have any issue or suggestion, DO NOT hesitate to contact me :D
    https://steamcommunity.com/id/csssin/

]]

util.AddNetworkString("rf_chatprint")
function fRadChat(ply, str)
    net.Start("rf_chatprint")
    net.WriteString(str)
    net.Send(ply)
end

hook.Add("PlayerSay", "rs_chopshopst", function(ply, text)
    local lang = RSconfig.Translate
    local timerid = "rs_chopshop_sell"
    local coolid = "rs_chopshop_cool_"..ply:SteamID64()
    if text == RSconfig.sellingcommand then
        if table.HasValue(RSconfig.thiefjob, ply:Team()) then 
            if !timer.Exists(coolid) then
                if !timer.Exists(timerid) then
                    local car = ply:GetEyeTrace().Entity
                    if car:IsVehicle() then
                        if ply ~= car:CPPIGetOwner() then
                            local ppos = ply:GetPos()
                            if ppos:WithinAABox(RSconfig.chopshop[1], RSconfig.chopshop[2]) then
                                local dist = ppos:Distance(car:GetPos())
                                if dist < RSconfig.distance then
                                    if RSconfig.autowanted then
                                        ply:wanted(nil, RSconfig.wanted)
                                    end
                                    fRadChat(ply, lang[1])
                                    fRadChat(ply, lang[2])
                                    timer.Create(timerid, RSconfig.selltimer, 1, function()
                                        car:Remove()
                                        local cost = math.random(RSconfig.minpay, RSconfig.maxpay)
                                        local mul = 100
                                        if RSconfig.isvcmod then
                                            mul = math.Round(car:VC_getHealth(true))
                                            cost = (mul * 0.01) * cost
                                        end
                                        if mul <= RSconfig.minhealth then
                                            fRadChat(ply, lang[3] .. DarkRP.formatMoney(RSconfig.scrappay) .. lang[4])
                                            cost = RSconfig.scrappay
                                        else
                                            if RSconfig.isvcmod then
                                                fRadChat(ply, lang[6] .. DarkRP.formatMoney(cost) .. lang[7] .. lang[13] ..  mul .."%)")
                                            else
                                                fRadChat(ply, lang[6] .. DarkRP.formatMoney(cost).. lang[7])
                                            end
                                        end
                                        ply:addMoney(cost)
                                        timer.Create(coolid, RSconfig.cooldown, 1, function()
                                            return
                                        end)
                                    end)
                                    timer.Create(timerid.."S", 0.1, (RSconfig.selltimer * 10) -5, function()
                                        local posp = ply:GetPos()
                                        local ddis = car:GetPos():Distance(posp)
                                        if (not posp:WithinAABox(RSconfig.chopshop[1], RSconfig.chopshop[2])) or (ddis > RSconfig.distance) then
                                            fRadChat(ply, lang[8])
                                            timer.Destroy(timerid)
                                            timer.Destroy(timerid.."S")
                                        end
                                    end)
                                else
                                    fRadChat(ply, lang[9])
                                end
                            else
                                fRadChat(ply, lang[10])
                            end
                        else
                            fRadChat(ply, lang[11])
                        end
                    else
                        fRadChat(ply, lang[12])
                    end
                else
                    fRadChat(ply, lang[14])
                end
            else
                fRadChat(ply, lang[15])
            end
        else
            fRadChat(ply, lang[16])
        end
    end
end)