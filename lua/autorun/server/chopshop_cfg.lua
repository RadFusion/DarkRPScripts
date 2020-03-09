--[[

    CREATED BY RAD FUSION    
    
    If you have any issue or suggestion, DO NOT hesitate to contact me :D
    https://steamcommunity.com/id/csssin/

]]

RSconfig = {} -- Do not touch this

RSconfig.thiefjob = { TEAM_MOB , TEAM_GANG } -- They can sell the car. do not remove '{}'
--                   Please keep this space like: { TEAM_JOB , TEAM_JOB2 , TEAM_JOB3 }
--                   or script will not work.

RSconfig.isvcmod = true -- if your server running vcmod, dealer will pay per vehicle's health.

RSconfig.sellingcommand = "/sell" -- The thief can type '/sell' while looking vehicle to selling vehicle. 

RSconfig.chopshop = { -- ChopShop's Vector Pos. the thief must sell vehicle here.
                        -- You can get Vectorpos from 'cl_showpos 1' Console command.
    Vector(12646, -3513, -13732), -- First end corner point of box
    Vector(12062, -3880, -13231)  -- #2
}

RSconfig.autowanted = true -- do wanted thief when selling car?
RSconfig.wanted = "Car theft" -- wanted reason when car selling.

RSconfig.distance = 300 -- If thief move away this distance from the vehicle while trading, trade will fail.

RSconfig.minpay = 30000 -- dealer will pay random money(defalt: 30000 ~ 50000)
RSconfig.maxpay = 50000

RSconfig.minhealth = 30 -- (0~100%)if vehicle's health low then this percentage,  dealer will pay RSconfig.scrappay 
RSconfig.scrappay = 5000

RSconfig.selltimer = 30 -- The time it takes to sell vehicle.(seconds)
RSconfig.cooldown = 500 -- how long to wait for sell vehicle again?(seconds)

RSconfig.Translate = {
    [1] = "It takes ".. RSconfig.selltimer .. "seconds to sell the vehicle !",
    [2] = "If you leave chopshop or vehicle is exit chopshop, vehicle trading will fail.",
    [3] = "You got",
    [4] = " because the car parts were too low !",
    [6] = "You earned",
    [7] = " by selling the stolen vehicle !",
    [8] = "The trade was failed because you left chopshop!",
    [9] = "You are too far from the vehicle.",
    [10] = "Vehicles can only be sold at chopshop.",
    [11] = "You cannot sell your own vehicle.",
    [12] = "You have to look at the vehicle!",
    [13] = "(Car health: ",
    [14] = "Someone is already trading with dealer !",
    [15] = "You cannot sell NOW. you need to wait more moment !",
    [16] = "This job is unable to selling vehicle !"
}
