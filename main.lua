-- put every thing down here in the top of your code

spawn(function() -- console rich text enabler
    if shared.did then return end
    shared.did = true
    local function f(i,v)
        v = v or i
        if not v:FindFirstChild('msg') then return end
        v.msg.RichText = true
        v.msg:GetPropertyChangedSignal('RichText'):Connect(function()
            if v.msg.RichText then return end
            v.msg.RichText = true
        end)
    end
    
    local a = game:WaitForChild('CoreGui')
    
    while wait() do
        a:WaitForChild('DevConsoleMaster'):WaitForChild('DevConsoleWindow')
        local a = a.DevConsoleMaster.DevConsoleWindow:WaitForChild('DevConsoleUI')
        
        a:WaitForChild('MainView')
        a.MainView:WaitForChild('ClientLog').ChildAdded:Connect(f)
        table.foreach(a.MainView.ClientLog:GetChildren(),f)
    end
end)
