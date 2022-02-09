local Thread = {}

function Thread:Wait(t)
	return task.wait(t)
end

function Thread:Spawn(func, ...)
	return task.spawn(func, ...)
end

function Thread:Delay(t, callback)
	return task.delay(t, callback)
end

return Thread
