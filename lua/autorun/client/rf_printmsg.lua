net.Receive("rf_chatprint", function()
    local str = net.ReadString()
    chat.AddText(Color(255,0,0), "[ChopShop] ", Color(255,255,255), str)
end)