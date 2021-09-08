-- put every thing down here in the top of your code

spawn(function() -- console rich text enabler
    if shared.did then return end
    shared.did = true
    
    local function f(i,v)
        v = v or i
        if not v:FindFirstChild('msg') then return end
        local function set(v)
            if v.msg.RichText then return end
            v.msg.RichText = true
        end
        
        v.msg.RichText = true
        v.msg:GetPropertyChangedSignal('RichText'):Connect(set)
        v.msg:GetPropertyChangedSignal('Visible'):Connect(set)
        v.msg:GetPropertyChangedSignal('Text'):Connect(set)
    end
    while true do
        local a = game:WaitForChild('CoreGui')
        a:WaitForChild('DevConsoleMaster'):WaitForChild('DevConsoleWindow')
        local a = a.DevConsoleMaster.DevConsoleWindow:WaitForChild('DevConsoleUI')
        a:WaitForChild('MainView')
        a.MainView:WaitForChild('ClientLog').ChildAdded:Connect(f)
        table.foreach(a.MainView.ClientLog:GetChildren(),f)
        repeat wait() until not (a and a:FindFirstChild('MainView'))
    end
end)
