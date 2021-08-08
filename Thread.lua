--------------------------------------------------------------------------
-- @ CloneTrooper1019, 2020-2021
--   Thread.lua
--------------------------------------------------------------------------

local Thread = {}

--------------------------------------------------------------------------
-- Task Scheduler
--------------------------------------------------------------------------

local RunService = game:GetService("RunService")
local front

-- use array indices for speed
-- and avoiding lua hash tables

local THREAD = 1
local RESUME = 2
local NEXT = 3

local function pushThread(thread, resume)
	local node =
	{
		[THREAD] = thread;
		[RESUME] = resume;
	}
	
	if front then
		if front[RESUME] >= resume then
			node[NEXT] = front
			front = node
		else
			local prev = front
			
			while prev[NEXT] and prev[NEXT][RESUME] < resume do
				prev = prev[NEXT]
			end
			
			node[NEXT] = prev[NEXT]
			prev[NEXT] = node
		end
	else
		front = node
	end
end

local function popThreads()
	local now = os.clock()
	
	while front do
		-- Resume if we're reasonably close enough.
		if front[RESUME] - now < (1 / 120) then
			local thread = front[THREAD]
			front = front[NEXT]
			
			coroutine.resume(thread, now)
		else
			break
		end
	end
end

RunService.Heartbeat:Connect(popThreads)

--------------------------------------------------------------------------
-- Thread
--------------------------------------------------------------------------

local errorStack = "ERROR: %s\nStack Begin\n%sStack End"

local function HandleError(err)
	local trace = debug.traceback()
	warn(errorStack:format(err, trace))
end

function Thread:Wait(t)
	local t = tonumber(t)
	
	if t then
		local start = os.clock()
		pushThread(coroutine.running(), start + t)
		
		return coroutine.yield() - start
	else
		return RunService.Heartbeat:Wait()
	end	
end

function Thread:Spawn(func, ...)
	local args = { ... }
	local numArgs = select('#', ...)
	local bindable = Instance.new("BindableEvent")
	
	bindable.Event:Connect(function (stack)
		xpcall(func, HandleError, stack())
	end)
	
	bindable:Fire(function ()
		return unpack(args, 1, numArgs)
	end)
end

function Thread:Delay(t, callback)
	self:Spawn(function ()
		local delayTime, elapsed = self:Wait(t)
		xpcall(callback, HandleError, delayTime, elapsed)
	end)
end

--------------------------------------------------------------------------

return Thread
